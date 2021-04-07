Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC6B35671D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 10:43:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106507.203678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU3m1-0008SH-P6; Wed, 07 Apr 2021 08:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106507.203678; Wed, 07 Apr 2021 08:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU3m1-0008Rs-LU; Wed, 07 Apr 2021 08:42:53 +0000
Received: by outflank-mailman (input) for mailman id 106507;
 Wed, 07 Apr 2021 08:42:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uIxC=JE=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lU3m0-0008Rn-6f
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 08:42:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.55]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b422f902-ff27-4859-b15b-bf3020749d36;
 Wed, 07 Apr 2021 08:42:49 +0000 (UTC)
Received: from DB6PR1001CA0028.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::14)
 by DBAPR08MB5751.eurprd08.prod.outlook.com (2603:10a6:10:1a0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Wed, 7 Apr
 2021 08:42:47 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::bf) by DB6PR1001CA0028.outlook.office365.com
 (2603:10a6:4:55::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 7 Apr 2021 08:42:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 08:42:46 +0000
Received: ("Tessian outbound 9bcb3c8d6cb1:v90");
 Wed, 07 Apr 2021 08:42:46 +0000
Received: from f2bc427544a8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DCD42511-C8B2-435D-B2FF-F507E3B00F5E.1; 
 Wed, 07 Apr 2021 08:42:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2bc427544a8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Apr 2021 08:42:35 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB2766.eurprd08.prod.outlook.com (2603:10a6:802:1a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Wed, 7 Apr
 2021 08:42:34 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c%6]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 08:42:34 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO2P123CA0085.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:138::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Wed, 7 Apr 2021 08:42:33 +0000
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
X-Inumbo-ID: b422f902-ff27-4859-b15b-bf3020749d36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btZT0UAffeikLWFNW3XKx6Hyd5QUnNhsO2TFqindxKk=;
 b=MZLy/FjuO67x8Hz+cs+6pxE0p0Sr4qqs4kX0lYJKGzZUOYsBrOXboDKA2kq1Q9aoahcsYQ84RVhm712k8XTRJ2wW5duW64bE0FE1kWZaBHoZjZztpb+d0dRnFjC9GUiO8C+r1UhXN2TQaWxTTdSh2KZO+s95SfYo6SYsVy/cPcE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b97bc6c00cbcdc7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIu4+qlBt6KDKu9+xHorjNAt/hKtmyHeKI+5ReHuodWuv7Lcm394CfZIi9ThxCxqNLPBvkFcsIja+yQbxWVCCPppCaGsYAdVqVCglcU42PCUzJ5jz8EZr9NeYojhqEwVE7VJRvSSzNxAAutg4iuePK1aNvC2j9j2wU9+2BhdOZZXhu7FdvkyMbBlnccLBHmfcQfyhEZR0hOYhG5HLX7qNLhP9JzR3cvw/v8PHw/iediUChsxO0k+gJ5OMXI/fwfdNAilf5/LBp8ariGV4l0h9tnUn5XIsgJ30oMQDHdd4OvlaIlQ/iA/PSDbPRZZpSph2Z2EW2mCfL4/xiXVu23hKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btZT0UAffeikLWFNW3XKx6Hyd5QUnNhsO2TFqindxKk=;
 b=H/B7ZfdhyNFLo0pIC+CD7xjqsZD9F5XHoVtM8uwlyoDhJ/1FedFsxQQ0SZm4pJUEWHXpB9yAj5JnZlEhMS1A+KWa/ihkLs+cSzlYBBUDf4el94uElabvKoGCXdpsCiO1uQvhfBXqee2VHE8Yb4lhYHGGuGZesIPXcxpJ1t6f/WTiSFhm7I40Uph21fkug62AcSVDE2eVddUGXsS6XbtJe0BLNkjaqCK+lUFhzFThIkVavWDSmynEQ4ddY72jgG9O74wzE4KAy2wO/J0CUwmp0dX31/Yx0C93vYMND3Yat+soH3L7bDdVO0FVvxUTud85KPANJ80v95QGypP83tW4ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btZT0UAffeikLWFNW3XKx6Hyd5QUnNhsO2TFqindxKk=;
 b=MZLy/FjuO67x8Hz+cs+6pxE0p0Sr4qqs4kX0lYJKGzZUOYsBrOXboDKA2kq1Q9aoahcsYQ84RVhm712k8XTRJ2wW5duW64bE0FE1kWZaBHoZjZztpb+d0dRnFjC9GUiO8C+r1UhXN2TQaWxTTdSh2KZO+s95SfYo6SYsVy/cPcE=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <e15ed7b9-b153-b767-e625-e7a9d2aa76bf@suse.com>
Date: Wed, 7 Apr 2021 09:42:23 +0100
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DF5BE432-F79E-4874-92DF-60A4DCD9EDBD@arm.com>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
 <073e28bc-ad94-429d-6384-744864d12b57@suse.com>
 <alpine.DEB.2.21.2104061425040.31460@sstabellini-ThinkPad-T480s>
 <e15ed7b9-b153-b767-e625-e7a9d2aa76bf@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P123CA0085.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::18) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c76edd4-f128-4104-5ee4-08d8f9a11e85
