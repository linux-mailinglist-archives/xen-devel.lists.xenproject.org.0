Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 455CC57CF92
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 17:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372867.604883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEYFT-0001Qj-WE; Thu, 21 Jul 2022 15:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372867.604883; Thu, 21 Jul 2022 15:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEYFT-0001NZ-SW; Thu, 21 Jul 2022 15:37:59 +0000
Received: by outflank-mailman (input) for mailman id 372867;
 Thu, 21 Jul 2022 15:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FenC=X2=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oEYFR-0001NP-8k
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 15:37:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60082.outbound.protection.outlook.com [40.107.6.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 161b709c-090b-11ed-bd2d-47488cf2e6aa;
 Thu, 21 Jul 2022 17:37:54 +0200 (CEST)
Received: from AS9PR06CA0508.eurprd06.prod.outlook.com (2603:10a6:20b:49b::32)
 by DB6PR08MB2885.eurprd08.prod.outlook.com (2603:10a6:6:1b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Thu, 21 Jul
 2022 15:37:50 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::43) by AS9PR06CA0508.outlook.office365.com
 (2603:10a6:20b:49b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Thu, 21 Jul 2022 15:37:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Thu, 21 Jul 2022 15:37:49 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Thu, 21 Jul 2022 15:37:49 +0000
Received: from c493aea34d7e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B5B7212F-22AB-4E86-87C4-CC63339E1728.1; 
 Thu, 21 Jul 2022 15:37:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c493aea34d7e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Jul 2022 15:37:42 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by VI1PR0802MB2559.eurprd08.prod.outlook.com (2603:10a6:800:b4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19; Thu, 21 Jul
 2022 15:37:39 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 15:37:39 +0000
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
X-Inumbo-ID: 161b709c-090b-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZdUQE9JF2kWzGremfRZWJq6XQ9sOQ+rQSt7hgL9tzYdhNhHORmmTWMgTqcWpceJRKRFsVhMl6/AzHAfIP5KuKls3m7w1iumEcL9oI9T9r1NEiVWWmcEJylS22Et/y5kYbOLEsGJj+xznEx1g5UCeNe4TdhgsqU7of13Tri4assQqrw/oc9fP6g8Y+5lWm9XnhSrE/sVSDwifBWJWrtOfvGgmFRNafrpjOOgUFg9Ua9aam3+t//AkzsR0MRtXSel94hVBE7oRqkYzLpBvXbuN0PNV9P+BAgGq7wOK5jaTqQ59x2IfjVrH+e4nxg65KbTG4a5uDzAf5EpsGTxtPM6IsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghJcKzz8onE9Vr5Ev7HNN7ipqiTT42ctbkRbF9KRJPI=;
 b=RTWuUf/hsSeUXCKlVyyVOqo36Z8ekR4scfPlJToAC20JHUqUytw3aDFptNMiEc6j/Fkndi4xQuL9gD92ef4gc+K2KIgZ0okcLf/FU7g7cnB34VcKC4voG/p6W6pE61W0QncWJ72by2c+CoIuF+dCNNEJyrG2PPwUJcijRosGuNdzHO45yd4P7cmKeUZIPuqv3st5mZzAQg4JT79XoYhuZjOpOcVUd1vnrwqsy6YmxzHoXJH9GcbcfCUbPrFQ+OeM67ddJgh4M22m1EiToczPkMLiZiQcRSw6b5YQfr0tIygaEQXu3Qg/xaihhVw/ycZDqjGdKy7JD2Ep9fhR+umoEA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghJcKzz8onE9Vr5Ev7HNN7ipqiTT42ctbkRbF9KRJPI=;
 b=oH4NEkQLKWLQtRq8sQmLeyI5faMd1orvbp6rQmc61gKaRihex7YlbpiqYhfVYHxCqzkTLexEiY1af7vdE/qbVHnaKgT2MuIaq6MJnOOOIcHxnm4xM4II2TL7rM9OQ7IhxBjuExi7JGmqoce7p7tRuzLrohPjHmytKnEpSUZdZCI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d706cce1b2170696
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUDPRLDPtC4RCUj1MOWiGBQXLCmGyrVN9QFXQYAcqtNmfc4oUez0U3Xeox/8Beq5xu7Tdxw7fmfx7Mt2gpxpNA8BI7R0AGFKXJhixDk+aSBTKmocoCzqrOIk3DAmjWKfGRb4iiHk3FL2lJjTm7LE9AoSLeIHzyJprs2X8lw9kA8surXgt4Kv0MUbuh4ZA98BHeMA5uv5poJvBIZOWfu7/cw82KkQcSdrL5E3pZKAPEmi7PzxAwiFd1Fnyw9F4byuNQsaZYOoulLymZOc4VtWVNM4SiFf1KfKDYxsKk6enUQrjWbZTQZIPSC8GguSGdUV9rtvanXWDa9IhkxF5hVokA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghJcKzz8onE9Vr5Ev7HNN7ipqiTT42ctbkRbF9KRJPI=;
 b=NG05nCQc4aqTuLPfG52GDDh753pRFBDgBtxbPoIhPf1UI1jFbULWtnDU8/IRyV8EdJy6VQSeHxSC01L/fKBpoTYBsmJy40RAc0p1f+1ivySwj/8YCUCQ1unUnMmg/oCSnFX4w2mfLvkdztrvv4xStNf6aaqb3etvlfJXS6jtOJzfPe0oL1NvfYxXDw2CuBW42v/RcTP7KNkWU/cdoPaX232Jw0FU9IGmyBj675wQU80ltNix59rJA1NKVgwpxuzPLoa9gJ4jTGbdPa8Hmd2YSS97GprbQv+GovEguvxW6kLpnixj6ix1jUipIKTBNMlQjeb/TiJ2aK+desNisqczgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghJcKzz8onE9Vr5Ev7HNN7ipqiTT42ctbkRbF9KRJPI=;
 b=oH4NEkQLKWLQtRq8sQmLeyI5faMd1orvbp6rQmc61gKaRihex7YlbpiqYhfVYHxCqzkTLexEiY1af7vdE/qbVHnaKgT2MuIaq6MJnOOOIcHxnm4xM4II2TL7rM9OQ7IhxBjuExi7JGmqoce7p7tRuzLrohPjHmytKnEpSUZdZCI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich
	<jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Thread-Topic: [PATCH 2/8] xen/evtchn: modify evtchn_alloc_unbound to allocate
 specified port
Thread-Index:
 AQHYhkXaSSR0QDc2DUiowhnmyNd/Sq1bgqiAgB3xuACAAai8gIAA1/CAgAA2U4CAAAT8AIAABuwAgAAKeYCAAAnjAIAAC4AAgAAEsgCACtZcgIAAFXWAgAGspoCAAAsFgIAAI8AA
Date: Thu, 21 Jul 2022 15:37:39 +0000
Message-ID: <E290A20A-D6C7-4154-A0A4-3FC91C479B25@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <5ea66595248c41a011ac465bfabd7a7a40dcd565.1655903088.git.rahul.singh@arm.com>
 <2cdde2eb-33ac-568b-a0ae-b819b7b4161b@xen.org>
 <1494EC8C-9916-472F-9285-57C0FF656919@arm.com>
 <abcf96b0-1c41-476a-de08-adb3eaaaa05d@xen.org>
 <addaeb82-2d15-a46e-f9f9-274572d2ddc2@suse.com>
 <9711c08f-7e16-daf3-f010-1e6a53b0b9a0@xen.org>
 <5f200481-ed3c-a463-90aa-3718c0ab57a3@suse.com>
 <758779b3-ef39-aa95-15c9-9b84b952e80b@xen.org>
 <3b42f9ab-383c-694c-cef0-5d24531e556a@suse.com>
 <019c5cb4-7e6a-d822-3c02-e3199d499106@xen.org>
 <93E40C29-DD1E-4C9B-936B-45ACA69BBD66@arm.com>
 <d868fab2-c55a-7e2c-cd54-6dc3eedbbf26@xen.org>
 <BB3ECBA1-A028-44A0-A6BB-5D6BD009C095@arm.com>
 <ee0a62af-fa79-3699-7652-d976a8690995@xen.org>
 <99D4D342-5DF7-4F85-A311-4D03967D77DB@arm.com>
 <b98c14d6-d788-427f-3fe4-b36bc85aae59@xen.org>
In-Reply-To: <b98c14d6-d788-427f-3fe4-b36bc85aae59@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d3c6801e-0091-4dfa-bc48-08da6b2ef7ab
x-ms-traffictypediagnostic:
	VI1PR0802MB2559:EE_|AM5EUR03FT042:EE_|DB6PR08MB2885:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 usW4p0QtsxruVzT5z4KuEjS9Ne2UH9JUO35BezAcKDVjCi5lgULT/8gro+vNwxUNUqMwnxQdtXjXf7wI/w15Ct0OJSnSWCAd3GKcuCZ32Exd2khtgKjP/puS0v/NuChA/RKnyRJ1NnL6Pa9KYqylCwwOEuUsi5ySsrX2hoBTbwkj4Aw7eVvQrZNJ/a7dnJrgcqX2N7+QD7fs/9sKb027rV0RCtgVPIji7ip/Qk2kHjbWQi5fmNr5vf5sfJ/LKIQt3vVTXckCmIg5m6d/JbT+toUTzL7aqhAsvxbEQllyPoPBUrTbmkaqNdVkX+DZGzMOJPLTG7nhFf3zE9oL6296Jo5lusmBqe7fVosqlZ65aTQknVVDIaoO7liIZ2sgziXvPK5UKqOvxtCuEYdRF7TjrxTPROJgZLQ/Fh36r8hbz/CghQ22Y3DNHGXD1qG9UhQE+F6+wU/TZ4gihUGhpZzDiZOtkc8rP2EMpSCBr+Meej0iKnjNN5mgsagRrMdLVykCdlfquU4PshGeEFZfsVoLG+mCDkQlDQfNDzZVylSkHXpUlURT/tr2NThLfbOSRW3ytSeTQavf/izvG9n+j2Ef2gxzaIOFl8DVOE5ZvvdqlFl5nioFxhaQoTTdRplFIcbnM39i3RW1iBZFPATAOoJ5oHXH+Z51RnosCLJ8M/QR0Yt0bAD6+6l0++vxfcbAPFaPQG9GumjVNKUBz0bcEx4Tmyco3FKuQFw61GyESxS7OzhL/vFdtBX75Gg2vdM+cnBQhH3V075n5J2p+MLIH9UJteblSnInVQS4wQjqyD7hsloBtJorWXLKXgIn9Yc6zI5GGU64bmWp9iA3l1rk0xpx0w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(33656002)(6512007)(6506007)(53546011)(54906003)(6916009)(2616005)(26005)(36756003)(41300700001)(71200400001)(316002)(186003)(6486002)(478600001)(83380400001)(8676002)(66446008)(66946007)(4326008)(66476007)(64756008)(66556008)(2906002)(86362001)(76116006)(38070700005)(122000001)(8936002)(5660300002)(38100700002)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <957630487271DA47B1C2D7D07F406037@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2559
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ccef06d9-3eec-4f4b-5c01-08da6b2ef1af
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jmt+pQ8+7tnBDW+REQyfeslslo0BiX3NqfoET/TZ9crDBOzxdHXnNJXOvzVLNiJsfaNhLrDf66Vcd/Q5O1Kx/NWZFNTprrQaP5xk47RUudQiBQEz+CGWr+mogsQmGXThH+jrqpTzCB5hVyFMTuJVGqnIkFymVoEAB9LpIXDvUaCaODuNpcmC56+dFB3nXFXUWYgRtbOUMW1MFHVdkHnqX5nA2HsnPImKx8QlkJMLTD1OH9sp9kwDHv21DJVQjr5lCLBDcxwR1wY4J3omndTPEHwnSIvwGgYpEWpiANlFwgPh/vxWwE07W0iVpAYgTXS7ZFTxkLsw/XtEbLX1DfgUwKAyQloonzbTcLlkJ1MwUO3K5gY3SCzQSVo7Mm9kM5e5IOON1m6NDnRCVT8h6akH8OIEdUYgrPBpuDD9aR8OpiAtkRdVwx2CSaLB50rErx/oz+XAsM12i0AWPRtrnNnlrm3ydNQyFajIUKpJhn3oDsu7/uC74oUqLzAf0Gnx7EI+u0vNlX+oyuSwyQJ2ksS5ZYGLm2FQuAtdj06CXkJ4MfRYxXGpPitTrGPLCvnvh0Rx9dnjSQflGpy8wEhOTDK5LnVFql4fLIm4PNkZQC8Q+NaDO3i5Ki4197ZShv7ULNkQd3sQ+DPxZaSr1DFGuUz/a0aQVeZpEv5vRcZ4JkWlW24N/liVUVx0b5IpepwVHz6vgTvwAodaYXvwx2xdT3mN3muiIVAx9bWuyc+VCu3YM11qOACeTGt+CVpylb6T8MvqEZUuBO1kOOiHt2jtsaWAevX3Mnna+ACJqM1TUdloQoebFEauAhpbUH/1tJGcXgA8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(396003)(136003)(40470700004)(36840700001)(46966006)(186003)(82310400005)(82740400003)(356005)(81166007)(2906002)(53546011)(36860700001)(6512007)(26005)(86362001)(83380400001)(47076005)(336012)(70586007)(316002)(4326008)(54906003)(70206006)(2616005)(40460700003)(6486002)(36756003)(8936002)(40480700001)(5660300002)(6862004)(478600001)(33656002)(8676002)(41300700001)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 15:37:49.3616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c6801e-0091-4dfa-bc48-08da6b2ef7ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2885

SGkgSnVsaWVuLA0KDQo+IE9uIDIxIEp1bCAyMDIyLCBhdCAyOjI5IHBtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IE9uIDIxLzA3LzIwMjIgMTM6NTAsIFJhaHVs
IFNpbmdoIHdyb3RlOg0KPj4gSGkgSnVsaWVuLA0KPiANCj4gSGkgUmFodWwsDQo+IA0KPj4+IE9u
IDIwIEp1bCAyMDIyLCBhdCAxMjoxNiBwbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4g
d3JvdGU6DQo+Pj4gDQo+Pj4gSGkgUmFodWwsDQo+Pj4gDQo+Pj4gT24gMjAvMDcvMjAyMiAxMDo1
OSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+PiBPbiAxMyBKdWwgMjAyMiwgYXQgMToyOSBwbSwg
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IA0KPj4+
Pj4gDQo+Pj4+PiBPbiAxMy8wNy8yMDIyIDEzOjEyLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0K
Pj4+Pj4+PiBPbiAxMyBKdWwgMjAyMiwgYXQgMTI6MzEsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOg0KPj4+Pj4+Pj4gSSBjYW4ndA0KPj4+Pj4+Pj4gc2VlIHdoeSBpdCB3b3Vs
ZCBiZSB3cm9uZyB0byBoYXZlIGEgbW9yZSB0aWdodCBsaW1pdCBvbiBzdGF0aWMgcG9ydHMNCj4+
Pj4+Pj4+IHRoYW4gb24gdHJhZGl0aW9uYWwgKCJkeW5hbWljIikgb25lcy4gRXZlbiBpZiBvbmx5
IHRvIG1ha2Ugc3VyZSBzbw0KPj4+Pj4+Pj4gbWFueSBkeW5hbWljIG9uZXMgYXJlIGxlZnQuDQo+
Pj4+Pj4+IA0KPj4+Pj4+PiBUaGlzIGlzIHNpbWlsYXIgdG8gWGVuIGZvcmJpZGRpbmcgdG8gY2xv
c2UgYSBzdGF0aWMgcG9ydDogaXQgaXMgbm90IHRoZSBoeXBlcnZpc29yIGJ1c2luZXNzIHRvIGNo
ZWNrIHRoYXQgdGhlcmUgYXJlIGVub3VnaCBldmVudCBjaGFubmVsIHBvcnRzIGZyZWVkIGZvciBk
eW5hbWljIGFsbG9jYXRpb24uDQo+Pj4+Pj4gT24gb3RoZXIgc2lkZSB3ZSBuZWVkIHRvIGJlIGNh
dXRpb3VzIG5vdCB0byBhZGQgdG9vIG11Y2ggY29tcGxleGl0eSBpbiB0aGUgY29kZSBieSB0cnlp
bmcgdG8gbWFrZSB0aGluZ3MgYWx3YXlzIG1hZ2ljYWxseSB3b3JrLg0KPj4+Pj4+IElmIHlvdSB3
YW50IFhlbiB0byBiZSBhY2Nlc3NpYmxlIHRvIG5vbiBleHBlcnQgYnkgbWFnaWNhbGx5IHdvcmtp
bmcgYWxsIHRoZSB0aW1lLCB0aGVyZSB3b3VsZCBiZSBhIGxvdCBvZiB3b3JrIHRvIGRvLg0KPj4+
Pj4gDQo+Pj4+PiBJdCBpcyBub3QgY2xlYXIgdG8gbWUgd2hldGhlciB5b3UgYXJlIHJlZmVycmlu
ZyB0byBhIGRldmVsb3BwZXIgb3IgYWRtaW4gaGVyZS4NCj4+Pj4+IA0KPj4+Pj4gT24gdGhlIGFk
bWluIHNpZGUsIHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRoZXkgaGF2ZSBhbiBlYXN5IHdheSB0byBj
b25maWd1cmUgZXZlbnQgY2hhbm5lbHMuIE9uZSBrbm9iIGlzIGFsd2F5cyBnb2luZyB0byBlYXNp
ZXIgdGhhbiB0d28ga25vYnMuDQo+Pj4+PiANCj4+Pj4+IE9uIHRoZSBkZXZlbG9wcGVyIHNpZGUs
IHRoaXMgY291bGQgYmUgcmVzb2x2ZWQgYnkgYmV0dGVyIGRvY3VtZW50YXRpb24gaW4gdGhlIGNv
ZGUvaW50ZXJmYWNlLg0KPj4+Pj4gDQo+Pj4+PiBDaGVlcnMsDQo+Pj4+IFRvIGNvbmNsdWRlIHRo
ZSBkaXNjdXNzaW9uLCBJZiBldmVyeW9uZSBhZ3JlZSBJIHdpbGwgYWRkIHRoZSBiZWxvdyBwYXRj
aCBvciBzaW1pbGFyIGluIHRoZSBuZXh0IHZlcnNpb24gdG8gcmVzdHJpY3QgdGhlDQo+Pj4+IG1h
eCBudW1iZXIgb2YgZXZ0Y2huIHN1cHBvcnRlZCBhcyBzdWdnZXN0ZWQuDQo+Pj4gDQo+Pj4gSSBh
bSBmaW5lIGlmIHRoZSBsaW1pdCBmb3IgZG9tVSBpcyBmaXhlZCBieSBYZW4gZm9yIG5vdy4gSG93
ZXZlciwgZm9yIGRvbTAsIDQwOTYgaXMgcG90ZW50aWFsbHkgdG9vIGxvdyBpZiB5b3UgaGF2ZSBt
YW55IFBWIGRyaXZlcnMgKGVhY2ggYmFja2VuZCB3aWxsIG5lZWQgYSBmZXcgZXZlbnQgY2hhbm5l
bHMpLiBTbyBJIGRvbid0IHRoaW5rIHRoaXMgd2FudHMgdG8gYmUgZml4ZWQgYnkgWGVuLg0KPj4g
QWdyZWUuDQo+Pj4gDQo+Pj4gSSBhbSBub3QgZW50aXJlbHkgc3VyZSB3ZSB3YW50IHRvIGxpbWl0
IHRoZSBudW1iZXIgb2YgZXZlbnQgY2hhbm5lbHMgZm9yIGRvbTAuIEJ1dCBpZiB5b3Ugd2FudCB0
bywgdGhlbiB0aGlzIHdpbGwgaGF2ZSB0byBiZSBkb25lIHZpYSBhIGNvbW1hbmQgbGluZSBvcHRp
b24gKG9yIGRldmljZS10cmVlIHByb3BlcnR5KS4NCj4+IFdlIG5lZWQgdG8gc3VwcG9ydCB0aGUg
c3RhdGljIGV2ZW50IGNoYW5uZWwgZm9yIGRvbTAgYWxzbywgaW4gdGhhdCBjYXNlLCB3ZSBuZWVk
IHRvIHJlc3RyaWN0IHRoZSBtYXggbnVtYmVyIG9mIGV2dGNobiBmb3IgZG9tMCB0byBtaXRpZ2F0
ZSB0aGUgc2VjdXJpdHkgaXNzdWUuDQo+IA0KPiBJdCBzb3VuZHMgbGlrZSB0aGVyZSBhcmUgc29t
ZSBtaXN1bmRlcnRhbmRpbmcgb3IgSSBhbSBtaXNzaW5nIHNvbWUgY29udGV4dC4gVGhlIHN0YXRp
YyBldmVudCBjaGFubmVscyB3aWxsIGJlIGFsbG9jYXRlZCBhdCBib290LCBzbyB0aGUgd29yc2Ug
dGhhdCBjYW4gaGFwcGVuIGlzIGl0IHdpbGwgYmUgc2xvd2VyIHRvIGJvb3QuDQo+IA0KPiBNeSBw
b2ludCByZWdhcmRpbmcgZmlmbyB3YXMgbW9yZSBpbiB0aGUgZ2VuZXJpYyBjYXNlIG9mIGFsbG93
aW5nIHRoZSBjYWxsZXIgdG8gc2VsZWN0IHRoZSBwb3J0LiBUaGlzIHdvdWxkIGJlIGEgY29uY2Vy
biBpbiB0aGUgY29udGV4dCBvZiBub24tY29vcGVyYXRpdmUgbGl2ZS1taWdyYXRpb24uIEFuIGVh
c3kgd2F5IGlzIHRvIHJlc3RyaWN0IHRoZSBudW1iZXIgb2YgcG9ydHMuIEZvciB5b3UsIHRoaXMg
aXMganVzdCBhbiBpbmNyZWFzZSBpbiBib290IHRpbWUuDQo+IA0KPiBGdXJ0aGVybW9yZSwgdGhl
cmUgaXMgYW4gaXNzdWUgZm9yIGRvbTBsZXNzIGRvbVVzIGJlY2F1c2Ugd2UgZG9uJ3QgbGltaXQg
dGhlIG51bWJlciBvZiBwb3J0IGJ5IGRlZmF1bHQuIFRoaXMgbWVhbnMgdGhhdCBhIGRvbVUgY2Fu
IGFsbG9jYXRlIGEgbGFyZ2UgYW1vdW50IG9mIG1lbW9yeSBpbiBYZW4gKHdlIG5lZWQgc29tZSBw
ZXItZXZlbnQgY2hhbm5lbCBzdGF0ZSkuIEhlbmNlIHdoeSBJIHN1Z2dlc3RlZCB0byB1cGRhdGUg
bWF4X2V2dGNobl9jaGFubmVsLg0KDQpUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLiANCj4g
DQo+PiBJZiB0aGUgYWRtaW4gc2V0IHRoZSB2YWx1ZSBncmVhdGVyIHRoYW4gNDA5NiAob3Igd2hh
dCB3ZSBhZ3JlZWQgb24pIGFuZCBzdGF0aWMgZXZlbnQgY2hhbm5lbCBzdXBwb3J0IGlzIGVuYWJs
ZWQgd2Ugd2lsbCBwcmludCB0aGUgd2FybmluZyB0byB0aGUgdXNlciByZWxhdGVkIHRvIGZpbGwN
Cj4+IHRoZSBob2xlIGlzc3VlIGZvciBGSUZPIEFCSS4NCj4gDQo+IFNlZSBhYm92ZS4gSSBkb24n
dCBzZWUgdGhlIG5lZWQgZm9yIGEgd2FybmluZy4gVGhlIGFkbWluIHdpbGwgbm90aWNlIHRoYXQg
aXQgaXMgc2xvd2VyIHRvIGJvb3QuDQoNCk9rLiBJIHdpbGwgbm90IGFkZCB0aGUgd2FybmluZy4g
SnVzdCB0byBjb25maXJtIGFnYWluIGlzIHRoYXQgb2theSBJZiBJIGFkZCBuZXcgY29tbWFuZCBs
aW5lIG9wdGlvbiAibWF4X2V2ZW50X2NoYW5uZWxz4oCdICBpbg0KbmV4dCB2ZXJzaW9uIGZvciBk
b20wIHRvIHJlc3RyaWN0IHRoZSBtYXggbnVtYmVyIG9mIGV2dGNobi4NCg0KUmVnYXJkcywNClJh
aHVs

