Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B66845EBAA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 11:33:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232506.403136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqYWT-0000tB-9K; Fri, 26 Nov 2021 10:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232506.403136; Fri, 26 Nov 2021 10:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqYWT-0000rG-5R; Fri, 26 Nov 2021 10:32:05 +0000
Received: by outflank-mailman (input) for mailman id 232506;
 Fri, 26 Nov 2021 10:32:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bcxr=QN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mqYWR-0000rA-Il
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 10:32:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16cebc16-4ea4-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 11:32:01 +0100 (CET)
Received: from DU2PR04CA0329.eurprd04.prod.outlook.com (2603:10a6:10:2b5::34)
 by DB6PR08MB2823.eurprd08.prod.outlook.com (2603:10a6:6:21::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 26 Nov
 2021 10:31:58 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::65) by DU2PR04CA0329.outlook.office365.com
 (2603:10a6:10:2b5::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Fri, 26 Nov 2021 10:31:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.20 via Frontend Transport; Fri, 26 Nov 2021 10:31:58 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Fri, 26 Nov 2021 10:31:58 +0000
Received: from b95013cb22d9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 91A087DA-4A5A-4C88-A5C2-D2E47927EF1B.1; 
 Fri, 26 Nov 2021 10:31:51 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b95013cb22d9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 26 Nov 2021 10:31:51 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6488.eurprd08.prod.outlook.com (2603:10a6:20b:33b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Fri, 26 Nov
 2021 10:31:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 10:31:43 +0000
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
X-Inumbo-ID: 16cebc16-4ea4-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HcNPY34HLXZwSxhmQlt98PPu5ibXv+IcbSOvRdS/g4=;
 b=DLlR61/YOc45+24iTH1WuX2d8aqXIEBu8ZjBV03Wy1Ovl0YZ07pl6m/yWMjc+vCpiof3KUDjn4wBTIebGwcaFkpQ7sXmN9GuU+1/jhUtcZ0Ud0WOMj7ld8D0YU/Azx7EMRmfH5Vamy6hu9X37j8XoEEvxTPHKMOTsguDmu8T7P0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1600cf63c5f85f08
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6Tu3EWIcAWjRCKKS7817t1gUf6fIfyp5bY07jaBUITaYHF8jdLrv+PBpYlWvup3k3yc5uwrMIXvXJJIVUqFW4ZAblIrq8hgRFQRn/3dRbIHQ0qx9ZH9X5LF/rX++3JhP8RMrFftF3S6Y4k/dHaU4hkqF5FG/ddiMzEwOhvhYjSGhX7fhBN5bz5wBhLzvMzrLdFci+oW9p1IgzV0V1Y1jbkIkPFcFv+TSexWaCiozzhZBWNtkxxQMJWKp0iTiHWhJziVHiaPtb6tf7/yi0iVirWolJYTEn2ohDxBKzKyaIddTZy6C6QW5XGpg7RBBQOSaf+3rzdqyANMECdvAFnqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HcNPY34HLXZwSxhmQlt98PPu5ibXv+IcbSOvRdS/g4=;
 b=hjy12Iy6T/3O78BSlF90sID5d6eg4eE5XDj2x/5tRuqODqjjksOtrsdeM0G0O7+zTI7HkPY6B31X1JE0MXAB1Z+WV9F+/QMSuehkFUtDuwQDf2cEdlwIwPxxQ6KHfqElLdhzu0XENowFccB4KTWuq9lW5SNDoy7E1BYnKyrhjJz3TL5jmU2VV9hWyRmqx2pXwmCsxRLEytJJoIA9ZuygbKB0It0I/YsJGn6w2OAcfO0hx7qYPV3CWXJpnWaxC5qocJEc8a4inHRF9t1uFrZqaCWh+ZEnn7cWBlHKdP5AavqR2fj+/9JNnqDWcccL5oNixHgOQBpaEdFUc++dulRTpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HcNPY34HLXZwSxhmQlt98PPu5ibXv+IcbSOvRdS/g4=;
 b=DLlR61/YOc45+24iTH1WuX2d8aqXIEBu8ZjBV03Wy1Ovl0YZ07pl6m/yWMjc+vCpiof3KUDjn4wBTIebGwcaFkpQ7sXmN9GuU+1/jhUtcZ0Ud0WOMj7ld8D0YU/Azx7EMRmfH5Vamy6hu9X37j8XoEEvxTPHKMOTsguDmu8T7P0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Aarch64 stand-alone application for Xen
Thread-Topic: Aarch64 stand-alone application for Xen
Thread-Index: AQHX4lBBRwRMWKF0UkKA2OLT1/6XFKwVnPuA
Date: Fri, 26 Nov 2021 10:31:43 +0000
Message-ID: <B34490D7-5FE3-41D4-9792-41E2BD25EF05@arm.com>
References:
 <CANLsYkzKn7Nkika=KpHtSyi9=FQwS7Wt94Odbg2HuH+1PFUTzA@mail.gmail.com>
In-Reply-To:
 <CANLsYkzKn7Nkika=KpHtSyi9=FQwS7Wt94Odbg2HuH+1PFUTzA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3571b5b7-f612-4709-394c-08d9b0c7f9a8
x-ms-traffictypediagnostic: AS8PR08MB6488:|DB6PR08MB2823:
X-Microsoft-Antispam-PRVS:
	<DB6PR08MB28235D6692272EE7F708B2A89D639@DB6PR08MB2823.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lp6U294aBCJGVGKKJmrhS4ahlu6jkS1I1wSOiMAgsn57aNvsMjTa5ukQaQoqyjPeJDLJRYopHTKcu5tXmQLMjyh/9gIKB1kRODMGJGRRaApI2ydc4q7xBkbMqevgThBfp+ZcZU/es7J2KoV/zm2JNGw7cHGTnF9bkyLQ7a35ddT/JX9IoMdtS34lklcURPuYgXl4W4/JNaxdwqxWCVCTcel4+EBTPCL0K9g4cQToox/0l4TEg7S9czEc2PeJgyESClajE6kmZcdlGaHj0idXbxIw8Yoq7uL8cGO0/yBaGKHce3m4daErV16oOA1CHogjfgFpP13ZXAPVZB0BVNRHeCTYLzhx9a/EB5DgcPHrziDE0CIezguxYSMb9jxmq7XbfK/dsxMr0EuYWLm8d6/alwXgcu17vsy7kbwlDad0NAMZGlN3A/opOeVYg8ZDDFcrn6jiRLXdv/7acat2QYuYeZz+kcYOGx3zxP6mNNJ/TBvPPDI49J3Gok47wlaLWkaC1JA1V2Hip7s04qX/yYhX5kgkIzlFcejdj21vagyuL8tTKQLl/51WjCxqNez12F+lLQnGiXlCQ7emtnGSDIoEiIVTOC8J9nafqRWUt9ZhShdxSbvaZAZ0Ig4eZHteBi83lDmmDay4j96bpsu+JsyGGyaagGOJVSSdslv5g+yDqtqAfWxsE74X/OmjX7EpyIWeaOqvyYDb87K8nK1tE43n6KoNsFwxeShdSd3fmxr7J3dTuURcHTHDHLhUvCM/ZYe9jl4fA44QUsh5nNCy64EFqhF5BYETwc6YEpFjj7ugVi2QBLJ0QOz2Ttufbir0stlI3G/kIZYp/+USN5Qy56GSwg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(122000001)(66476007)(6916009)(76116006)(64756008)(71200400001)(38100700002)(66946007)(66446008)(966005)(508600001)(36756003)(2906002)(8676002)(38070700005)(66556008)(6512007)(26005)(316002)(4744005)(4326008)(6486002)(86362001)(6506007)(8936002)(53546011)(33656002)(83380400001)(91956017)(186003)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EC34CC86C4585E4C8843E4E760FFAC37@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6488
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	db7fff85-cf1e-4474-9bd5-08d9b0c7f0f9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bg0Nf+3cRgvxAzHbN/exQ8cK9OL9CWQ8wsOVdxxfWPp4XNZtT6PrQedbJCjbohttJhb7R1pnL1GVmAOZfb183LhkowwgRt59geNGFHFxheCKRiM5YcDztHNg8IuYTpex0MUt4inK/EMxtAy4QbhBxwh++RrAXxirpPAeG0mNtB/nvZaZcCbx1HVjrGWmC+JCIQA1OctV1xgHSMNQBLBo/IcmRRl4bPjDuoGN7k3qBXzyIxsjhK8p7d0FLnkc9GejXOcBzXIlKlaFUL1zSQTWZCGgHXqr5JU0vJBBkIQVUhDiejzl9O8wMY3lc6lmxhb5zH7TYmfVM4L/sF0dUxZQ7s7bmGnSfsi3C0eTu0Ewa6n7Up82uUkHdedVvS8RXfL6SC/l1ZcS1VF9gY4FKoxtWyHWzfLqx1aMX14cKXB767Vt46ZRvTQ/hTqqUFazazvGHn5/ClwYH5iva5nNeXpM5atRtO3tJUbFkRrKNhjmbm4/pkhr9spuNH21G3w5RMV69buE1A0eZXyvh8KgTpIlfiGP0pf6lr/Lmo/WglaY6Q7TBu6xAa38xbNo5x6Mz/ddVZEVhEBNLm6ycGQQ2Z6A+hVOndGEvfM4O36HyIVb31P7TBaC/ZGeSlF9IK7htRKJT798WOBC0FJtl8bQF8ovcmD3gwgjeQb7FZwZneuRxrgY0AMpB8AJKA7JkiKs9eKPurSToRMoxsXJTuAhxPJ1fj4x/E/jyFliQ9LCYcPjGQlmot0E+b9ztDV2GXXD90Z6N2RcXKlkw2MeN7ik3saQSwgR28igZEfEAjVXsiuE7yo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(186003)(2616005)(26005)(47076005)(36756003)(8936002)(8676002)(336012)(36860700001)(33656002)(966005)(508600001)(6486002)(6512007)(6862004)(86362001)(70586007)(70206006)(4326008)(5660300002)(316002)(82310400004)(81166007)(2906002)(356005)(6506007)(83380400001)(4744005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 10:31:58.3097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3571b5b7-f612-4709-394c-08d9b0c7f9a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2823

Hi Mathieu,

> On 25 Nov 2021, at 22:59, Mathieu Poirier <mathieu.poirier@linaro.org> wr=
ote:
>=20
> Good day,
>=20
> I am in the process of adding support for aarch64 to the xen-sys
> crate[1].  The crate currently supports x86_64 and includes a
> stand-alone "oxerun" application that can be used to validate
> hypercalls.  My goal is to provide the same functionality on arm64.  I
> am looking for a stand-alone aarch64 example, something like an "hello
> world" to help me with the assembler startup code.

We are working on porting XTF to arm64 and already have something running.
I think it could be a good starting point for you:
https://github.com/orzelmichal/xtf/tree/arm-devel

Regards
Bertrand

>=20
> Many thanks for the consideration,
> Mathieu
>=20
> [1]. https://crates.io/crates/xen-sys
>=20


