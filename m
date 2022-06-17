Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C14ED54EF6E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 05:26:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350961.577423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o22bW-0005pn-RG; Fri, 17 Jun 2022 03:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350961.577423; Fri, 17 Jun 2022 03:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o22bW-0005mU-Mr; Fri, 17 Jun 2022 03:25:02 +0000
Received: by outflank-mailman (input) for mailman id 350961;
 Fri, 17 Jun 2022 03:25:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAhX=WY=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o22bV-0005mO-1y
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 03:25:01 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 100b6efb-eded-11ec-bd2d-47488cf2e6aa;
 Fri, 17 Jun 2022 05:24:58 +0200 (CEST)
Received: from AS8P250CA0018.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::23)
 by HE1PR08MB2939.eurprd08.prod.outlook.com (2603:10a6:7:33::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Fri, 17 Jun
 2022 03:24:51 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::7a) by AS8P250CA0018.outlook.office365.com
 (2603:10a6:20b:330::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16 via Frontend
 Transport; Fri, 17 Jun 2022 03:24:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Fri, 17 Jun 2022 03:24:49 +0000
Received: ("Tessian outbound 1766a3bff204:v120");
 Fri, 17 Jun 2022 03:24:48 +0000
Received: from d6487d84f8ad.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 72865495-5DA9-426F-B6A2-00F3046D3786.1; 
 Fri, 17 Jun 2022 03:24:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d6487d84f8ad.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jun 2022 03:24:42 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM7PR08MB5464.eurprd08.prod.outlook.com (2603:10a6:20b:10a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Fri, 17 Jun
 2022 03:24:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%7]) with mapi id 15.20.5353.015; Fri, 17 Jun 2022
 03:24:38 +0000
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
X-Inumbo-ID: 100b6efb-eded-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nHKJV0E5fUB0OlVlv9AHd5ppMBau1uBX/UquojaSpaNIloTcNF6FlmSbPG+SrtZiCnxbExInwPnn2Paw/hyiDLzMn6AhiDD4dEMhQgzmm6X8mKfBxRoSHbR5ZBq9MQSzOkotIQsZEZ7V2qj90R9OZvP+rtNOhLdTza30tw1ZXOXvKuqSdHZ8CtEMdFl3tqkntnIYj/DCGXsXCar2v67G1lBCukfVbW8Q5xWA6RT+zsioE/u1lyPKXZXjN5hQd5VXAf0onXq/i5PhUcCj8phi6QaKgrXnPIcDHKAgCTVQaWEBiVZMgwUxdBFsSP4paqBggmkuT/o2Q9vE3BphDIjA8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VREWxiJvUhFIjwf3qdTHKNTciRIEdi1fyoHyo3QY8o=;
 b=RSP9ysFr/VMS7hnK4HDKUwQUhhXBB/D8YawDlHh/9JOEPj20mMr9KWG+PgxCC3BoZURGV9XX+iEAfMTqGL5rz2aSY5vnjpVwxwrpgIEMTgdpuGR/WbE4tge+sSqXwrF0m2hFUjvsDlELG9swk9LvghDK0wgYG2Wx9JoIljDPhM68T/+1d+igIfbEoDTUJxnnZR1QH22PN/FwSK3jaDevRRjP0wMA2alRKE0bBTTS3Zw19ZpTxFtQEFDbIEm04Nb4Wte6dF0Gk/RdqlsKPhMKnKSCxDae88HoJfYSuHyK3lh7kq4lpHS7mEIaUHQuPHAEvywdz+sutTQoHoV0qH8OYw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VREWxiJvUhFIjwf3qdTHKNTciRIEdi1fyoHyo3QY8o=;
 b=NEk5eXxoIoKI5ebEx+t9ipObQHcj5/ISUpBLJU1Z1tmftlxlkkiHDtigKgz6s1Yl/wwl+NzsXZ9hb9g2UXB0J86Jn6LbGBsFoMpot41zaWbZjKbqdwCytasMa9CrE3U4aatjumk1h6A87hQU3nB1fvNnYuLgOoi5jJJ7dSQic+0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wdg9Qnc6hC//Bpj+o7MngaTbsR0Z/Hh7fws5VW6QNk1dQd1uxgkOmAV5XNvoRy3Hg32f5KnvIqYBWZHmSn3iuxHt+XnhVcKZ7+ZwuvEutQWYGLDy1ag6Y0m5bV+/as4kZajnCZV/ktdUP7XYRReuAEo3rbDdtxGO+McIcPYr9JEHSh20ClPgmgbMryp9BKCZu+KY7McybGTukzmxN7Jbjehnijk+I23zJ+gVQOpRlRZWrQeLWPlh55VDC1m+ZKmQevRVa/v4uOdrL1kxwoCywHZ/fMiW2/Xg5PyABnyJpIxiDl6a/pKny7WLlEMrlr/6gZzyHEBr3H6OqYj7z+5hsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VREWxiJvUhFIjwf3qdTHKNTciRIEdi1fyoHyo3QY8o=;
 b=ncR0StoTqXPR6ZPjVojCwnDCpaGpJ04fL+XDNuBz8DgC5Dn5mOPgZqG0yz5dUvMzfx83DQG3MXtH1zEfw8Id3tbkpIgnZiE2rOJtYMOdJ0qEd3mNhlCXtkFEKPEWRTkk7YJjkDMvkgSa8lwVsB+etpcSat0q3LtHytlNSDWKChmalAEFb2/ql+QTmyh3IKMEEtcOoUxitaniWV4u9KPq3jWjlI/T+HGxYGVRIiiJsheNKx1esv4MmTEhtTOqijvDq8Fjhdr507yrNDCJ0vRHLKQm4AaoTtnCjCgCBBmym90XHpKbrDqAaf+tlvxrUdqt/wsoQgfwY+l4P7QvbOcCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VREWxiJvUhFIjwf3qdTHKNTciRIEdi1fyoHyo3QY8o=;
 b=NEk5eXxoIoKI5ebEx+t9ipObQHcj5/ISUpBLJU1Z1tmftlxlkkiHDtigKgz6s1Yl/wwl+NzsXZ9hb9g2UXB0J86Jn6LbGBsFoMpot41zaWbZjKbqdwCytasMa9CrE3U4aatjumk1h6A87hQU3nB1fvNnYuLgOoi5jJJ7dSQic+0=
