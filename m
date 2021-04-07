Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4722356D25
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 15:20:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106664.203946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU86q-0001W2-G4; Wed, 07 Apr 2021 13:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106664.203946; Wed, 07 Apr 2021 13:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU86q-0001Vd-C1; Wed, 07 Apr 2021 13:20:40 +0000
Received: by outflank-mailman (input) for mailman id 106664;
 Wed, 07 Apr 2021 13:20:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uIxC=JE=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lU86o-0001VY-PN
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 13:20:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::60e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec8ae955-761f-4b8f-9049-83d5eadfab98;
 Wed, 07 Apr 2021 13:20:37 +0000 (UTC)
Received: from DB6PR1001CA0048.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::34)
 by AM8PR08MB5698.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Wed, 7 Apr
 2021 13:20:32 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::20) by DB6PR1001CA0048.outlook.office365.com
 (2603:10a6:4:55::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 7 Apr 2021 13:20:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 13:20:32 +0000
Received: ("Tessian outbound 4ee49f77c636:v90");
 Wed, 07 Apr 2021 13:20:32 +0000
Received: from c72fff4cc9ab.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 08B90229-378C-4F72-9182-324782FE9017.1; 
 Wed, 07 Apr 2021 13:20:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c72fff4cc9ab.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Apr 2021 13:20:25 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR0801MB1630.eurprd08.prod.outlook.com (2603:10a6:800:59::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 7 Apr
 2021 13:20:13 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c%6]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 13:20:13 +0000
Received: from [10.57.56.195] (217.140.99.251) by
 LO2P265CA0318.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Wed, 7 Apr 2021 13:20:12 +0000
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
X-Inumbo-ID: ec8ae955-761f-4b8f-9049-83d5eadfab98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEebKDub3F8KWGtdwDqIa3AZxv2AKbsuXHCG8kU85nI=;
 b=b5eXcWgr3i9BHlsQZyA57nzI+IJCTzVZET3/hhRU2xWfhAQsiwLW+JuZ89T9u+iW3HjJ4IjotWel4mZUfBAtMqUzLeC24UBMezf+UHN62GzW8w3s5DGd8ARkxiH3oUvTo7H2lsSLvfaE7c+iN2jXoIE4SaeM0go0C7ppqIIEifw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: bbdadd4ae92aa31e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOdfWtrD9dEaDhbRgfdBdPyqnkROrYz8xY6R5zU+OFf0YqXS9ta6HWGVNnpDA9BONm1y5dVgcOs6MldRWpfz+DeWkQGnZpWccowmOP4F/yFBx/vMy6HU+BKf/xoROd+bWixYmnaFzQdiI1PdO0jKS3VpdsJ4sDrJ6IddK3B4omtWiczt2jvcJhrDP2HqgsprucJftWv9Y9NbnZHHWAIVSTzGYiMyht+nLmQkmBUznQEbpJklBg3CCl7TVNzI3VbFOUMB5BxHh8UIgt7hvIJI6ZPSHFgct8fTCT9U26+iMbX4XGoOoefBxActQTzXQCacp937UZSI7qyAp6mM8YIGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEebKDub3F8KWGtdwDqIa3AZxv2AKbsuXHCG8kU85nI=;
 b=aY9k6dHa97scoFvkjRFzCszYc/S4jbaWknanShii72BR3kgBOgUfayJk3OOLAtoht0nq/Racc0SC261hBIM2MqHkLmFCOCt8eltFWmZ16q98UviQaVpiM0rh6FgX7RsCBPu3cZYdRydc2Dva5HmAHFsQqD6Lq+4n2K5cjp3e7xzp0pa74+hu8ytFYwHKXC4oWtRfwszSFDPqzPMxSkteZOKoQ8Ld9yTMxkzyypJ0KPfBk9Oe+u88rjv1PQ7+MjySVvP7qa6VZeM7Jt/AqMSNjjlRfLx8KC6yTwtRNorOLIm216QHsPCsRZ2JX4ftK8eGX8K91F5jdv/NfNkJo0mUCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEebKDub3F8KWGtdwDqIa3AZxv2AKbsuXHCG8kU85nI=;
 b=b5eXcWgr3i9BHlsQZyA57nzI+IJCTzVZET3/hhRU2xWfhAQsiwLW+JuZ89T9u+iW3HjJ4IjotWel4mZUfBAtMqUzLeC24UBMezf+UHN62GzW8w3s5DGd8ARkxiH3oUvTo7H2lsSLvfaE7c+iN2jXoIE4SaeM0go0C7ppqIIEifw=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <7f143615-acdf-5a97-5e07-57cab49031d6@xen.org>
Date: Wed, 7 Apr 2021 14:19:58 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0F20064C-418C-4A4F-9883-4452A726B038@arm.com>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
 <7f143615-acdf-5a97-5e07-57cab49031d6@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0318.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::18) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8afa918c-660a-45fc-3801-08d8f9c7ec12
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1630:|AM8PR08MB5698:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB56984D68EB2F86EEA300D922E4759@AM8PR08MB5698.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kDZkz9bUfaGcNq0bsIi2yuQocqOOLfgry7V66O6BImEnaWyJY4zmK3MZ5n3i6xv1VRzguO609InoOBq72s6fZT48wo9D8VY7t949dC4dGG4Ri/PiiERktU5ZMOrjUiz0eY6iVhxMJd00hX4anYeGFzaJzCCcbqOy2NO3ngUJypH8M5HwYcivYKHOg54QmSBdIyhqdF/X6F/iLNCld2maICl7jHHVhXeTFURNDT+6HxyfxI2mQ/3MvHiTv/vt001gURGbJATLHvZUVVukN5Cqwvd0Sl6Fez9zxKoZzoxO7xUdRJCZS/U5ngc+GBooBP+Sr18CgUhLzUg3i9IRGoj5jcBSN7CZyBWyousAqtLq/o4ulx1+Rmlvo9J2avB+24WPNAEonKGMMD9qcYclctQJqQKkNoRIjTzOV82XcOxXu6mnbkfDAuTF+0xqm7BzQ44/sy8YV9Xv0AGjcUOLb0iWKfiZCEZmIfzFDTQ3pdSDjXqVlCTTGrpYB4/P+2t8PjcLz6VBxXdBGHdNE9p56IHugjZXj5hw0zRnaQ2U1zNFMeNdGIjANvW0Q6Eb9123RXAmC/F7NlD6CB2DWPnSw7K83ZS1Tmnhde3DrMTNtvmuhurT4niZWensdUqBNbOwvRa0zBNZngEsBflna3EH6g7W8fRo+3pkPauxlkqmRNMHW1HEAcv7D9lFc5Gd+qIVZh0N2B4TCz/qBiFRPNk2um+xQyDAcxFkSUBnegWhKDE8VTc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(8936002)(44832011)(86362001)(52116002)(53546011)(38350700001)(83380400001)(2906002)(4744005)(16526019)(186003)(6916009)(54906003)(478600001)(4326008)(36756003)(2616005)(956004)(26005)(38100700001)(316002)(33656002)(16576012)(66946007)(66556008)(66476007)(5660300002)(8676002)(6486002)(6666004)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?cTdBSHBkWkhuMVQrRFl3UTlRYXh6MHZrV1FZRy9PcXhnWEZrYlJaNFVGY0NW?=
 =?utf-8?B?UmNjV0lyZjJQN295eENPeFB6aE9keUpBYXFwbVdja25WZmNBREdKVElmVEJL?=
 =?utf-8?B?VWgwQ1hSK040WmdFNDNZVzByR0dUa2psN3pLQmd0dGVRaEw0ZnVjVEhqSWlr?=
 =?utf-8?B?N0VkVEE2L1RWdTRFZDgwZENrMXYwcndTWmpBQ0FXR0pnenlNNStwK2ZDZTk4?=
 =?utf-8?B?SVNRY3ZXcU9SWEUwVGNtT2V4NEZnNTdIWW92N1RmeDhPTWcvQWtQaEo2Q3hE?=
 =?utf-8?B?OEdjaUxMNGJwS3l4dlVLTmFtZEFlUG0vd1MzNUp0Q280MUpybVd6d3RabEFV?=
 =?utf-8?B?R29UTSs0ejBNMjh4QkFhdFNGbzFHcS8zS1VLaExlMGxnM0pFM2lTcHlrYUJK?=
 =?utf-8?B?WUFXd01rQkh0aTg4cVJFSkgwMW13VFlNMXA4Mk5XNStNem55cEl1YW9Fb3Rm?=
 =?utf-8?B?S0ZXYmhUemgxM09xNklKRUFTUDQvRTllbG1nL0dxWW9wYTVZVThkRHFCYUxi?=
 =?utf-8?B?SFo3MVBOSFdEZFM2WmZhcGZjRHZCVjlRaDVPTXJjNGovN0pEWEUyZVlTUmVO?=
 =?utf-8?B?WHVXMjJLTGhxOHpDZ2FlejJ6QitaZ3ZPU3V3dUtKZytvRFFsbEFzR0pnUVhu?=
 =?utf-8?B?VGwrRmJyTllzczVMdUpEY29xRHNCWEIveVIvRUFsWHlJNERybTZkcmErTXRn?=
 =?utf-8?B?WVkyYStuVCtkUHlGb25YM20yVE5UbDk1UzRuK0sraUtOU3hsVHRSNk1iSkFl?=
 =?utf-8?B?cXdlWGwxUzhJc3NpNHhxVXNwNm1HaElWdEpBZE1JTE1HTnRwVGJyNnorUTFa?=
 =?utf-8?B?c2tsUnFtWmJlZlpsSCsxWXBqcGk4cGJRY1llNWRGdmc3WFZJK1JaZFNiUzhQ?=
 =?utf-8?B?Z3U3T1k3Y0V5NkV0WS8wdmxOTDhIbStqNEtjTDZDdkVrV3Q4WTFaVzRzSVNa?=
 =?utf-8?B?NGpJYXJOVFNFaGd1K0VCQldoRXJjMjRhWEpFSEFPbWk2ZnNPaEUvNmdRRXE0?=
 =?utf-8?B?cG1yMkE2NEVCYnYxb3hxaEswNGI5Qy9JWHEyRnphQmdxS1BlTDdoMTduTXVt?=
 =?utf-8?B?NFlSL0RQc29zYU9uUzFMNVFjMmVJd0EyZUZCNFM2YVRxWjI0NHlESGtoVk1x?=
 =?utf-8?B?WnBCWHZTaGJXL0p4NVV1Vkdxc29UcklwVEgzejhJUXQwak5Vd3IvVWZQN0VC?=
 =?utf-8?B?eHNhZ1hGYUVBL0d1UnNlWlJtck5IUWFPeUdncXpUaG15QTFMbGE5Ym5QaWpX?=
 =?utf-8?B?SklGdWdpWkJlMFZhYmszY1FieHFDajgybnVSUEdCSC9sRmcvN3R3cDZFbE5v?=
 =?utf-8?B?RVNwWloxZWJZNm1SSzdHaDNWM2J2T1cxalE0UXljdWcxVUVCNnhKaUx5RW9s?=
 =?utf-8?B?MDZ0TlBHU0xmcFFsSXlVSEFIdzFBSG91V3JJS0N1SnRMY1NiWkNDQ1lOYlIy?=
 =?utf-8?B?dXJmMVdrcW8wc1djZllzOVVxbVdCeldRbVo3S3F1NXJ2OHRrWFhlTURtSThr?=
 =?utf-8?B?QTZjTE9qV1BrNG85Uk9IT1hnZGJ0aEhBRHRNcGVWbXpzSzh2VFVwVGlrSXpV?=
 =?utf-8?B?QWppWWRvbmRFM1J0c2cyY2Fsb1p6bDgvZkYzK3h4QzZxUllIUTk3VHl0blRJ?=
 =?utf-8?B?d3NWN29ycGRnenI5VXllMXZHV1k1T050aFRxSjBQSHVEYTFDYnpaZ2NaR29y?=
 =?utf-8?B?RTM4L01sSE5IL1dSRm94bXVyOENqRXlqY1p0Z3pvRVBqelJhYzc4T294U3Vh?=
 =?utf-8?Q?MtHxcVRp2bxHniO/Qajd70geYSlRxIwjqOKIlYb?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1630
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	03863efa-1864-4d29-f483-08d8f9c7e0a6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sqwS+at5fBLWxT91ik1qBaTdKCbgElkaTFG5pkNwe9X9mZkCK3I/V9rPVHU4JFoNxstM7AfwmRz7nNWwMTHVmJWePh3oIheQkhyrTdwDLlEGGjzYp0JCkWOT6wdMYnK0A/+lesLc6AdP1e6gOe6NwxZL+Mr9q7BjKLqc4pHIwndiYqY/muToT6R40GmQSqRVJAAeMm6nFbqGQSUKvcfaPczx7D1y6qkVKph6nZLd8oLdSItFxlNUQOrPqObhCckdRZ4/h6qW76CV26UTHtgsQ8Bxiwq53QuJnTqKYAK050pIDtStKgVr8yvr0kPOkYqcm0DKtCcUKs6cLmx4LcXvvpxQSmE2t6N1gKkahrgeKHhi+WFxyR6XCF49OnHthoRTRp96XsL2j1Mx5Gd3BHvZH585uNSWpwYXbN+Yv2eW/VXTlKPGf5b3JhA3mFqHrtU/wiNhjBnaPNcBwCDQWFIZ6La9dO/X0WxNn+O3o7xgdqwHcJ0Z08aQeWYIFHkc7/bGsTNTm107UM+glzMtNk8fAB0FJPTM1613ZOrBgHF6QbVaUIDqUBow+cuNVUCtTDQ7TeRxPVQjUpFWBzOwAZwSyeltGEhoceCCKhHeq12//tYzrxQS8iCGa6wyUXv0Gh2IWUnX13Q5EWFC+3tCfHzdGGqD+rF4+waqRhFdaZu25SU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(46966006)(36840700001)(82310400003)(6666004)(81166007)(2616005)(86362001)(316002)(16576012)(82740400003)(6862004)(186003)(47076005)(8676002)(16526019)(26005)(70586007)(53546011)(478600001)(2906002)(83380400001)(5660300002)(36756003)(4744005)(33656002)(44832011)(70206006)(4326008)(8936002)(956004)(36860700001)(356005)(54906003)(6486002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 13:20:32.7280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8afa918c-660a-45fc-3801-08d8f9c7ec12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5698



> On 7 Apr 2021, at 14:13, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 06/04/2021 11:36, Luca Fancellu wrote:
>> Modification to include/public/grant_table.h:
>> 1) Change anonymous structure to be named structure,
>>    because doxygen can't deal with them.
>=20
> What do you mean by can't deal with them? I had a quick try with doxygen =
build and couldn't find any failure (although I haven't looked at the outpu=
t).
>=20

Hi Julien,

The problem is that Doxygen can=E2=80=99t generate proper documentation for=
 anonymous union/structure, it ends up with warning and/or producing wrong =
documentation like
changing names or giving field description to the wrong field.

Cheers,
Luca

> Cheers,
>=20
> --=20
> Julien Grall


