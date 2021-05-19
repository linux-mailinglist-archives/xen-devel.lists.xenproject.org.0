Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E038E3886A2
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 07:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129853.243524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljErw-0005oi-Vy; Wed, 19 May 2021 05:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129853.243524; Wed, 19 May 2021 05:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljErw-0005kp-Rz; Wed, 19 May 2021 05:35:44 +0000
Received: by outflank-mailman (input) for mailman id 129853;
 Wed, 19 May 2021 05:35:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TeaP=KO=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1ljErv-0005kj-Ox
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 05:35:43 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.70]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d21f5dc-8b27-4d1a-a626-aeacd5c6730f;
 Wed, 19 May 2021 05:35:42 +0000 (UTC)
Received: from AM6PR08CA0044.eurprd08.prod.outlook.com (2603:10a6:20b:c0::32)
 by AM0PR08MB4146.eurprd08.prod.outlook.com (2603:10a6:208:129::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 05:35:37 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::a8) by AM6PR08CA0044.outlook.office365.com
 (2603:10a6:20b:c0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.33 via Frontend
 Transport; Wed, 19 May 2021 05:35:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 05:35:36 +0000
Received: ("Tessian outbound 504317ef584c:v92");
 Wed, 19 May 2021 05:35:36 +0000
Received: from 9259a0bf5ff6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 020C6141-DB80-46B2-9DB0-2C85A1C4728A.1; 
 Wed, 19 May 2021 05:35:30 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9259a0bf5ff6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 May 2021 05:35:30 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VE1PR08MB4669.eurprd08.prod.outlook.com (2603:10a6:802:a8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 05:35:27 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 05:35:27 +0000
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
X-Inumbo-ID: 8d21f5dc-8b27-4d1a-a626-aeacd5c6730f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+HouS1vdV1PlPvVgBL1LTnzyMBfsrJLb2gV+keXSvw=;
 b=Hidk6jU+u/Vb6jD3+JnCl7jkgq5S5OabmBipMFN8ExHJJsGOLQ22QicwDEIZC5qyNrP+1++VQZcUjjIj62i5V5sh6qcxgWDTK7CkPHSheRjQN7zb7GOrZuYnaeyCTc01S7ilO9UGqyct2PCL5pqta7Ye6E9LmzqTDkeWF2UXjx8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ef05ZaA89fKxGu1hLhSpqItVGXd9n51yo6rt3HGMOtKw/gV3vIogRS8HN3dAC1aSgfJkeCJFJt2jlsDpYmf5zJGQDMrqQnVZAyNUMq0OSKfOd62eh8Y6DD/VMszbKRzmpczFSJuRwbo+QeMyBzvNX5S7qAwHrfUwlm6WuoePeCIWzV+EOqqH9IRM1Zn56z40N4U4KmuBdHqUBL3XN9EaQjwmb2n6jUm32+14f/249e5a5CD1HplMH+VWWGMpG91AQk53eV4uFn9TQXxvsSslrL39SpTBnzxWTh1Y7MuQ4an5k6zFw/5xNabEPA4iJ3A7IJSYE+LKj3Ete3aAqeRz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+HouS1vdV1PlPvVgBL1LTnzyMBfsrJLb2gV+keXSvw=;
 b=L9lXcEWBEmnYyGgw+QpFVifdjy+06gIUNM1oXtA5YkBtARByZb1ujrdtYOwNM70ng7TtpCH6jTsxe+6rEEh0u5//m4WXf5HIgAz4lXRcZNSMyIza2BVBgg6tuGpBQ9QLQMDViM5oXsxh1dza2HP0vIAzCFij9xBPUXUdBwc0BRwhsEJhE3EE+HN5RsjHOTST/+LSBtl3/2IFaKkzitd2mbWpLdvbmnlRfvB7AvV5ciIqFw7S6TQMHgOLryT+9pAC4thP0BYSJKU3xzxGSA6TzcmxFzJiV8NxdGgh7wcunhsJkYH21tM86/ZCRylDiTY2qMXdTKbT7gZkZDKUJFbYKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+HouS1vdV1PlPvVgBL1LTnzyMBfsrJLb2gV+keXSvw=;
 b=Hidk6jU+u/Vb6jD3+JnCl7jkgq5S5OabmBipMFN8ExHJJsGOLQ22QicwDEIZC5qyNrP+1++VQZcUjjIj62i5V5sh6qcxgWDTK7CkPHSheRjQN7zb7GOrZuYnaeyCTc01S7ilO9UGqyct2PCL5pqta7Ye6E9LmzqTDkeWF2UXjx8=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH 06/10] xen: replace order with nr_pfns in assign_pages for
 better compatibility
Thread-Topic: [PATCH 06/10] xen: replace order with nr_pfns in assign_pages
 for better compatibility
Thread-Index: AQHXS6W5eIGNu7DPG0i7DMYwhf4hF6rpB5CAgAFAuBA=
Date: Wed, 19 May 2021 05:35:26 +0000
Message-ID:
 <VE1PR08MB52156E4C005F6B9675377548F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-7-penny.zheng@arm.com>
 <7dc01bcd-1570-82fa-5d15-11c28a857b3f@xen.org>
In-Reply-To: <7dc01bcd-1570-82fa-5d15-11c28a857b3f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 45F244372718734B9FA5144BEC341513.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7e2961a8-4cf9-4dc0-0fff-08d91a87ee40
x-ms-traffictypediagnostic: VE1PR08MB4669:|AM0PR08MB4146:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB41466CEC10CEAFD74516F81BF72B9@AM0PR08MB4146.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /LUPUxFxerRTzJFJ9uL1ZtLSQnpPO9D4ISf8IhOVCq2ZYF5E7rJUICNpYew6BHMbwV48UQWwVWWYEXugUx4I+NnFAYAryPbIqdCNdsHK7VRXEpDJ9kp2D54BQUuiG/GMAt+gkEG0Upva1+EKsoPOZcL7Silr6IuptIMYr0ppXs/QJPE4LwZEW/qM0tdxssg5R+SVajrDICW0STDgulZ4lyrX1J5adBfbZB+xl+MRJEWaAaqWRJb+XOMKC25lybTUMm3EmWDQl1Lxp8M7I2XGCTAxhqKLCYF3pNqXler9MByuM8CSOH0fUp4y1SrtUCPp1l+qO+esgHWaj1hMt6Es61wEqhS6HCSEY+o5ZqhYmXsMh1TgqvsNUVikw1wlGpiRQ4UJQHmQitc/7m+1BikwKyhS/A4qz8aUk9BObPPPthvsZOk34tiGMECY7rEto2BmvPwS42IgtWpqXHI8k1iIN5wypoURDIWS+2JA9/+qnLyd1RsC/wF3W9R1q/pfm+Yg4Zb74WMsMzsO0nKwRGbe21aNa1oIHl+TY7JaMUs2gL7LmD8Yt8JCwXfCZ0D3oBvmWy1beEPzWZepX6IOa2ZyTRWFBQs36pZrq+WinKSdrMQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(478600001)(33656002)(64756008)(5660300002)(8936002)(66556008)(66946007)(66476007)(76116006)(66446008)(71200400001)(26005)(86362001)(2906002)(8676002)(52536014)(38100700002)(7696005)(122000001)(186003)(316002)(4326008)(110136005)(54906003)(53546011)(55016002)(83380400001)(6506007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?ZUlzdmJOVC9QZTFPTDRzYjZYclBES0p2cVVGTUNtenRhNHp0V1VCR0RwRFlX?=
 =?utf-8?B?Z0xmWEI5RGNOOXQ1Rlp1Tm5aelRvMEpRM2tVS1cxcUdLUnNRMktOS3BWQ0Fn?=
 =?utf-8?B?NnI2azhrZTErZ3BBWFBwTjU5R3FzSE42b1NRaXB4VE10ejRnKzU0OWRZN1Q4?=
 =?utf-8?B?b2N2UHlwa2V4WkN6bnpCaEd5Y3A0Ym5TRWFuLzhhL3czSnYyUWN6L0NmMUdo?=
 =?utf-8?B?ckdneUs1ZHllaElkMFNtNU9Ha0xjQ2orR3NtVXludkRaTmdJMjJnY3FycmZE?=
 =?utf-8?B?aVI5Y3dhNHQ0dUx1WGpiMnZsSDZMZ3pNRlZqZ3N5SVdVSFhPVkJWZ2ZpV2tB?=
 =?utf-8?B?MVEwSFBkejVleXZtNmlQeGVJMHc1NFJpWTB5UFhiKzZHUS8rTnlVT0w3MGsy?=
 =?utf-8?B?b0FRR1AvQXpPMHZjazRRa2VwL1RzY09CNXlJOWZGZ0JaTXdoZ054R2NxdmNj?=
 =?utf-8?B?RWlEbDFvNnVuNVVPTFBpcXprQ05nWnNZdWYwczNyZWc4WnFyTnczMUNVTFpl?=
 =?utf-8?B?T2JoMFd2MHBzMUxtZHRvR1B0ZHBtSHlBVVcvcysxM2IyZU5mUG9pSU1YL0xQ?=
 =?utf-8?B?RGMyQnMvdFlSOUxRNWRCOEJEdm5UWGJocnNCaWI1RS8wWnlMYkNzclJoY0ty?=
 =?utf-8?B?dTN0TDJCakVLTGdka21zcE93SWlWQ21DSHdLSnd3b21BMEdGdndlMzFGTEJW?=
 =?utf-8?B?Z2ZZMDgrYXlsTWk0RGxxd1l6M0crTHdPdW1Ic3F4V1I2cTc5NFBvRnBnMlZ5?=
 =?utf-8?B?SlFhRzNGTVcrdkwyNVZNRVBQSlhNNTJJVDY4TUEzbDBBNEhCTkgzMmt3MnZL?=
 =?utf-8?B?a09xUHlNQ0xqbFN3NjVENS9uSDRZV2tWekhQV0krbVhRMitldkxiMit2VjN3?=
 =?utf-8?B?dEoyVkRmQkJRRDRoK0VZOTdMQm9BY2Z2SHdGc2NvNC9RMHpwWHBCWUd4cVc3?=
 =?utf-8?B?c0tsdjdQakFTWHZZYUh2NDJBMnNJNlptTXFqZlRTUEQ3c0FpTGVManBFZk9Q?=
 =?utf-8?B?ZS9SUjJGY2hNMDBsRmEzdnE1a0I1dUxjb0tyZ1dESDUwL21xWmdQRWJ6RGI2?=
 =?utf-8?B?N2RBYVVnZlRqbUhHOVRHRDd5NVJkVU5iRmhBSGVVeDZYUGRIK2crVm80YjY0?=
 =?utf-8?B?bElpb0VINnFvL0dtZENoQWVXRkFweVgrMGFjTWxoT200Y3dqb1hucUpoMEZi?=
 =?utf-8?B?Y1ZiMmh6aHBZSndwRXZNQ05DaWVMMndTY3kydjRYWGhQMVg3UndXYUluZ290?=
 =?utf-8?B?dDVjT3FtMDk1L3IxL1dXQUQ0bVNXdFpGZko1WjFCVXcwcDAwdUdSMmJ3d3ZI?=
 =?utf-8?B?Rm1ibE5xeU1qeWllVVBpalFjV0Vpemx5Vllvajk1RzlhNndEdkV1OEFjck9Z?=
 =?utf-8?B?eHhMTjBvNzJQK05Fb2k0dzFxTFJVNWc5Q0FDeWhNK2pUN2FSZ2UxbGtNRWJQ?=
 =?utf-8?B?cnlUTS9SMG5rN3JRMXJFeHZwUjhzcktjSjRZU2RWSmRpQW9uU3FQakJ0blRW?=
 =?utf-8?B?MU41MWNndzFoWWFrSVBqbXJPU2RCZktoVEJHYnRBS0k3LzBOeUJ6QlNMZXla?=
 =?utf-8?B?M3VmZ3FjMVhFeGdXNDJlK091VE4vdmJkRi80VUk4a3drdkVVdFlPM2FJY2tl?=
 =?utf-8?B?TWVQdyt0V3MwSEtubE8xR3ZUdmhqSjFDZEpLUmpYaTFHYU5kMzIzZ0ZEQXVw?=
 =?utf-8?B?dkR2SnFpQXAzZGlQakJyOFh3c21MNmhqUTZseXc4Yy9peEhhZkR4cjBuRmdF?=
 =?utf-8?Q?xk4Gfp7F1h6rzKOFz8F++oNHM6dNAktpFPkhGqc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4669
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4a79fd96-9d76-4028-1ba0-08d91a87e854
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qo3SIg9UO+E7aDiohW+livzI647TZFb3UPHCZDsAcQrdOiStI/TTFA4SJu5SHZb8PwVKKPNUPqLzQ7CnVITEDFUl65gaeifWOcuu6fM4bGYzcq+1h+sv+QTo68BukwxuprfI8/jQobrXhQyV5g6PyOrfQLahrhjsPhYGaoZWJJWkXPhejNOJjtwJeVqmEBuGwdlBAj5ZTNkq1MGJh0SbcD6MUVsAyudKdiBsOa6pCkFIjEf1ITIozww1pp+EOwa3rtiLQXCPGoiylBu0ZfwE5H1dDQpAuwlhr3HzjZvIyGqQXsaOeI90W5rBp8HoFnI06KznZm2ZVTXlYj7qVwv73Hb7kj2AYFNSZXN2N6Rp1JN7V30mGp8mZPvZhPyrysoNF/3vU8n+Zf672KT8VeoHHX8KTSW7fjKqRAv3CMITX6zHXsU7PqPJWL7y9cvAMWiD5LL7j0WMjx60RmDGEdA4vury91J0dbDVtQn4OQs1BATrI48q2XJfXAkWqyQ2CihKyvvBTJ6SKItRjBQ4uVS4Hs3AL6bYo41B3k92uYTTyKZBPnLr/FLF4i3hHU+blpo1KD2EoU4tXKxSgJGLi1aBP3HXYZ78p8gbIChc1HtIIWM6aR/FI7CWWIe3+n7D89eyqmJGheuuo0oVQUtyRyLxyg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966006)(36840700001)(70586007)(54906003)(478600001)(2906002)(9686003)(8676002)(55016002)(70206006)(356005)(83380400001)(81166007)(110136005)(316002)(4326008)(47076005)(53546011)(186003)(6506007)(26005)(82310400003)(7696005)(336012)(8936002)(82740400003)(36860700001)(33656002)(5660300002)(86362001)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 05:35:36.8059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2961a8-4cf9-4dc0-0fff-08d91a87ee40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4146

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgTWF5IDE4LCAyMDIxIDY6
MjEgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBC
ZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8
V2VpLkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDA2LzEwXSB4ZW46IHJlcGxhY2Ugb3JkZXIgd2l0aCBucl9wZm5zIGluIGFzc2lnbl9wYWdlcw0K
PiBmb3IgYmV0dGVyIGNvbXBhdGliaWxpdHkNCj4gDQo+IEhpIFBlbm55LA0KPiANCj4gT24gMTgv
MDUvMjAyMSAwNjoyMSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gRnVuY3Rpb24gcGFyYW1ldGVy
IG9yZGVyIGluIGFzc2lnbl9wYWdlcyBpcyBhbHdheXMgdXNlZCBhcyAxdWwgPDwNCj4gPiBvcmRl
ciwgcmVmZXJyaW5nIHRvIDJAb3JkZXIgcGFnZXMuDQo+ID4NCj4gPiBOb3csIGZvciBiZXR0ZXIg
Y29tcGF0aWJpbGl0eSB3aXRoIG5ldyBzdGF0aWMgbWVtb3J5LCBvcmRlciBzaGFsbCBiZQ0KPiA+
IHJlcGxhY2VkIHdpdGggbnJfcGZucyBwb2ludGluZyB0byBwYWdlIGNvdW50IHdpdGggbm8gY29u
c3RyYWludCwgbGlrZQ0KPiA+IDI1ME1CLg0KPiANCj4gV2UgaGF2ZSBzaW1pbGFyIHJlcXVpcmVt
ZW50cyBmb3IgTGl2ZVVwZGF0ZSBiZWNhdXNlIGFyZSBwcmVzZXJ2aW5nIHRoZQ0KPiBtZW1vcnkg
d2l0aCBhIG51bWJlciBvZiBwYWdlcyAocmF0aGVyIHRoYW4gYSBwb3dlci1vZi10d28pLiBXaXRo
IHRoZQ0KPiBjdXJyZW50IGludGVyZmFjZSB3b3VsZCBiZSBuZWVkIHRvIHNwbGl0IHRoZSByYW5n
ZSBpbiBhIHBvd2VyIG9mIDIgd2hpY2ggaXMgYQ0KPiBiaXQgb2YgcGFpbi4NCj4gDQo+IEhvd2V2
ZXIsIEkgdGhpbmsgSSB3b3VsZCBwcmVmZXIgaWYgd2UgaW50cm9kdWNlIGEgbmV3IGludGVyZmFj
ZSAobWF5YmUNCj4gYXNzaWduX3BhZ2VzX25yKCkpIHJhdGhlciB0aGFuIGNoYW5nZSB0aGUgbWVh
bmluZyBvZiB0aGUgZmllbGQuIFRoaXMgaXMgZm9yDQo+IHR3byByZWFzb25zOg0KPiAgICAxKSBX
ZSBsaW1pdCB0aGUgcmlzayB0byBtYWtlIG1pc3Rha2Ugd2hlbiBiYWNrcG9ydGluZyBhIHBhdGNo
IHRvdWNoDQo+IGFzc2lnbl9wYWdlcygpLg0KPiAgICAyKSBBZGRpbmcgKDFVTCA8PCBvcmRlcikg
Zm9yIHByZXR0eSBtdWNoIGFsbCB0aGUgY2FsbGVyIGlzIG5vdCBuaWNlLg0KPiANCg0KT2suIEkg
d2lsbCBjcmVhdGUgYSBuZXcgaW50ZXJmYWNlIGFzc2lnbl9wYWdlc19ucigpLCBhbmQgbGV0IGFz
c2lnbl9wYWdlcyB0byBjYWxsIGl0IHdpdGgNCjJAb3JkZXIuDQoNCj4gQ2hlZXJzLA0KPiANCj4g
LS0NCj4gSnVsaWVuIEdyYWxsDQoNCkNoZWVycw0KDQpQZW5ueSBaaGVuZw0K