From: Henry Wang <Henry.Wang@arm.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: RE: [PATCH v2 0/4] tools/xenstore: add some new features to the
 documentation
Thread-Topic: [PATCH v2 0/4] tools/xenstore: add some new features to the
 documentation
Thread-Index: AQHYcZr+xugQmCaBT0SxSahY0q90Lq1TDssw
Date: Fri, 17 Jun 2022 03:24:38 +0000
Message-ID:
 <AS8PR08MB799129FC63126C8435F5366A92AF9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220527072427.20327-1-jgross@suse.com>
In-Reply-To: <20220527072427.20327-1-jgross@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9F95812FA4B93442989CD37FC642BC70.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 493d81d5-494c-4bfe-1501-08da5010ef52
x-ms-traffictypediagnostic:
	AM7PR08MB5464:EE_|AM5EUR03FT038:EE_|HE1PR08MB2939:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR08MB29397BD88150C61FA0112A1692AF9@HE1PR08MB2939.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Dj32VYDEzteoJHtRPd5s2W3R4uhg8aGN5C/2In2BPCtrwsZkXO0gsE1jDOxupgj6bzyd02lzs6PfoFXFIHN82sXg/DHuf7xJrP/kuU0VeXDTml/a/46pbYVF6lOEAgC2iIP8ArUdt28LAYmjIC+eUPinwVuE/TwCN8sX3b2AHHw7sfxt9OHeASwE4QEh1E1gkNzhxvTHpiVzIeAK6XaKlCEunJZjjOOP2GMkO0oGXu7uUB3U5RZzSfnoA+Eh3++IIFdnlhr6KnnQB2mCtYRkch0kl93aPUu6rXea3PUmnT/qA5dVyvoJOnOqQlen+Oazzvi7fudqLTuOJ+qgUTzT6L33CczBrqOvhdi2PuSHbnDSI3ABvzKHYH4ViUUUv42MRnafT+X635pUT003gfiBa9W5T24aV7cdpYcqxlGPHci1BG9Czxmrd/YJgNIZa3M4EGSfZeTYcqrDjrfMjVBV5ukMOxHEUIfKqTFUMPeSPdtDX6ecIRGKotdA/d48riSkran0bZizwbMZgVoNeQe0mjRhXzkXAlFQjg6Z0+KLkFxiSFRJ+/YDs8NU2Yf90j2lzeH7LG7Euv/Xcv7MmCAD3NSSNSZiheNN2ITmWkt0b27NX81ai1bsIsrsp6GvWSBjLaUjXFi0N3j/Tgf5cyxLxdwcz6K+bzUJRxS3P1Pv+dYG6XyJ38ZUXiMEXpkv1YD0nTt0q+7J7twrDRFmcBJQCAdpF+PsJnetHt3pEf4wrsWi2rR6atmEVjLv9QTZtexWzAoIyr0zftgPMRdYy1ERPwaCW641GIlFldHllUw/QokVrAih+gkPIXcHyhN3naEAeiRCaYpJmkNirQ4y01uxng==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66446008)(64756008)(4326008)(33656002)(52536014)(2906002)(8676002)(76116006)(66476007)(66556008)(66946007)(55016003)(86362001)(5660300002)(316002)(8936002)(54906003)(498600001)(7696005)(110136005)(6506007)(26005)(966005)(9686003)(71200400001)(83380400001)(38100700002)(122000001)(186003)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5464
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8c25a4f0-b5ff-46ab-4176-08da5010e904
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZH+O9Q6w+reL+UyRSzvIYjFd2c3L+5mI4KtZul3j5CFdxpAndCFpnkbzaIXqgpvrX3FambsIBtGH7kgWQjL6M/sZrN2tq94944xQ2JpqpNzM+kgR/tqhV16eJqvVtb0thEblI+AG2SqC6m9AJUnugfaVv5ZXWw1lrBgs+gjPL1onq0BMWXF20qqDROPswnGJDv5ZVWFjQo4EBDQijads+umyth2Ri1JvT0ymhX7AcskndnFDJV/hrVYAE41fLUUVG9C1Dh1gQLmrqo9p61gfD4xNXaEnQGJ3AZ5h7c3yfs4K68cjIp3sqsBgck0OgxWO8gc+Am5RFkJcfJ68e3F7ymy6QZ1mylpU+0eS/e4no3CqsY+5LKjV/eSG7TCbYCL+rk8TXYEldlty91jV/xbJmbKdRcly1PDe0bCZfNB2a1FR3MNxacOQi8uZabyicUu8u/oL4x6NiS58xcx6OBCInxYMovwy0lJTbUcZDiD3KUKYfSw8+Du5TRK3JpJ+nRhctxr1dvTNt83PFB0qL0v3bseUqjKm8pDJt/zCKKqDQeTtl0F41xFZQzCdI1cE2eK9LMoBFxKgGIGU+YixJj4rf1WH6L9J8Kxb8/XY1IsqU3bNdpegZGJOZLN+YA7qGUZWTFIDscLKFjqfy1zOjlvd/f/fkE70tqaH8h5QgOfdgiTPIhGRVJvFk57ANndQakYUfDghwCQglme/WyFAkCmkbsjiXm5Og6FD2iw+rYkk63jms3s9Cm0XhTplTB7SstXbgYjPZjeZghpNMUkLxOoIS/W0zseJGeykF9TcfNzkoiV75IR+KLaQMzO7YVnT4+8cso9yOKBKa2juHHri+cT7YMZAWMOIC/REonbvC2e13jk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230016)(4636009)(36840700001)(40470700004)(46966006)(110136005)(70206006)(8936002)(316002)(2906002)(5660300002)(4326008)(54906003)(8676002)(70586007)(33656002)(7696005)(55016003)(966005)(498600001)(52536014)(9686003)(82310400005)(356005)(6506007)(47076005)(26005)(40460700003)(336012)(86362001)(186003)(81166007)(83380400001)(36860700001)(2690400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 03:24:49.0554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 493d81d5-494c-4bfe-1501-08da5010ef52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2939

Hi,

It seems that this series [1] has been stale for a while with actions neede=
d from
the maintainers (review needed). So sending this email as a gentle reminder=
.
Thanks!

[1] https://patchwork.kernel.org/project/xen-devel/list/?series=3D645480

Kind regards,
Henry

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Juergen Gross
> Subject: [PATCH v2 0/4] tools/xenstore: add some new features to the
> documentation
>=20
> In the past there have been spotted some shortcomings in the Xenstore
> interface, which should be repaired. Those are in detail:
>=20
> - Using driver domains for large number of domains needs per domain
>   Xenstore quota [1]. The feedback sent was rather slim (one reply),
>   but it was preferring a new set of wire commands.
>=20
> - XSA-349 [2] has shown that the current definition of watches is not
>   optimal, as it will trigger lots of events when a single one would
>   suffice: for detecting new backend devices the backends in the Linux
>   kernel are registering a watch for e.g. "/local/domain/0/backend"
>   which will fire for ANY sub-node written below this node (on a test
>   machine this added up to 91 watch events for only 3 devices).
>   This can be limited dramatically by extending the XS_WATCH command
>   to take another optional parameter specifying the depth of
>   subdirectories to be considered for sending watch events ("0" would
>   trigger a watch event only if the watched node itself being written).
>=20
> - New features like above being added might make migration of guests
>   between hosts with different Xenstore variants harder, so it should
>   be possible to set the available feature set per domain. For socket
>   connections it should be possible to read the available features.
>=20
> - The special watches @introduceDomain and @releaseDomain are rather
>   cumbersome to use, as they only tell you that SOME domain has been
>   introduced/released. Any consumer of those watches needs to scan
>   all domains on the host in order to find out the domid, causing
>   significant pressure on the dominfo hypercall (imagine a system
>   with 1000 domains running and one domain dying - there will be more
>   than 1000 watch events triggered and 1000 xl daemons will try to
>   find out whether "their" domain has died). Those watches should be
>   enhanced to optionally be specific to a single domain and to let the
>   event carry the related domid.
>=20
> As some of those extensions will need to be considered in the Xenstore
> migration stream, they should be defined in one go (in fact the 4th one
> wouldn't need that, but it can easily be connected to the 2nd one).
> As such extensions need to be flagged in the "features" in the ring
> page anyway, it is fine to implement them independently.
>=20
> Add the documentation of the new commands/features.
>=20
> [1]: https://lists.xen.org/archives/html/xen-devel/2020-06/msg00291.html
> [2]: http://xenbits.xen.org/xsa/advisory-349.html
>=20
> Changes in V2:
> - added new patch 1
> - remove feature bits for dom0-only features
> - get-features without domid returns Xenstore supported features
> - get/set-quota without domid for global quota access
>=20
> Juergen Gross (4):
>   tools/xenstore: modify feature bit specification in xenstore-ring.txt
>   tools/xenstore: add documentation for new set/get-feature commands
>   tools/xenstore: add documentation for new set/get-quota commands
>   tools/xenstore: add documentation for extended watch command
>=20
>  docs/misc/xenstore-ring.txt | 10 ++++----
>  docs/misc/xenstore.txt      | 47 ++++++++++++++++++++++++++++++++++---
>  2 files changed, 50 insertions(+), 7 deletions(-)
>=20
> --
> 2.35.3
>=20


