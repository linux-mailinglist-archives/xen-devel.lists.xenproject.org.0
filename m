Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A668607A00
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 16:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427729.677071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oltSB-0004Ed-9c; Fri, 21 Oct 2022 14:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427729.677071; Fri, 21 Oct 2022 14:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oltSB-0004BK-5z; Fri, 21 Oct 2022 14:56:55 +0000
Received: by outflank-mailman (input) for mailman id 427729;
 Fri, 21 Oct 2022 14:56:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=scaJ=2W=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oltS9-0004BC-0N
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 14:56:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80042.outbound.protection.outlook.com [40.107.8.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 985d22a3-5150-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 16:56:51 +0200 (CEST)
Received: from AS9PR04CA0119.eurprd04.prod.outlook.com (2603:10a6:20b:531::15)
 by AS8PR08MB9624.eurprd08.prod.outlook.com (2603:10a6:20b:617::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 14:56:49 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:531:cafe::cc) by AS9PR04CA0119.outlook.office365.com
 (2603:10a6:20b:531::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26 via Frontend
 Transport; Fri, 21 Oct 2022 14:56:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Fri, 21 Oct 2022 14:56:48 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Fri, 21 Oct 2022 14:56:48 +0000
Received: from 93ec7cc1da45.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11B51ACF-C84C-4B81-87B0-53E32E730C96.1; 
 Fri, 21 Oct 2022 14:56:36 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 93ec7cc1da45.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Oct 2022 14:56:36 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by AS8PR08MB6038.eurprd08.prod.outlook.com (2603:10a6:20b:23f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 14:56:34 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::8ef6:111f:6067:acd3]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::8ef6:111f:6067:acd3%7]) with mapi id 15.20.5723.035; Fri, 21 Oct 2022
 14:56:34 +0000
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
X-Inumbo-ID: 985d22a3-5150-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YGtSxNE5myEVmeZVr4nwGmHWhkPAtZyFt2cU7ljqFCFAfMna8Wa1+yp/DAgveqHlZ000Y7e34E8y/U2CJEEDksX7gp9872FpW6tu/KNsFUe1YsKe3/rYG347Sjo/NGcDZHev1QnWBJa4/ZEVHSem6lHDMbZRZ63tOMuj1+xHLmZ/sHOWDO8rZZpR4MdLz79NJLmNjq5oiR2K6oGcfolzJk1z9816vKLBgFwV/+OHpPYCzTc/Bv82pHc9NMQ1S4/e95KCiH6K13y1Q/kdweJR6q1a0zSb5Khv7ZuD8+U3w9ju94KSXsg00W8uv1CwpvSJZLXabOGCUgYSrgA5OOFWoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+AJTeUqYNtxnch9ejq92GsYm13vJfj9SOXeRKb1HDc=;
 b=a+13BAqc6dCzbI0vlAUAdIE/AyzFL3Wl9bolHs2eod/2pSREkmuW6/KbRJ+Xdifookk3ff/iC4BV4IdN8wJ86kHrGtouMbuM+jlSLSlwdNrFD1zOXA+BuThQkSo6pmuMSIuFZ4PfPdrm9SmP+aBkq8QNhlaS2uOFfGknBQiJraYXijrSNB0M27JKr4DnhL45YsQr54OzPaSoukvXPpIATW9PFdOgRPyXYYSoejGyJ2Ghrr1RJa4yPcSIMknEIWoNJnz/g0eHAijuCOydCW4BjHe3AVkYgITniTanAzHNEt43dlDPXbrdOV+slwx6A3gUkKZSeGBeEbmpKVb9eVQROQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+AJTeUqYNtxnch9ejq92GsYm13vJfj9SOXeRKb1HDc=;
 b=osQ7xukSJBuB1mH1lwIQr1gWqfgtrJ1PnA2Y8TahB5w13XgT95cF88BpI9f4EAwDKttfloLOrnupdRxTCpOc808HRfmaNOKCbXkTe0kKVw1KaOVYq7ocENToPgZRBHAreqqnIWelDwO3cvWJNXqVOp3PogWX0M4usZU103+otxE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b48faae844691c9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzfO3JzAtCLuGcxXSEDpC0OwPgrpUzHRauBHLsXaJkSipYl4S9kimjIxPdKb1h73WB5UtYkxr8IJr9rwmQ4G+djmtYlvYRpVQWipqbF9NPiOyr49Gh503yw1cbxK7t1g6dSoA82NM6AXILV0OLTAMjGxuGVEcH75f/bx/N/sx1EMIzSwC37AojccN+7t0S/p5eD+bWyRB9iBzpFXssIrDGx+ianmPutmXPOnKhdsMo4Wl+27J5ADDSLfVNZaQFLdeZdu5/LSZlv0kXQzPnx0p6Sqci98BTL4QKPgKh0KorSyrxavfD6tYn54IIyGNwL6Pb0C+n+BPnsHf4VZ5eDVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+AJTeUqYNtxnch9ejq92GsYm13vJfj9SOXeRKb1HDc=;
 b=SNz722bPrgctMZ2J/Dn4nFjJ8cnmxbZ7a/EB2aDmEElzCx8zu1DHgQrgT7I8UCra/epo1Pv6+UlNz+LFGa+/c7szDy81y/H2MNdtrxaijDdITysN3RWL0sEBS89YXSREcqs1amehKyWaQ+owsGdADxtTgKcS4DhZOq0F5duh7p239nLyJCfrMTzP5jS3uS6M51NK91mwIulM/812fMxrCN0zQzn2a5fuMw+S9l6orRc9d7RnH4OtOLjxwt+0A12xcTslUsF2sqh1lYlFb3kqcNVWYFMC6A1V9nslWiDeM17pwxbRhucF4EpxYmcFC7To5l5UDutnylgHbZ9LDfDFzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+AJTeUqYNtxnch9ejq92GsYm13vJfj9SOXeRKb1HDc=;
 b=osQ7xukSJBuB1mH1lwIQr1gWqfgtrJ1PnA2Y8TahB5w13XgT95cF88BpI9f4EAwDKttfloLOrnupdRxTCpOc808HRfmaNOKCbXkTe0kKVw1KaOVYq7ocENToPgZRBHAreqqnIWelDwO3cvWJNXqVOp3PogWX0M4usZU103+otxE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: Oleksandr <olekstysh@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>
