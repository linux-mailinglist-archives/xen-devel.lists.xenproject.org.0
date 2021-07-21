Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DA43D0722
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 05:08:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159090.292664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m62aI-0001dd-D1; Wed, 21 Jul 2021 03:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159090.292664; Wed, 21 Jul 2021 03:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m62aI-0001b6-9F; Wed, 21 Jul 2021 03:07:46 +0000
Received: by outflank-mailman (input) for mailman id 159090;
 Wed, 21 Jul 2021 03:07:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KCq8=MN=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m62aG-0001b0-4c
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 03:07:44 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.72]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42334e26-89c8-405f-8a0b-c25d03c68101;
 Wed, 21 Jul 2021 03:07:41 +0000 (UTC)
Received: from AM5PR0601CA0034.eurprd06.prod.outlook.com
 (2603:10a6:203:68::20) by AM0PR08MB4082.eurprd08.prod.outlook.com
 (2603:10a6:208:12e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Wed, 21 Jul
 2021 03:07:37 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::27) by AM5PR0601CA0034.outlook.office365.com
 (2603:10a6:203:68::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Wed, 21 Jul 2021 03:07:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 03:07:37 +0000
Received: ("Tessian outbound 809237f40a36:v99");
 Wed, 21 Jul 2021 03:07:36 +0000
Received: from 17dd34495fa5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BA448684-2EEE-437C-8760-FFA6C456FCFC.1; 
 Wed, 21 Jul 2021 03:07:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 17dd34495fa5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 21 Jul 2021 03:07:25 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB3728.eurprd08.prod.outlook.com (2603:10a6:803:bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Wed, 21 Jul
 2021 03:07:23 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 03:07:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 42334e26-89c8-405f-8a0b-c25d03c68101
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hY6lHsML2Rr/1O9BW5xaXM59VzTJ6otPAHbmYXQNjqw=;
 b=5E8sdZXMPOOphuKGJtXXM56KMnq+q0StPhSQRYH5rHnyeCFzV+fqRGZjxp4fMK1nuoMSj/MGhi6iETDCnnlStTPT4i90VgwkqGh03RotkZnJ7omydtFpW6xMHE/6LtzN4AvP20+prMdKxjJ/KM/oqVTTyx+Vgo/vitx5sk6CgsY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3WWs6kL+osF9QTWtgrXMe4IAfe5YJ7lSHU3Fet91WRoAYtebOXY3tn8VS+vXvbpDS8z2quZkCcELRdgRw5q/48Gpl7n3yhB92M32rFltVxQzdxdGvN/jqyXKOhahI28SgKuiiLHV0brAHW3Gatl4tbspgI8lA/o7Lmm6wqEANLe7UKo4n+zWRrE4BBkA9tzli2g8JIinIxOQjI+/Pkc6gfx8M6mLeZPSlfKnaIe/WXM3VT3b8yncZEhEjCeDb9mMUZ6q5q7VYcRIXhBUy77cwowQjx+i0iL/X5xQ9YFz5P/vSUIJWeDgx3NPujOlqd3pOJQFgrVJoTANy2H+2LoVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hY6lHsML2Rr/1O9BW5xaXM59VzTJ6otPAHbmYXQNjqw=;
 b=YbcEa89xhdQ4QN8SllTV8JlBXAU0vcGx7YRTYfcrcT2I/7QLyZ4lU8pZMjwbZ/5H93QlYiMIQ1+YHNzG8Ri3A6R0saPhI/RHkjk/emeFWLZa1AUrDWkPSyzV6D8kI9SWChB/fySp4VSbpAbU1+emqz08beuQNV3Da9ZSdUogWUhbgafCYBnHPv0lcHUv12MQ2hTlj/hYx6VqBjVcmaW5aLoTFVoU4CUfkRjFPxR6bAHxH2nMVTn57DY/WZt+5ety9hR5Bv8ER+deE+s8AYuuSe4koJp4MLnwnZ1x1ZKqcRzUGXNuXuMro93HenSnhp1THTfCJAaqbrQvRM99vLLAew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hY6lHsML2Rr/1O9BW5xaXM59VzTJ6otPAHbmYXQNjqw=;
 b=5E8sdZXMPOOphuKGJtXXM56KMnq+q0StPhSQRYH5rHnyeCFzV+fqRGZjxp4fMK1nuoMSj/MGhi6iETDCnnlStTPT4i90VgwkqGh03RotkZnJ7omydtFpW6xMHE/6LtzN4AvP20+prMdKxjJ/KM/oqVTTyx+Vgo/vitx5sk6CgsY=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>
Subject: RE: [PATCH V3 05/10] xen/arm: static memory initialization
Thread-Topic: [PATCH V3 05/10] xen/arm: static memory initialization
Thread-Index: AQHXeTjh4qg0299wLkKAahDScdsA96tJ+1UAgALJChA=
Date: Wed, 21 Jul 2021 03:07:23 +0000
Message-ID:
 <VE1PR08MB52156DCB9D06B07718ACF9D4F7E39@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210715051819.3073628-1-penny.zheng@arm.com>
 <20210715051819.3073628-6-penny.zheng@arm.com>
 <295913d9-5727-2ec7-ca20-70b94c53309d@suse.com>
In-Reply-To: <295913d9-5727-2ec7-ca20-70b94c53309d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 731F13F59FB5B04BB996FC8388A73E7F.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c3b266ef-4c0e-4265-735c-08d94bf4b177
x-ms-traffictypediagnostic: VI1PR08MB3728:|AM0PR08MB4082:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4082A5D5A321BA341011B46DF7E39@AM0PR08MB4082.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:449;OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ErD5vEzPujsWIbF6x254PBaSqwc4Eta60+Ib+kEXWdk95ZRXsJ3IdbdGpYJZdJyywBVLJ6hB8Um0U0KOMZ4THVqrOoT4Gay5YQiXd5PKImLba+JEVPYgRzFLfOqFXvDgYGbuctsx7YR4toLhjTY9eAt5WyLM2jNox3Kjj1l+fwhvANTKIPvzYHTTuPNwSp5S14sj4LMnqd0LF4Tmg8f0UCeIJfvCk0BQvd+zsFPTFMmMQCkY9FzHBVuMnUvFf6nk+ETs/WcxwYw9OnJfU1fnWoJs5mFdE0nMSfWpbUrncqMgbDsjdJ5MBzfsDMGZbC71pLwJbZnyq8WTU52zv6+f0ZZKfP57p948hMP8ViS1jE6OrVRn0+BKkwX6Wt5M/zM222yDkv5fIas11SHaXjueX5ZhDb4v75NyEBijQ/P1AC07BC+3m6JhA6UZgh6+6YEqL3YwQ+3T/DKGxM6MM4DS0LA3nR+ZxyXhWwGjPkaVzApUs/iznmINUEHRDUMFxYkS8b91tlFOdoT4JDlYwlUEDQN9kYtdEQQkq4nPPJDS1U2xN0AYrMwv5x6GypnRdHBddo6LZeAXmdK/yaZB2FOFMYbrouBOJXqklOV1lvxEax8PVX8cGZx5nyMrvRiKLGSxkk8UBq/CUEl3XBlp4KAB9FoGCZd8OIYfnWarUP28i6f6gqeWdr0i72y8ImuE/y+3Y2yMIzH7k4brOCkmJBLgpQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39850400004)(346002)(376002)(66446008)(71200400001)(8936002)(2906002)(4326008)(5660300002)(7696005)(26005)(122000001)(64756008)(66556008)(6916009)(66476007)(186003)(66946007)(478600001)(33656002)(316002)(86362001)(76116006)(54906003)(8676002)(53546011)(52536014)(6506007)(55016002)(38100700002)(83380400001)(9686003)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YmpuVklkbUI3STdoYlNmT0lIMnpxYzAvWU1GSUR1Y1dNSEhWQ2k3MVFOYkN4?=
 =?utf-8?B?a0RDbUJXNmVmVTNEQzRzTTdSQUw3T1J6TENwcTJFNlVvVEFXSFF1VjhuV1Vv?=
 =?utf-8?B?U29YYU5lZWs5ZGxSM2RLL1VHQ2VVMmlGQm1jZWZtNExqVmwwRHNvVk8weVhH?=
 =?utf-8?B?SGJUcGVoTE5qN2h4eW9DN2R5d01DandXOEpuVFRGN2dYMFYrdGxOWUtzVkhh?=
 =?utf-8?B?R29CTnhzRzBjaHUrRXhpZ1hNMGlpSXNlQ3FzNFlDQU1USHR3NUlnWXI0SEFD?=
 =?utf-8?B?WmNuQnFxbnFVVGlBNG9aRUJGVGZCT1NIS3lGZThjb1BKUkMvdmZYd3BVQ3Uz?=
 =?utf-8?B?NWo0TS9wKzgvY3hTa2lVcFo1MytQbFJrMEZnbllmMnhvbHRwU0NYclAvVDdI?=
 =?utf-8?B?SEdjUTY4M1IvSWs5Qm9tODRNZDhSa3hyNnlBMVZkaHNOQlduejE1UTJEVTIx?=
 =?utf-8?B?a3NJVEhnMnlYOFQzNkI1UytGazVYaGdJcEhPUjZTUjEzQXhJNy84eFRCYXI3?=
 =?utf-8?B?bmRVQ3N2OTVDUXBhRVhvV1YyUE15Q3JZOTNKeDRSQ1RDT2JtWTYwTzhhS0N6?=
 =?utf-8?B?d1lpenBFQkxscjZiWGwvU1ZJKzBCdWFBZUYyUUo4cHEwTzlBR0tWejJ5NWRC?=
 =?utf-8?B?M0czaDNvcGFEUklGZ0pDQk5rbG9vdm5xR25KMjBTSXkvekdFL3kxRExBWXNE?=
 =?utf-8?B?bUFCSmZuR2J0bU1PUTc0VS9CVkR6cWUyTXBUTXhjMmh2YlNwV20zMjN2anhs?=
 =?utf-8?B?dEJXVXR4RkhqK3JhbHArYmFTTm1uUWlkak5mRjMvOHgvbEpvSnVkWkZvL0hV?=
 =?utf-8?B?V2djTnRGT2FVYzlERzFYQStzT0dMbzBMZWVHVE0xVVVNL1FDaklRZmJna2xx?=
 =?utf-8?B?YUdBNEhWZ2EzZHhndjFMZWY3bUEyZ0JxSVBPWlBwTk5OSitKcm9ub3cyeTF2?=
 =?utf-8?B?QmUreGhORVdvVGVxemhOVzVFeW1RdUpVa2RmMGZHcklnTGhGRkxPUTBJM1Yz?=
 =?utf-8?B?TUpDSDJ4Q01UTEo1bmYwVlhmd2hDVXF1VTdpdlZZMDYrUVp2alRYcWRGcytP?=
 =?utf-8?B?YWRnTGFEZm94Y1RFZFIyYW9PV3JRVnBYUkova2FqNHYxOEVtaHZBUm8vV2pl?=
 =?utf-8?B?NWVKMkliUkpuNXRNZTY3RHdoRU8wY2U4WkFOQlhpQ2hwWkYxS29ZcXlSQUdG?=
 =?utf-8?B?Z2d5NW8vMElSTml0VEdmZExaOThmOUEyeE5yYy9qUU5KY0tmQ0FoRnBIdkV6?=
 =?utf-8?B?U2NPbzg2WXlBc0FmVy9KZnBlcGYyMVBHc3E1a25zVFpZSWtEb2VRTjlNK3dF?=
 =?utf-8?B?VFJORG5IVU0zVWY5NkU2bmZ3K0ZoaURza2ZNMFY2TThnSHQ4enV0a0gxdjY1?=
 =?utf-8?B?Tkw4V2NuNUVLRW8rajJmQ05QK3ZBaURlbEJXRWRpWVl5WHRLcHFldjZhUGRt?=
 =?utf-8?B?ck1rTERNVzQ4Unp0T1hjc0pUQXdJZmRMelZ0dXR4cklVWUtJajhmb3VKNmRa?=
 =?utf-8?B?aUVSVmVrVEh3U1dwWWt1blVFWkRnRk8weGJhdXNyNW5aa1M0S3JTNTMvWU1I?=
 =?utf-8?B?VzlQcElDRnQ1aU5JSllVRGo1OGxhQmx6bGJIdnZycXFUMk9nd21JL3JiQ1lV?=
 =?utf-8?B?U25GbVRNTGRlNysrMnUyWEw0anhPeVZwOFFGdWJTNU50czRkYnQ2czJNTVFY?=
 =?utf-8?B?angyTmpTTDM2YzZ1TGdZV1VoM3ZSM2k1cUFGUVZCVEg3b2I4c1c0TFJtWnRG?=
 =?utf-8?Q?mFKZXjPxmJEO6I4tDU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3728
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	625c8c9e-7cc2-4156-75d9-08d94bf4a937
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dqHxwTD/4H7tby551PJUBrIWJL7oCJgwxcPJr8c/9ZoQ4NTgJ57/ep5L3jAomH0U87ykyJfqbcMRJspacqAN1epL3d7jxlM4wmuHobuqkILihNVBEC5ALnrvcRxYWvlS3oCylLXH1sAlp4eDV394ypDTOA8U7+HrtM48sc0pqiPTn7MzZqKS/Jp9HLGrh6uNVQz6bvx+qw/XSmv3tPPNCn6RzluafC8G9lMW2Si2Ai8jVmAT/qQSM1T/i1VuF1MKDGlyQT3dR4lwh/3FMsKhHOuo6KMxvK2n1zM2R4w9l8kY67kIMtE7wmLNATcz8pTlBxBVk4mOMIimtJtBooKMX3L1eQMR6XkODdzBYJB9xnNOKrScnzZSiPcgUig8CEmYFGLT5ZcTMIcV6AudL/fxdpzvvO4DOYCYRXVH6T/p4E8wDEBjrWSHKedAl1L75tdmMccyCS+hAws35Nvy5OXsRHudoN/O8rM4LZ4RFqwwcH+0D1v/sr/e3U9iFHIPhMO9Dd0mx9rfRHqHrTWcwYG9HJ9f4epOUhaHXOoP9cIwum8DK+x+94dWgjjiKMLpvILn0xO0/Rn+pny2Kdoe3Dc+JcthlV/A3yJ1JqfWkx8VgZg2Hi5MFPE4CwOPZISIeu6yUzpRZuWxz8B6EHL2w7AGMYvIU8+FANeVRBUw9otKjyJlJZurXdNGBKysx9lO4r/4121SMbKsSZ0msUkZuD/rAQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(136003)(376002)(36840700001)(46966006)(356005)(8676002)(81166007)(7696005)(5660300002)(8936002)(47076005)(82310400003)(336012)(83380400001)(2906002)(86362001)(55016002)(478600001)(9686003)(36860700001)(70206006)(186003)(316002)(26005)(4326008)(6862004)(70586007)(6506007)(82740400003)(53546011)(52536014)(33656002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 03:07:37.0485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b266ef-4c0e-4265-735c-08d94bf4b177
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4082

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bHkgMTksIDIwMjEgNDoy
MCBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBCZXJ0
cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8V2Vp
LkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIFYzIDA1LzEwXSB4ZW4vYXJtOiBzdGF0aWMgbWVtb3J5IGluaXRpYWxp
emF0aW9uDQo+IA0KPiBPbiAxNS4wNy4yMDIxIDA3OjE4LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4g
PiB2MyBjaGFuZ2U6DQo+ID4gLSBpbmNsdWRlIGFkZGl0aW9uIG9mIENPTkZJR19TVEFUSUNfQUxM
T0NBVElPTiBpbiB0aGlzIGNvbW1pdCwgd2hlcmUNCj4gPiBpdCBpcyBmaXJzdGx5IHVzZWQgYW5k
IGFsc28gY2hhbmdlIHRoZSBuYW1lIHRvIENPTkZJR19TVEFUSUNfTUVNT1JZDQo+ID4gLSBGaXgg
VEFCIHR5cG8gaW4gS2NvbmZpZw0KPiANCj4gTm90IHN1cmUgd2hhdCB0aGlzIHJlbGF0ZXMgdG8s
IGJ1dCAuLi4NCj4gDQoNCkJlZm9yZSBJIHdhcyB3cm9uZ2x5IHVzaW5nICIgc2V0IHRhYnN0b3A9
NCAiIGZvciBLY29uZmlnIGZpbGUsIHNvLi4uDQoNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vS2Nv
bmZpZw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+ID4gQEAgLTEwNiw2ICsxMDYs
OSBAQCBjb25maWcgVEVFDQo+ID4NCj4gPiAgc291cmNlICJhcmNoL2FybS90ZWUvS2NvbmZpZyIN
Cj4gPg0KPiA+ICtjb25maWcgU1RBVElDX01FTU9SWQ0KPiA+ICsgICAgICAgIGRlZl9ib29sIHkN
Cj4gDQo+IC4uLiB0aGlzIGlzICh3cm9uZ2x5KSB1c2luZyBzcGFjZXMgZm9yIGluZGVudGF0aW9u
Lg0KPiANCj4gSSBhbHNvIHdvbmRlciBhYm91dCB0aGUgcGxhY2VtZW50OiBTaG91bGRuJ3QgdGhl
IG9wdGlvbiBsaXZlIGluIGNvbW1vbiBjb2RlLA0KPiB3aXRoIEFybSAic2VsZWN0ImluZyBpdD8N
Cj4gDQoNClN1cmUsIEkgd2lsbCBwbGFjZSBpdCBpbiB4ZW4vY29tbW9uL0tjb25maWcsIGFuZCBh
ZGQgImRlcGVuZHMgb24gQVJNIi4NCg0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+
ID4gKysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4gPiBAQCAtNjIyLDYgKzYyMiwyOCBAQCBz
dGF0aWMgdm9pZCBfX2luaXQgaW5pdF9wZHgodm9pZCkNCj4gPiAgICAgIH0NCj4gPiAgfQ0KPiA+
DQo+ID4gKy8qIFN0YXRpYyBtZW1vcnkgaW5pdGlhbGl6YXRpb24gKi8NCj4gPiArc3RhdGljIHZv
aWQgX19pbml0IGluaXRfc3RhdGljbWVtX3BhZ2VzKHZvaWQpIHsNCj4gPiArICAgIHVuc2lnbmVk
IGludCBiYW5rOw0KPiA+ICsNCj4gPiArICAgIC8qIFRPRE86IENvbnNpZGVyaW5nIE5VTUEtc3Vw
cG9ydCBzY2VuYXJpby4gKi8NCj4gPiArICAgIGZvciAoIGJhbmsgPSAwIDsgYmFuayA8IGJvb3Rp
bmZvLnN0YXRpY19tZW0ubnJfYmFua3M7IGJhbmsrKyApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAg
ICAgcGFkZHJfdCBiYW5rX3N0YXJ0ID0gYm9vdGluZm8uc3RhdGljX21lbS5iYW5rW2JhbmtdLnN0
YXJ0Ow0KPiA+ICsgICAgICAgIHBhZGRyX3QgYmFua19zaXplID0gYm9vdGluZm8uc3RhdGljX21l
bS5iYW5rW2JhbmtdLnNpemU7DQo+ID4gKyAgICAgICAgcGFkZHJfdCBiYW5rX2VuZCA9IGJhbmtf
c3RhcnQgKyBiYW5rX3NpemU7DQo+ID4gKw0KPiA+ICsgICAgICAgIGJhbmtfc3RhcnQgPSByb3Vu
ZF9wZ3VwKGJhbmtfc3RhcnQpOw0KPiA+ICsgICAgICAgIGJhbmtfZW5kID0gcm91bmRfcGdkb3du
KGJhbmtfZW5kKTsNCj4gPiArICAgICAgICBpZiAoIGJhbmtfZW5kIDw9IGJhbmtfc3RhcnQgKQ0K
PiA+ICsgICAgICAgICAgICByZXR1cm47DQo+ID4gKw0KPiA+ICsgICAgICAgIGZyZWVfc3RhdGlj
bWVtX3BhZ2VzKG1hZGRyX3RvX3BhZ2UoYmFua19zdGFydCksDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAoYmFua19lbmQgLSBiYW5rX3N0YXJ0KSA+PiBQQUdFX1NISUZULA0KPiA+
ICsgZmFsc2UpOw0KPiANCj4gSW5kZW50YXRpb24gKG9uZSB0b28gZmV3IHNwYWNlcykuIFBlcmhh
cHMgYWxzbyBjb25zaWRlciB0byBhdm9pZCBvcGVuLWNvZGluZw0KPiBQRk5fRE9XTigpIGhlcmU7
IGluIGZhY3QgaXQgYW5kIFBGTl9VUCgpIGNvdWxkIGJlIHVzZWQgaW4gcGxhY2Ugb2YNCj4gcm91
bmRfcGd7ZG93bix1cH0oKSBhYm92ZS4NCj4gDQoNClN1cmUuIEkgd2lsbCByZXBsYWNlIHJvdW5k
X3Bne2Rvd24sdXB9KCkgd2l0aCBQRk5fRE9XTigpL1BGTl9VUCgpLg0KDQo+IEphbg0KDQpDaGVl
cnMNCg0KUGVubnkgWmhlbmcNCg==