X-MS-TrafficTypeDiagnostic: VI1PR08MB2766:|DBAPR08MB5751:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB57517D6F076BF55376E2F944E4759@DBAPR08MB5751.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NK1GeXSx2Tn/Dm58pvA3x/oOaSj1XtlypLDkTuX8lUyNqNpR7/g8xtoe9gjv9nZ5z1Dbdwg2VQyWRmd5Fwofjs4G3QhfKRK5WSgouIM6ewuUXA7lKrBpqaHVj/Yn/6gX2JAP9LsL7Sq0jmAe3MvI90XR5x5xSY9f1aexJ+4kItIWKszw17hrgf4rPOwPOJK8nh8jCbIbT8LHT5lZGHwmS97ghILso8WcY++MJ1O2nGa0DKjl/yazH4z5oml2PbOb79XChTIFwy0DpzcGHcPiGuonR2PKdq7kRp5bAEiUNKG64QXNh4+L0I5rxi5LzBtaoiCBh1lJVXg54+J1tA8MBntrqahFMXkoUUBCuAj8WqlNOrXW9+NCbZkotiyJTkSj9CApCF6WWsVZkb5+58NENj8Hfez/YP15NlWgpAFlbro3h+69I1KBrHr69JspWx9vDJP/oFp0PVvyrkNm2+hmFClgJhgYI1mzFzORlEZzrT/Ct3L+pXPZzz5VucY1iyBa5V0OgcayNwLfN7qJlc2SU93wp0ivjpBA4rAsUeWazFZdyiPTf2M1NMnZWoZPomv5UL9dcQcnhIFXGFdVgHnwpygRUSyXP6eoFdB9D9TAtG1k3XXQBmy/98yhuVZfPdR2wTDOD3Zu6pxvX1c4TuZa6ufmwMnGNUfti3qHtF9r6+KGk7iDfzM81cfaaGWa/qHv6nQ9QQjd1hs7cDiI2r3Y/fUpygV62WEswTOjfYvFhuc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(8676002)(6666004)(5660300002)(53546011)(7696005)(52116002)(478600001)(66476007)(66946007)(6916009)(38350700001)(26005)(2906002)(66556008)(38100700001)(16526019)(186003)(83380400001)(2616005)(956004)(4326008)(33656002)(44832011)(316002)(6486002)(54906003)(86362001)(8936002)(36756003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?aysyVDZtb2U2WVV0ZTVjRU9HM3ZpVHRLUG15L1gybEJYSGM4SGVBNzZ4U1lI?=
 =?utf-8?B?V2NxMi9JcGlaQngzNTF5TVNzRmlQV0xCUTIrUWhMNEl5RG5TSVgxaFBheGI0?=
 =?utf-8?B?UnA5TDByZDVhVXgyNngzSkYzeW10VVFKNjhhWVBmUzdwQjdQNUJ5K08rS3Yv?=
 =?utf-8?B?N1l4QTBraC9FRlpyTHcxV1AyaXA5RUZPM2syK3pkNWJWNVhqcXpaM3lZa2pt?=
 =?utf-8?B?RTFUL3pVcWRSSlRqU3M2dDJENUJ0NzRXU3drTDlmdXpZamNEdmdNN1JuUEYz?=
 =?utf-8?B?djFRRmczNzdUdnBHUjZjUVVIeE5TaGk5ZmNtN2hLWW1sR3NYMFVKT0dxcnI5?=
 =?utf-8?B?Rm14cWE3QU02dEZkTnYyRVlraWlNbTA0aFFlWXhaYWRXelgrNStNbDFPYVNG?=
 =?utf-8?B?K0l1NnRHWVUrdlhETFBjcFh4VDFNN2hpak1GcHJmSlZkT1F3Y0lJQkFGZ3M3?=
 =?utf-8?B?Q01JbEVPT3VkckVIZ3gzb1JJdWwvT05Zb3JsLzdjQy83WGJaMkNtbktmZWV4?=
 =?utf-8?B?cHBHSzVnbkpBWWRBMWJycUJZcHErUWV5Z3lzeFMrL3hrN1FWTzg2bDBER0Jm?=
 =?utf-8?B?QjdOMEw5MVhXMUJNUWFGci9EYWVzcUZJYXBKMGtOeUJzVzBEYkJiK0h1OWtQ?=
 =?utf-8?B?eGNYUWY1YWtRNWx2dzl6NDUwR1FYekVRby81RWJrQmtSN3BzM28zVmxNNXVZ?=
 =?utf-8?B?bUcyaC9jcEhadE5yR2lTNU9TT2hENVJxSWphT2lpcmF5aVdURjNCRm1Nb3Fl?=
 =?utf-8?B?OHdGalFiVTh5YmhUQ2szYlpYdkxiVGpEOXN5a2xFWDVESVFjeWFkcDJiUUEz?=
 =?utf-8?B?UmRwUitncUdiNEdwMWI2NERKMlE2TVBNSjkxeVZMUmhWZy9qTkhKN04rTVFq?=
 =?utf-8?B?WmwyNVBqZnpVZUE1YUNPREEyZzdtcWtxRHhYajJkdE5KS3d5TU55Q3UweFEx?=
 =?utf-8?B?RkNJQmhDbjI1RHVjUW9NQXppRUJ3bmppNXdTSmZCTlJyQUFteUdSdUtWMXd5?=
 =?utf-8?B?ZUw1V1ZlZkJTTW0yUThlY2Fpd3JLUVNWS0NtSmZGNm9PakZTS0NWa2QrVmJ4?=
 =?utf-8?B?ZmlETzMvZTF4eGdDNnBKdDcyVmdCdGlOUFQ2bStsNHM0dVlXWnBLcndrRXB4?=
 =?utf-8?B?YXlZbEtaTWtiZEVQTTNCMFQybExITy9HRVdxbUkwYUdCY3hXN2pHUm9uRlBD?=
 =?utf-8?B?SXJPZ2ZQVmluYmFyQXdEVkY4TGZIMUNnT040aEJ4SVdaZWJJaGRhZXZ4RURI?=
 =?utf-8?B?RzNtNHpmL2tlYzdtbUNHR1QyRVJWT3NpRWE4anVITUxJdU1ybHBWRUVINDEw?=
 =?utf-8?B?ZTB0TnVaZjdhbXZlcTFPdzFXOGRKbzRuWTJsMzZKZzlVYWR0VTgvNndJWmxU?=
 =?utf-8?B?TVREczJZOHphb2pFRXlBN1JBTGUxeDBUZVEvRkU0dmpvNlpoL2VwbWpwN2RE?=
 =?utf-8?B?bFZYK1VOaGFzOTRUdW1FVXI5UThWMzIrVHh2Z1VEZE5mUWh6dDE4a1V5Q2dq?=
 =?utf-8?B?aW9RcEFER1ZwZ01ycTVndXhad1lQSXAzelFoNjFlT3Z1NHowZFdjN3UrcEhT?=
 =?utf-8?B?OGYzbGNMNUVLWk9IOVBEODJRVnczcVRGK1A1US9PS2lrY2lzMWhaVFdtaGhl?=
 =?utf-8?B?TlV0VTBZYTVRL3B6aU84QmZ5U3psWXRDSy94WW9aZCtBbkFRazAxL2JXMHVN?=
 =?utf-8?B?ZVBQNThxMy95eDNzR2pXRmprZ3IzRUx1NTRWTDBrOXQzaVhqUU1XdVVLQVpG?=
 =?utf-8?Q?wbLAsGQGPt6PSqATe8NXtCgV9IBbBhczv89z/j+?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2766
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2ca6488f-03cd-404c-e8db-08d8f9a116be
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q8G8WskeOYnSD6Dd1pamp4iLdrezRHMROph6fmrGzB1wz+VRPhDZX+x1d3Wf02Ic5cDbvjgYm9U1EkFderv3l4W52RljX+Ux+K4mUByag+1Vnh11MlaDL5dDnxNJ4PYQrHmEtFuBBlnGZ/g1qIZg7QVA8nBpLXfw6K4cQCoMa8FHcKp+TCBSvqZ9nNuhrbD0ZktMi5S39kqq3uNQAtVVD9RE+u7CLiT/sdf3GOqVOvsDMg4gkCbk44Jd1gwyEiBAHw3Zv2NJvlLs8DocyBIGf8pyRktJRHEDp2aYSMdpYIbSNGRmvw4d7HKLWFHzyk8CelAl3FYLVEDBjnUYYIhtyVLiTaTGZXwghVlEX3RCg6/ydDzO7oWzP2Xehac8fzdwd3LMUOgVT+vloih7nTmq7hgzsqStQW3gwhiVaIzqL7TvVpA3KgWEGD3TKoHgAhCFO9N3WhDBvML8yxklgu/kf4Ux0UkTU6yRGOiIh/BHKaq5FzrWSvfv00a3i9zAr3FR4LC6UUYS5+bD5irQUOn0hZYqqomic/aTzLuh8VVYC4cRAZSiUDfOuc1tylJQnyrFEQ/NrSkVu4QBFQmpEk9GaL8OWWaF/dnmwxfMlgvc2hLlRhfjAuEfx5E3xawwfywpTjLOXdVu4yBR1PO15k0bi0G8gsRMxfjqIy/srr07OA4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966006)(36840700001)(8936002)(83380400001)(5660300002)(2906002)(53546011)(82310400003)(8676002)(336012)(70586007)(36860700001)(2616005)(7696005)(956004)(33656002)(81166007)(54906003)(16526019)(186003)(86362001)(316002)(6862004)(4326008)(82740400003)(26005)(47076005)(6486002)(6666004)(70206006)(44832011)(36756003)(356005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 08:42:46.9963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c76edd4-f128-4104-5ee4-08d8f9a11e85
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5751



> On 7 Apr 2021, at 09:10, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 06.04.2021 23:46, Stefano Stabellini wrote:
>> On Tue, 6 Apr 2021, Jan Beulich wrote:
>>> On 06.04.2021 12:36, Luca Fancellu wrote:
>>>> Modification to include/public/grant_table.h:
>>>>=20
>>>> 1) Change anonymous structure to be named structure,
>>>>   because doxygen can't deal with them.
>>>=20
>>> Especially in the form presented (adding further name space clutter
>>> for consumers to fall over) I object to this, most notably ...
>>>=20
>>>> @@ -584,7 +599,7 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_swap_grant_ref_t);
>>>>  * page granted to the calling domain by a foreign domain.
>>>>  */
>>>> struct gnttab_cache_flush {
>>>> -    union {
>>>> +    union a {
>>>=20
>>> ... this one.
>>=20
>> It is unfortunate that none of these tools support anonymous structs or
>> unions well. (You might recall we also had issues with the older
>> kernel-doc series too, although a bit different.)
>=20
> While I wouldn't veto such changes, I think it is a very bad approach
> to make adjustments like this to cover for a docs tool shortcoming.
> Is it entirely unreasonable to have the tool fixed? In fact, if the
> issue was run into before, isn't it a bad sign that the tool hasn't
> been fixed already, and we merely need to require a certain minimum
> version?
>=20
>> It is difficult to provide a good name here, a suggestion would be more
>> than welcome. I agree with you that calling it "a" is a bad idea: "a"
>> becomes a globally-visible union name.
>>=20
>> Maybe we could call it: StructName_MemberName, so in this case:
>>=20
>>  union gnttab_cache_flush_a
>>=20
>> It makes sure it is unique and doesn't risk clashing with anything else.
>> We can follow this pattern elsewhere as well.
>>=20
>> Any better suggestions?
>=20
> First and foremost any new additions ought to use a xen_, Xen_, or
> XEN_ prefix. For the specific case here, since "a" is already a
> rather bad choice for a member name (What does it stand for? In lieu
> of any better name we typically use "u" in such cases.), the badness
> shouldn't be extended. Sadly the ref as being one way of expressing
> the target MFN is also not accompanied by a GFN (as it ought to be),
> but an address. Otherwise I would have suggested to abstract the
> similar union also used by struct gnttab_copy. In the end I can't
> see many alternatives to something like xen_gnttab_cache_flush_target
> or xen_gnttab_cache_flush_ref_or_addr.

Hi Jan,

Thank you for your feedback, I agree with you all that =E2=80=9Ca=E2=80=9D =
is not really a good name,
I will be happy to change it if we define a pattern.

Just to be sure that we are in the same page, are you suggesting to modify =
the name
In this way?

struct gnttab_cache_flush {
-    union {
+    union xen_gnttab_cache_flush_a {
        uint64_t dev_bus_addr;
        grant_ref_t ref;
    } a;

Following this kind of pattern: xen_<upper struct name>_<member name> ?

Cheers,
Luca

>=20
> Jan