Subject: Re: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
Thread-Topic: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
Thread-Index:
 AQHYmuuiv6EaG5L7CkOUEJgfIhzZ362FNeCAgABJ9YCAAAJFgICT+/QAgAACL4CAAASKgA==
Date: Fri, 21 Oct 2022 14:56:34 +0000
Message-ID: <0F295AC7-1D2C-4F5D-A421-9440CEB2B5FA@arm.com>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
 <20220718211521.664729-5-volodymyr_babchuk@epam.com>
 <b4554a1f-73ab-7a46-591b-ccb5bb34ea1f@suse.com> <87ilntgzpj.fsf@epam.com>
 <3aa941de-3dab-0265-02af-38ad1cc3a4f3@suse.com>
 <e9120354-e72e-2774-c382-45ab0cb76220@gmail.com>
 <AS8PR08MB7991C3933F253BE49BA61B76922D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB7991C3933F253BE49BA61B76922D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3778:EE_|AS8PR08MB6038:EE_|AM7EUR03FT006:EE_|AS8PR08MB9624:EE_
X-MS-Office365-Filtering-Correlation-Id: 56b17453-6530-4964-6556-08dab3747acc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jVdxz0qPTibB1tsNMz4aPuESZymAWZeyvher7o69KfUkqfL8y+vyXYXnF0oS/KVEFwrZDFINlQR1Glamw70jgK8L3+ieM4YhPFvTkmihw+KNuyD+dgx8JdLryvSe3vktjpcR91/hnU7RdUcJk0RzHhumwKRyIu4ITFUwughGV3q0W9wpW7HyK185E4yDfx8JIvx2kOxRY7HJJ5A0wvGviVLwcehCkazYzaxi6UJhOBFwba7YtyGNvg5xoNjhi0Bzr4PXdKMSs5Ms7jRl2k9V6+ITRpRj84c6UL7hm7KIZWNeFst6F7LZ51wZ4/w1Y5crVpCVlv1/c/0ia/uIluApe51mIxZI9evnPbmjRCJp+1Hj7HSaf/fPX8jbIRBhPkcDGpIPw7yHD/PWdh7A7arWNLxZ3UkJYLPM98dP9AjRVZjJfjPZR8Zx04m0vVUBohcRowlTOS+Le1lORwAzgk9QlPdzPXVcAYux1yf8zxhknnt8LOXIhg3b2qsPBMBBznKxnlfyqnIq3Trn4mFHX8HkGLcz0OIYvnkOR/JKYN9XMi0ESdTjqyGx8FSZooQLXVo/hKBAbQ2muLAjkFLPdsAgf9a3ZFgM09nkYY6a3TygEyCDxb5PPms+OWyAHf7/QbJ8mlQXVo3Q3xTrjy/mzQbqYzDlIfvt7wpMmQY610BMVIkUO9fumKizHf/BrW9jRtk5JkkCrKi/JnGZC/eNkKwD/KHpNL6XICR6HQQ2e/JQpUEEc0M5HYEQ9wIFtEQHaRglwQy3DqnrqT+OwEXcfGW81f+iPdz4PoGzhALXXo6Cep0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(451199015)(2906002)(86362001)(33656002)(36756003)(38100700002)(38070700005)(122000001)(83380400001)(5660300002)(53546011)(186003)(2616005)(6506007)(26005)(6512007)(71200400001)(6486002)(54906003)(41300700001)(478600001)(6862004)(6636002)(37006003)(8676002)(91956017)(66476007)(66446008)(64756008)(76116006)(316002)(66556008)(8936002)(4326008)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <50AD676810409C47B8789C1F010A5E1D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6038
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c74edc65-c552-405b-0369-08dab3747274
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dl8h7OiAV6xa05r8Nt6MKAyBJl3mTNcAY9ECWcfgnp6sUp3TCHCTKQ4jyDmjoXKv/NvXL08C8yqKQskNFxGoLwAPMqTdVDcEQhA3DIIM93J/XFQRvcnuc3xkoqTKJWWVaQw/VdfZO4CyKWXPD9kei5Cfm02eE0hvWafhqJEo2TTzC9y79q33tn5SfIuAlg0jyRIvmfasSc1XHTladFKC+PWCR+eh8uOWC+aG9nqQqoQTF1NYlpOianUID6q8d5rPtXiCktI1N71aIMD7DGBHUX7o8Sje22arDy6mNPUIVzUjOhURbODirgf45mIA/m7RFs0u6dqBVIQTjklQSKtOX9B4XGCG2ySgpinszTd7UfpR7lrBO+qNArQUBz5d23Y/Klb6FIEM3Iy573bh7J62GHMmdpx5wnWgX0ickjM8T1qi/BKTws94w+heVEXReK3mkRxVUMumlTmSwxLeVehuz2i1Crv7yzJAkcybc5uGDfJR481fA2dkqA2NuNbc4eVqdSrpPpOa13PggPW7rpqAGEvYhasIjWQznwBuEW3Mwhe1QD+rsEviI8DY2y3Bsbb87kxOy+JgPsWDCoEhaQ2DNpq4V/NzLrYStS1+uNFqyCNz1pXWfzzEvTjfI6gwPpkCbNdZ/oXpUJV5SV2kI5Yh7xw6QaM1VQLgyEa2vIlqRpTAexhsng6P7d+BQDTWwtWZMwdUascEPm0vUkcdD9mkBDW8bDmx8Z2xInbFTl11COJ8LprFaWUnEScA/7iOTWDohs0uY1IVluR+eyf7fQSvzQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199015)(36840700001)(46966006)(40470700004)(356005)(54906003)(86362001)(4326008)(47076005)(6636002)(8676002)(70206006)(41300700001)(316002)(6506007)(5660300002)(26005)(83380400001)(37006003)(8936002)(36860700001)(6862004)(336012)(40480700001)(70586007)(36756003)(53546011)(107886003)(6512007)(81166007)(6486002)(82740400003)(186003)(33656002)(40460700003)(2906002)(478600001)(82310400005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 14:56:48.3671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b17453-6530-4964-6556-08dab3747acc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9624

Hi,

> On 21 Oct 2022, at 15:40, Henry Wang <Henry.Wang@arm.com> wrote:
>=20
> (+ Arm maintainers)
>=20
> Hi Oleksandr,
>=20
>> -----Original Message-----
>> From: Oleksandr <olekstysh@gmail.com>
>> Subject: Re: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
>> Hello all.
>> On 19.07.22 13:40, Jan Beulich wrote:
>>> On 19.07.2022 12:32, Volodymyr Babchuk wrote:
>>>> Jan Beulich <jbeulich@suse.com> writes:
>>>>=20
>>>>> On 18.07.2022 23:15, Volodymyr Babchuk wrote:
>>>>>> Patch b4f211606011 ("vpci/msix: fix PBA accesses") introduced call t=
o
>>>>>> iounmap(), but not added corresponding include.
>>>>>>=20
>>>>>> Fixes: b4f211606011 ("vpci/msix: fix PBA accesses")
>>>>> I don't think there's any active issue with the "missing" include:
>>>>> That's only a problem once Arm has vPCI code enabled? In which
>>>>> case I don't think a Fixes: tag is warranted.
>>>> Fair enough. May I ask committer to drop this tag?
>>> I had taken respective note already, in case I end up committing this.
>>> But this is the last patch of the series, so I can only guess whether
>>> it might be okay to go in ahead of the other three patches.
>>>=20
>>> Jan
>>=20
>>=20
>> I am wondering, where this patch could be 4.17 material?
>>=20
>> The patch series seem to get stuck, but the current patch just adds a
>> missing include to fix a build on Arm, so it is completely independent.
>> I agree, there is no issue with the current code base as vPCI is
>> disabled on Arm, so nothing to fix right now. But as PCI
>> passthrough/vPCI on Arm is in the development stage, the developers
>> enable that support in their builds. I think the risk is rather low than
>> high.
>=20
> It seems reasonable to me, but I am curious about what Arm maintainers
> and PCI maintainers think. From the history discussion in this thread I
> think it is pretty safe to include this in 4.17. Thanks for the ping.

I think this can safely go in for 4.17.

Cheers
Bertrand

>=20
> Kind regards,
> Henry
>=20
>=20
>>=20
>>=20
>>=20
>> --
>> Regards,
>>=20
>> Oleksandr Tyshchenko


