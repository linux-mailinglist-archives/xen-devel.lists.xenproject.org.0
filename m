Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4A070F3BF
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 12:08:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538957.839379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1lPs-0006DQ-Rl; Wed, 24 May 2023 10:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538957.839379; Wed, 24 May 2023 10:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1lPs-0006Aw-OW; Wed, 24 May 2023 10:08:24 +0000
Received: by outflank-mailman (input) for mailman id 538957;
 Wed, 24 May 2023 10:08:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5KZ=BN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q1lPr-0006Am-8I
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 10:08:23 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2050.outbound.protection.outlook.com [40.107.13.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9fe9a4e-fa1a-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 12:08:22 +0200 (CEST)
Received: from AM8P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::13)
 by DB4PR08MB8008.eurprd08.prod.outlook.com (2603:10a6:10:38c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 10:07:45 +0000
Received: from AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21a:cafe::24) by AM8P191CA0008.outlook.office365.com
 (2603:10a6:20b:21a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 10:07:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT050.mail.protection.outlook.com (100.127.141.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 10:07:45 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Wed, 24 May 2023 10:07:44 +0000
Received: from d80fb12ad030.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CBB10996-AF54-4F07-9518-598B300C6E2F.1; 
 Wed, 24 May 2023 10:07:38 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d80fb12ad030.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 10:07:38 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB6632.eurprd08.prod.outlook.com (2603:10a6:20b:31c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 10:07:37 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 10:07:37 +0000
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
X-Inumbo-ID: e9fe9a4e-fa1a-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7Ah2BWtayd7RF8HftxaIIV14nkf4CEjMjb21qwZRNA=;
 b=fLvSTblOe5BydaWMIgHuf1J2u7BuB+qNKZZoAkQSdRW6mTe4dwoQK3Ual48TXMyDnApjylbYpMr2QLWwtVOiFM0KrAgMYAhKwXw17Th87pW0gt9+bFfs5CUYSVp+az7AnCmzx5Tdt8L3Iiwj5jdLqH1eP5l6kaWZ/NGe1j5b88Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dfc32a3c81162e68
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYbGYIjaIsq4dNfqP0fjoDTyFeI0swZROS2MFXTCAHSpC+Lz3G/GPRCMA+CTcgsYm8Ajey5R+cvEGmz8h8oKBTJT0lHr8h4PTaC3H3pbL+Zlt2tHoUZFS2jl0kfgNaPNqQtmP0JRdql0p+qZ8fl+77ElhYmDHCfRnZUrzDeEp1TutyiYbAT7PJF9AdXPy9EjbwavflHjegZ/5JqvYoe8Ym+SPR+dz+Ma1J11ImB6Ktn1cxHQ1vWlPKAxpiGW1d2g3jzQR8rXQA+dd2xyOrldUtyYozdC0mfdMVlFQxhtkzyBAp6HRfA/4oq/4D1alQ5qUjWosrIXastYzkmXQGkjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7Ah2BWtayd7RF8HftxaIIV14nkf4CEjMjb21qwZRNA=;
 b=Gwutk3Zh6G2fQPNDQCibSnwXyqAY4B/EhSk1am6WCObyULlc7DKxluWvVCA6/SlsCsZ1ZI1oWVCxcTM20ZlJ26cP4ZZ3kTsmJctHdhgiHIdD4MXC4ofYwRIi7KfKAe2yTIjVpi2yPaEuj3L+9qvZjDcQkssLJxWSO0aKvLtAttkt73hEc8Vfcc0AIpxDs1T3pfvtnPQCZC//tgbGPDE/PvxW4YaN3tbE1NGDMlcHkyQNgsSp/n5Qn7MVfBZhD/1I/NuALc+ERKBbtgQbJhMtWbZNcpLZtwspzlLAL2bM+3+6adL1RdDfhX+ELzRM+RnyvNOHTZWvBYu8jzCyGEbS2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7Ah2BWtayd7RF8HftxaIIV14nkf4CEjMjb21qwZRNA=;
 b=fLvSTblOe5BydaWMIgHuf1J2u7BuB+qNKZZoAkQSdRW6mTe4dwoQK3Ual48TXMyDnApjylbYpMr2QLWwtVOiFM0KrAgMYAhKwXw17Th87pW0gt9+bFfs5CUYSVp+az7AnCmzx5Tdt8L3Iiwj5jdLqH1eP5l6kaWZ/NGe1j5b88Q=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 14/15] Config.mk: move $(cc-option, ) to
 config/compiler-testing.mk
Thread-Topic: [XEN PATCH 14/15] Config.mk: move $(cc-option, ) to
 config/compiler-testing.mk
Thread-Index: AQHZjZUjhpAhcMjsuE+nmzbJuPpI6q9pM+oA
Date: Wed, 24 May 2023 10:07:36 +0000
Message-ID: <38763156-45E5-4A88-ADA4-F8E68E595A3D@arm.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-15-anthony.perard@citrix.com>
In-Reply-To: <20230523163811.30792-15-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB6632:EE_|AM7EUR03FT050:EE_|DB4PR08MB8008:EE_
X-MS-Office365-Filtering-Correlation-Id: c94c5bb4-d30f-48b1-3ffe-08db5c3eb82d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 g34Yeu8EXdT4GMQPvqGxNSgAzlvhLDzO7RS3stWA6RM34zkm30FIsxoStp+VckwMWj4hNCtR0SMV/v15WwU53eo86MjmsDGiBKfUXQiSt1VSWJCNBIBExFppiX1bXXtONwxDXOqaRknBIsoD8fkV7VoCB6FOxJgJE6UQLvlwoP+oyilTJ1QoD+SkElM+vUeOEYoMK4E8rBQ5mIkF3V65IOph7C5s+jbpuz/49ZknRIna9pyP9tS4rdIIUPXBbxKIWPwjLxcDRKq3/KcDGf7bnz90rJJOlIG2/m2Z2k3wiP0kjDK04oKKlpu8QASlITFit9RM8PGl/G1I79HxmMXO5d2e/VojEOhl1sRufKOIRGag6NE6qtkkKIW6vcdM5KcfJEvcd2CDUuOeIZHh9o6GmI/ESscLzUzT7ka9sVsVqaUdIA8hYB3oPN+36Vo/YH7/aPKD9mKYpFxaZvDLqnqskTxCaodpVGUUV0K5dxfnkoznqE7zv2AFWWK4FJG1CPotRI+UVvio1o4GkrKzwqQPmDbFAj7WZPEHOVygWJ4hVpkV4JqbdKhi2BCBuuVnIgHzQq/Kc3yxodvyFsDd981MKn9VOujakHAlAdoxoh1t5RpfCk7Jstf1LQWlu4CPMyZURq9/EpnskbwBHDGvyMgblQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199021)(8936002)(8676002)(5660300002)(86362001)(122000001)(53546011)(6506007)(6512007)(26005)(2906002)(186003)(2616005)(4744005)(36756003)(66556008)(64756008)(6916009)(4326008)(66946007)(76116006)(66476007)(91956017)(66446008)(71200400001)(316002)(33656002)(54906003)(6486002)(41300700001)(478600001)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <265DEE2B0FAC9C4CB6C4E4590DBD1F21@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6632
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6ae12219-80ae-40f5-f0d9-08db5c3eb35e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vEB3+kgAFv+IXBe0nfMq0CFt0DEOlXFNRWJT85DGGUqm2YArWun0Al6S2DZNQU7ygFZR29/1NDxakW7vumvzTb5NvNrHTuKLxVO8CEms5olHcQ4NPn3gOWkD8vHaaSI2ANngSzxyqY/e2TEQ9/vLHi4783Ga0sobaCKfWaIy8DfzE3rPd7bVsGvREyIHFHtjVEYJG0w5b3kUV2pX+wLAFdVBu3G4axbbzPhEPz1y0aRAk8VNH0d8tWsQle7MCwFBZrjQ9i/XmIUF6vswKRvz5DWnbMJv1GEWdhI1sXc9f3cpRbuq+PUYVsPfB/jbzvR0FmsUL6tiQteDn18e59ftZHl0JIxAZ4N/Vvw2bW4wq5nX76eYzudfT6Y09BNt13/wI7SFiTmCsakNAopGyt5Pw+9eZK6peA9ig2pXSEKrev0zkXHzfuBPQj77RNejJSuzex1WMXResG3ORqNoC9RZMulifIPK/1TydL9V4P5R0tWYC2QCbULDBLtPzCnfwQ55mpJiZq7wfin14CDL7AftBIIDd71SR1rfHvFMHAvTDV1deb7VbuLVVBwFPJNcRMbkndgIN2WR14Y59bgKEHlEuYZNb0zvpr/vscpWWefbIMyXsPIvBqOuSvpbmY1mGoTtexaRyLGZ4943ZIsdPTe4hQorPtmRG+ZQnAhYs4UvViKK2rLxdZ8xXt5n5DhmhGxj1KUus2mvabEiqUSwAikVVKuadoCG7GoebE3aazsmWEJD209EWQYUaK+SS5Ni52fT
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199021)(46966006)(40470700004)(36840700001)(54906003)(6486002)(41300700001)(82310400005)(316002)(70206006)(70586007)(4326008)(8676002)(5660300002)(8936002)(6862004)(478600001)(86362001)(82740400003)(40460700003)(6506007)(81166007)(356005)(186003)(26005)(53546011)(33656002)(40480700001)(4744005)(6512007)(2906002)(2616005)(336012)(36860700001)(36756003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 10:07:45.0133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c94c5bb4-d30f-48b1-3ffe-08db5c3eb82d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8008



> On 23 May 2023, at 17:38, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> In xen/, it isn't necessary to include Config.mk in every Makefile in
> subdirectories as nearly all necessary variables should be calculated
> in xen/Makefile. But some Makefile make use of the macro $(cc-option,)
> that is only available in Config.mk.
>=20
> Extract $(cc-option,) from Config.mk so we can use it without
> including Config.mk and thus without having to recalculate some CFLAGS
> which would be ignored.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>




