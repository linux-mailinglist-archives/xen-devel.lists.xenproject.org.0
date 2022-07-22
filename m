Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BA657E253
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 15:31:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373231.605325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEskL-0007QD-Ug; Fri, 22 Jul 2022 13:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373231.605325; Fri, 22 Jul 2022 13:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEskL-0007Ml-RY; Fri, 22 Jul 2022 13:31:13 +0000
Received: by outflank-mailman (input) for mailman id 373231;
 Fri, 22 Jul 2022 13:31:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sdc0=X3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oEskK-0007Mf-AL
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 13:31:12 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10073.outbound.protection.outlook.com [40.107.1.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8aef5bb6-09c2-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 15:31:07 +0200 (CEST)
Received: from AM6P194CA0035.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::48)
 by GV1PR08MB7731.eurprd08.prod.outlook.com (2603:10a6:150:52::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 13:31:04 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::3b) by AM6P194CA0035.outlook.office365.com
 (2603:10a6:209:90::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Fri, 22 Jul 2022 13:31:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Fri, 22 Jul 2022 13:31:02 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Fri, 22 Jul 2022 13:31:02 +0000
Received: from a721f8d7b757.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 705B7C12-6C03-4B11-8A7C-B490090466CE.1; 
 Fri, 22 Jul 2022 13:30:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a721f8d7b757.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 Jul 2022 13:30:55 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DBBPR08MB6123.eurprd08.prod.outlook.com (2603:10a6:10:20a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 13:30:53 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 13:30:53 +0000
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
X-Inumbo-ID: 8aef5bb6-09c2-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LQbYPfHP+Oi13Ae7rxfq4kAW3WsBVD3y++abE46dONG9s6KZrn0dkt/Ma+O/YTj/KHr5xfTCMRGAd81H/pW3EAKPlmNcdm0i9pHpr+fuOX7qETvQIDS/0HODNj47TR0u9TYleeTTDTSLIBdDPqWojf4p6OJxrVWy/AHrasRBEyVNjlu+zBSLNa+1Ig2Jo/6s5eMGO9cmsR5uRGbPhsmMJOiMUCsZocU+XptG4dSdaUmZ4olY34itXbf19YWSHgvip283JWsuEYsEnVGUUBKs+0zT0GDO6gQdHbkprV3VNngQJ7qfEwjxE0V/Pv77oeZSV6js4i6xK4thhhP295jg2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7m+r0zQRXv2eZ9CJuxVVAYbBlzcpeQOKcOjAw8RSvnQ=;
 b=F52/GIn+QS7P387/xFjDHIM5RHQj0z/9NHjA36XWwZ25ypiQly5Z4qyQoA+slAYGQzokDe3EOIk8YxMA8ZvIajXJEM67qf05jzqWY6Cpb97XZ0N8V/X02bBJsmZ7Hcq1MP8UUJik9t/SFO0e0RzZbNNMDpNK0+e8QbtD8DgVNBx2E7+qHZS0abVdsO/QETjgMNgfvud2XZnVlI3EhSswzbf4mr9Vq9vRWbgHBIFvRIxhCgXParCXFcfPUvhq2oiKJuvJKi6CNhNKedtz/F5uqxxVcz8fKGCNiFd2ht5/Jfq8z69pa8z5uy0tohUf75fo4Q1ymT4RJQWhstk8jJLxZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7m+r0zQRXv2eZ9CJuxVVAYbBlzcpeQOKcOjAw8RSvnQ=;
 b=fVpqWnZ/1jU3/tLVcvY0o1ym6qY0PLtbs7GSOdY5Ta6xd9fA2N8uj0aGsBsO5uIZN9Xkzq6hEjkUERh2OWxXxWA7zzPMUi+4vmzla2FO2vbO/HvPwHTIY+mnNgEZht4USe3tLhrxWa/KXw8u7l/QbRfkHsbtMACVsi4QGft5jLY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bd617bef8ef3b90d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0+amNtTOQZu2Pvth5j07a9xSMkfvwe+jZOSknJu4y+T5SJ8xzFDepn12C/BdmTAVyQw91cGIqI8UEbeky84LSAKuRN4ui/E5+2FgsYYUljgCb76aB/7eERDPJxwyjmSIDM6JqDp2dN8GzzaBJ5XkVDSgQskkLgP62O/kVUdV8KOon5uJ6EWuvXZjZWY7RgcJnKd4cftLKrSvzJHmEdMsaaXBprZIOTI88ybKDrvDTzyHnlvAncIbaowamusMA+mlZGIXkCZvRVvEY/TazUE/UvQ+lpTwaJLi+lMnW5X51CenS7Y8vuvJi3x9F8n7uwjZdeaaXQJ4KE72sMFfqDYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7m+r0zQRXv2eZ9CJuxVVAYbBlzcpeQOKcOjAw8RSvnQ=;
 b=YHNj0NQyD3qqXNQamGOIUM0k33lF4WiWVKlLGz+OT73sw1pNr5dmjuiWYaJ2ttYqaarollKmRpDtttBPuSvD4Jij/Wctv7R76Mxy+tZisRuqAtjx1OACjFMN3T2zfiilcJlthNeeMR3jx4a3md4tQ8ZRzveX/QqOJPDQb6egBzFT6C++M7KEyed6pYAcGjgTFI+eFi4hC2YeI2t/6ucDAA28Z7ExBVtXo0dKwxe7BiYDj0kL7CmQnQtgfeFX3Wv06jWNuBSfhH3gYRIHrZa0bJ49jtHGOQaCKT9NiYc+p7wVJ0niocFuTrdwJFKSjmNEqa9Yx4w3pT2ZRMXymckVvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7m+r0zQRXv2eZ9CJuxVVAYbBlzcpeQOKcOjAw8RSvnQ=;
 b=fVpqWnZ/1jU3/tLVcvY0o1ym6qY0PLtbs7GSOdY5Ta6xd9fA2N8uj0aGsBsO5uIZN9Xkzq6hEjkUERh2OWxXxWA7zzPMUi+4vmzla2FO2vbO/HvPwHTIY+mnNgEZht4USe3tLhrxWa/KXw8u7l/QbRfkHsbtMACVsi4QGft5jLY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3 11/25] tools/xentrace: rework Makefile
Thread-Topic: [XEN PATCH v3 11/25] tools/xentrace: rework Makefile
Thread-Index: AQHYh+S+xJXhWYMyUkSO+GQKLe3BdK2Kjr0A
Date: Fri, 22 Jul 2022 13:30:53 +0000
Message-ID: <F815868F-E754-451E-B7E1-488258D5EF62@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-12-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-12-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0076a77e-10dc-489f-0d6d-08da6be66bfe
x-ms-traffictypediagnostic:
	DBBPR08MB6123:EE_|AM5EUR03FT046:EE_|GV1PR08MB7731:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +MEO/LF44Ue+phnvDUOVkeY3GSZj2PebQWJYBICBGz3TBSTyHgBfjwmy2aOD+igasSCrz/GRUyA9kpZEvxD5fw3rPqIasdsSdpdJ4LK2TnUuXlUoqrvUNj/ah1rsXPZdq77mEW2c5clH/xvqOuOpPc/y0lBgZ1fmRreD9wluKP+UQVS4Ky5u+2VeF/fg/sXuXUylC/hvsjO7Ta0qvBCSsUg/fGHL1k5Ax6/cy80+7kZ5uZ2w0wQKtIiYNIRr4HeyS2Gp6DqYeYMNwBCUoLWp5OaNbcdL0OCiG4SM50UP4CjKqSVaCeyTD7T2tAqWJpf9jVzVAEKDpC+NnPBZujE41Dmdo8sPNduRagpWuGcS4hVHBOxX9t+bot/NqyjzXhW4iI5UxASl3GRGRlcXWsk6nKxkBR1FR0U7ICx0uFKC1efM1kpwwG2B4d1fX2Six+wddOwwY61MKDWb+Q4ZCtfH3s+Kfd60NeKckusofXwGNV42BmTzxvcABGMriyZ2hW56WtC+mjeWzv8gaRBiPPVhZhl/FZJedGIiHKe7UDyRS+Se9d17Iy3wa0hAssMJXPV/K8wl+GbbgYCGd5fS5+v2u6wNJw+TlMd4mDmrAGvY0QjSTOBYSeVgArZEDEJ5p1wD9PKaOKJqL4C+aGFuyDhKAWUkDpuCjgst0H0MiogutOCFUzrOUc40zUCoIdoGtMFGv5M+NMTX/C1XVM3nHLhneJV0woy8fuim020O90azT3hDVADKWkMiCNIm3L0FGLHsZ8sxwmLPQLPUi2VibmwNPBkIUma1PAQ40cCpMuh8bNGxIC1OJ27VLCbtg2vKwfPtUS8EwMnnOj2JdpuLTLW3AQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(66946007)(66446008)(64756008)(186003)(66476007)(76116006)(83380400001)(66556008)(6506007)(86362001)(8676002)(478600001)(4326008)(36756003)(33656002)(91956017)(2906002)(122000001)(38100700002)(8936002)(5660300002)(38070700005)(6512007)(71200400001)(26005)(41300700001)(6486002)(316002)(54906003)(6916009)(53546011)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6D111FBCFA2AD41BCB3F851A383EA99@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6123
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	66f89899-b2c8-402c-23d4-08da6be666d0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n5Rv5whVX++fLLwBDJ/tol0QjrSrt2RqnIxDre2a51XkHFRYzuk+FWA5JcQjlX56CWY8d1op1SWMhD8Uf6fne2EBTup3uCqODZp7L5+tpASXgT36zau0YefcxHCT2+v3aVNvVBNzNqJGmXeS7qncCWNV5m3PI/aRvHvIHmBaGG8Cmoo7+ekZbcSHL4qTclvXG7jeV6ZvrEDEKMqKRVEaL1tQ/o7V4pi//cghQzYxL4MWg3sg2FRN6JqZ/m4ytPLXgAMOFRVM0t8XqHVDqAEZ1izDBfiy0PfxWmwopMItjyQYjZXO9I2wYt5ZoKUwh3Ej1vBWsz2UAcyWQLmDLRkYdaYVkYJLn/9UqO/5ygAqEKickOHDG433EISHFxzoOWgBUabvXwDoSnsztF8B5omqTgw4UXJT9ctY+La+TOJhbYbr4COlo0CeaOJjJ4OIti1sadvQmE2z9yqcrenjDjiMQuvmvzANrv8oqUTflDb3CnSdhOg1jeVGlWDm8Y4XgBOr15sKCXXWKFCCDtrmknklGLAtImdc4K3JgAsxSUhrMLrqR07EikBLGhFHOH4uCQv9u20bRdnR+ttCnhhKbzbIccC9xx6XtGFpQjWF1H9BJ/TKwisqKNN8EJO8KMD+wa+SBSdw201ireUpb5Os4+6jvdd9R+ncaR523P08muQG64vG5iq4USoRNR/Dgdq9hY0U3xvlc2u7jOrENru2hRSb8PiDw6hHDFU/DzKndwKfjjhbPVyoaXeuIqi3xxbqdnXvW2LJORzad8tXN2vKvSpExfHnUu4xTAcWyTvuzWIEiNag2lXNdDvGb3rLzWMJ46w4
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(136003)(376002)(46966006)(36840700001)(40470700004)(6486002)(41300700001)(478600001)(356005)(33656002)(82740400003)(81166007)(336012)(26005)(53546011)(6506007)(2616005)(83380400001)(316002)(54906003)(86362001)(186003)(47076005)(6512007)(82310400005)(40460700003)(8936002)(6862004)(40480700001)(5660300002)(8676002)(70586007)(70206006)(4326008)(36756003)(36860700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 13:31:02.4209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0076a77e-10dc-489f-0d6d-08da6be66bfe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7731

DQoNCj4gT24gMjQgSnVuIDIwMjIsIGF0IDE3OjA0LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBSZW1vdmUgImJ1aWxkIiB0YXJnZXRzLg0K
PiANCj4gVXNlICIkKFRBUkdFVFMpIiB0byBsaXN0IGJpbmFyeSB0byBiZSBidWlsdC4NCj4gDQo+
IENsZWFudXAgImNsZWFuIiBydWxlLg0KPiANCj4gQWxzbyBkcm9wIGNvbmRpdGlvbmFsIGluc3Rh
bGwgb2YgJChCSU4pIGFuZCAkKExJQkJJTikgYXMgdGhvc2UgdHdvDQo+IHZhcmlhYmxlcyBhcmUg
bm93IGFsd2F5cyBwb3B1bGF0ZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFS
RCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCg0KSGkgQW50b255LA0KDQpXb3VsZCBpdCBt
YWtlIHNlbnNlIHRvIHVzZSA6PSBpbnN0ZWFkIG9mID0sIGZvciBCSU4sIFNCSU4sIExJQkJJTiwg
U0NSSVBUUz8NCg0KPiAtLS0NCj4gDQo+IE5vdGVzOg0KPiAgICB2MjoNCj4gICAgLSBmaXggdHlw
byBpbiB0aXRsZQ0KPiAgICAtIGRyb3AgY29uZGl0aW9uYWwgaW5zdGFsbCBvZiAkKEJJTikgYW5k
ICQoTElCQklOKQ0KPiANCj4gdG9vbHMveGVudHJhY2UvTWFrZWZpbGUgfCAxOSArKysrKysrLS0t
LS0tLS0tLS0tDQo+IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnRyYWNlL01ha2VmaWxlIGIvdG9vbHMv
eGVudHJhY2UvTWFrZWZpbGUNCj4gaW5kZXggOWZiN2ZjOTZlNy4uMDk5NWZhOTIwMyAxMDA2NDQN
Cj4gLS0tIGEvdG9vbHMveGVudHJhY2UvTWFrZWZpbGUNCj4gKysrIGIvdG9vbHMveGVudHJhY2Uv
TWFrZWZpbGUNCj4gQEAgLTE0LDM2ICsxNCwzMSBAQCBTQklOICAgICA9IHhlbnRyYWNlIHhlbnRy
YWNlX3NldHNpemUNCj4gTElCQklOICAgPSB4ZW5jdHgNCj4gU0NSSVBUUyAgPSB4ZW50cmFjZV9m
b3JtYXQNCj4gDQo+IC0uUEhPTlk6IGFsbA0KPiAtYWxsOiBidWlsZA0KPiArVEFSR0VUUyA6PSAk
KEJJTikgJChTQklOKSAkKExJQkJJTikNCj4gDQo+IC0uUEhPTlk6IGJ1aWxkDQo+IC1idWlsZDog
JChCSU4pICQoU0JJTikgJChMSUJCSU4pDQo+ICsuUEhPTlk6IGFsbA0KPiArYWxsOiAkKFRBUkdF
VFMpDQo+IA0KPiAuUEhPTlk6IGluc3RhbGwNCj4gLWluc3RhbGw6IGJ1aWxkDQo+ICtpbnN0YWxs
OiBhbGwNCj4gCSQoSU5TVEFMTF9ESVIpICQoREVTVERJUikkKGJpbmRpcikNCj4gCSQoSU5TVEFM
TF9ESVIpICQoREVTVERJUikkKHNiaW5kaXIpDQo+IC0JWyAteiAiJChMSUJCSU4pIiBdIHx8ICQo
SU5TVEFMTF9ESVIpICQoREVTVERJUikkKExJQkVYRUNfQklOKQ0KPiAtaWZuZXEgKCQoQklOKSwp
DQo+ICsJJChJTlNUQUxMX0RJUikgJChERVNURElSKSQoTElCRVhFQ19CSU4pDQo+IAkkKElOU1RB
TExfUFJPRykgJChCSU4pICQoREVTVERJUikkKGJpbmRpcikNCj4gLWVuZGlmDQo+IAkkKElOU1RB
TExfUFJPRykgJChTQklOKSAkKERFU1RESVIpJChzYmluZGlyKQ0KPiAJJChJTlNUQUxMX1BZVEhP
Tl9QUk9HKSAkKFNDUklQVFMpICQoREVTVERJUikkKGJpbmRpcikNCj4gLQlbIC16ICIkKExJQkJJ
TikiIF0gfHwgJChJTlNUQUxMX1BST0cpICQoTElCQklOKSAkKERFU1RESVIpJChMSUJFWEVDX0JJ
TikNCj4gKwkkKElOU1RBTExfUFJPRykgJChMSUJCSU4pICQoREVTVERJUikkKExJQkVYRUNfQklO
KQ0KPiANCj4gLlBIT05ZOiB1bmluc3RhbGwNCj4gdW5pbnN0YWxsOg0KPiAJcm0gLWYgJChhZGRw
cmVmaXggJChERVNURElSKSQoTElCRVhFQ19CSU4pLywgJChMSUJCSU4pKQ0KPiAJcm0gLWYgJChh
ZGRwcmVmaXggJChERVNURElSKSQoYmluZGlyKS8sICQoU0NSSVBUUykpDQo+IAlybSAtZiAkKGFk
ZHByZWZpeCAkKERFU1RESVIpJChzYmluZGlyKS8sICQoU0JJTikpDQo+IC1pZm5lcSAoJChCSU4p
LCkNCj4gCXJtIC1mICQoYWRkcHJlZml4ICQoREVTVERJUikkKGJpbmRpcikvLCAkKEJJTikpDQo+
IC1lbmRpZg0KDQpXaHkgaGVyZSBkb27igJl0IHdlIHVzZSAkKFJNKSA/DQoNCg0KDQo=

