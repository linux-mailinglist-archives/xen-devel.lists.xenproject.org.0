Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8C94DC378
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 11:00:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291460.494660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUmvi-0005WY-Ki; Thu, 17 Mar 2022 10:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291460.494660; Thu, 17 Mar 2022 10:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUmvi-0005UF-Gr; Thu, 17 Mar 2022 10:00:26 +0000
Received: by outflank-mailman (input) for mailman id 291460;
 Thu, 17 Mar 2022 10:00:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TrlV=T4=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1nUmvg-0005U5-Rn
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 10:00:24 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe02::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f88c97f-a5d9-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 11:00:23 +0100 (CET)
Received: from AS9P194CA0001.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::9)
 by AM9PR08MB7101.eurprd08.prod.outlook.com (2603:10a6:20b:41a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 17 Mar
 2022 10:00:20 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::2d) by AS9P194CA0001.outlook.office365.com
 (2603:10a6:20b:46d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25 via Frontend
 Transport; Thu, 17 Mar 2022 10:00:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 10:00:20 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Thu, 17 Mar 2022 10:00:20 +0000
Received: from bcd9ed9075ee.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A71E2B30-510D-4EA7-8456-DD89B484AF99.1; 
 Thu, 17 Mar 2022 10:00:09 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bcd9ed9075ee.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 17 Mar 2022 10:00:09 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com (2603:10a6:803:3d::28)
 by PA4PR08MB6045.eurprd08.prod.outlook.com (2603:10a6:102:ef::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 17 Mar
 2022 10:00:06 +0000
Received: from VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::c4d3:b586:a5c0:153b]) by VI1PR08MB3056.eurprd08.prod.outlook.com
 ([fe80::c4d3:b586:a5c0:153b%3]) with mapi id 15.20.5081.015; Thu, 17 Mar 2022
 10:00:05 +0000
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
X-Inumbo-ID: 0f88c97f-a5d9-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uul8onTcrtpbmCKemTjiveyt/ma5fUZH87SZfsagwKM=;
 b=KRo+HOqP7IghxHwPTt4nimLNYF3XvNhi8JiRrUHRNwpaJJji8/0MW+g2pwB8U4HHgom3WGg473Fx4Wo3nHhc1S38sYFJljqra8NbsTZEvSz8GhbW/OYy3qp9foW8w2xGj86MEUzrd/CqEYn+JrDQalCTm7G2JnN9YWu8fMJUGHY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKPvyFjQ6KJf5jKMDQJc4O9hYHDEjG0yqBufW9U5IY1OcCOjBmSI5iupTVvSkpekJzGrWU6RJxw32FhG+gkT7/64RQLirWgbd8Dqot0frobEJcf882TVeZMchAjRKOYhZuqIIKNnFi2K7zKkT1XG/PceyyvAysnW01cU+XnsecdoZ2uLMmie42vOAwNtnaZQHU0yaADHZZmMnzrdpTKjrDQcKL0Dlae4cfSu3jU/v8yAZpodn/8rKypP0EjaWS9wB7yzXMh5KKS51TvZ2NLkA04hNj9m8+K/5Kb5h9R27i0ZMwWgc9JnfMJxBNtd58bGVC9LvjDxdhFqGSde/++l+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uul8onTcrtpbmCKemTjiveyt/ma5fUZH87SZfsagwKM=;
 b=eIAyr7oO2MvqOYlb5Mm/CvDfegscB5fPtfHD5A/tExFODoQ/jqy2FGlgnz9DV+MvjDbpFEWoJC+VZNEek8KOMBSrt+H+qeVD9v1s4VSv2QcYMIF+4aHBPU2RZB8Sh/9PZ0QSR1cDkY+FTlGrn5IwvZzfQHBuSQJVY9bz44Ny0ObgBkrEQ2ETR9AjTojXpu+5oQilMJlvW1nDv4UBN9xc/yDhaeLBbKfe16FdiNKAue9WwX9Vn0wJkNYoyjHWfpzE61DA6Bq00UkTlZgso/zSJfE4vzLyUum4rGojk/l4vPXYwOD0N2P9OKoJgofe4FcyU8ahbBaUYh3ursq6wM7gSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uul8onTcrtpbmCKemTjiveyt/ma5fUZH87SZfsagwKM=;
 b=KRo+HOqP7IghxHwPTt4nimLNYF3XvNhi8JiRrUHRNwpaJJji8/0MW+g2pwB8U4HHgom3WGg473Fx4Wo3nHhc1S38sYFJljqra8NbsTZEvSz8GhbW/OYy3qp9foW8w2xGj86MEUzrd/CqEYn+JrDQalCTm7G2JnN9YWu8fMJUGHY=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Jiamei Xie <Jiamei.Xie@arm.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Bjoern Doebel <doebel@amazon.de>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Roger
 Pau Monne <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: RE: [PATCH v5 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Thread-Topic: [PATCH v5 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Thread-Index: AQHYM8WNmsy9ALsOG0iEitvyqooH8ay3Sg6AgAwMHmCAAAypgA==
Date: Thu, 17 Mar 2022 10:00:05 +0000
Message-ID:
 <VI1PR08MB30562C85CEF556F385DF695F92129@VI1PR08MB3056.eurprd08.prod.outlook.com>
References:
 <03798b67ec3a892a302e6be5d87ea676e6376036.1646837462.git.doebel@amazon.de>
 <5cdd27addcec926eb48fdeab08ad3371e7c3fd7c.1646837462.git.doebel@amazon.de>
 <PH0PR03MB6382E2AD10AEF1BC48C55093F00A9@PH0PR03MB6382.namprd03.prod.outlook.com>
 <VI1PR08MB3056A7F7E5DC1DD68212A57692129@VI1PR08MB3056.eurprd08.prod.outlook.com>
In-Reply-To:
 <VI1PR08MB3056A7F7E5DC1DD68212A57692129@VI1PR08MB3056.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A7E856C19DDBE44B80D504B5758813BF.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1dae7b63-8e6e-424e-3d5d-08da07fcf23c
x-ms-traffictypediagnostic:
	PA4PR08MB6045:EE_|VE1EUR03FT006:EE_|AM9PR08MB7101:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB71017B2FBA56E91B0DB8124292129@AM9PR08MB7101.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3Ad9EcdZ5abDpgFS2ZCyoG7DySQVEK7ssPJGZkAQoy5FvJlwa3BN3RSL80YSAT1o/OeZ0C8EStRuUoeS5w/fQr621vG4n0+MFUoRNDErwcLPWbMhLjqygL3XHqKH5lyYDEeIjlxku0HP6GdyZ+mnekDdpLbp54LOU+QG+RVsWCXYFuVFwwSJGtDJBvTP5PeBoWbHi4LNdkmLZkcjlN+ZmI/p8NplZp4isP8iRmrpFeJOKz+sEvCvwHcvAxv9IL1FaG9oEhnZokletOyb06L9LN97hE2CLNFRkFO38Jl+B0ttGIQUwtX3Pr2YzFe4t10kXIf7TN17+/S7UhpA8iKhqsuRg8RvUdoPtuS5/7qCwwAmJGPRy5tXK7Z7xR+ge1G1gNEkT94UniJlmGyhoE7Rgw/MBtFNqpReJKMcaj7kkhxAkQXxv7ARQ847zsRiWcdCUWTOsuPFSQl63eLHOlGNH87fFZ/h0fHvIqkWBfn69PPXQ6i8ejB/cBsM3/qGO9IwHIZY7ck0tBf5p2sbsAEv0xB5+dk50gN2uzG/A/JB1k0BZ+6C1Go+z4T2D8OU3O/jVOPd0+tWYXWg8XbTRgI+SvmvFEyF5qfhRrFwbf3G4zbW8FQrXMigTPereomy9qV8GC9zsM4sQoTovSyQBOglUjEcSodP+4tBTUjFw8iWFHw+H9t1/B0uSPDXSeLOW70IFqu7CNQTm8OMteoeWHUMyw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3056.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(38100700002)(86362001)(38070700005)(122000001)(2940100002)(9686003)(110136005)(186003)(71200400001)(26005)(54906003)(508600001)(7696005)(53546011)(6506007)(64756008)(66446008)(8676002)(4326008)(66476007)(5660300002)(52536014)(66556008)(76116006)(66946007)(8936002)(83380400001)(55016003)(316002)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6045
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a1677ee6-077c-4713-3506-08da07fce997
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PfYA3u/XMfQfA59EogCKrprwnmpEK6mMlCjsdYgtk/54YGVsMOXuQ38jHBf0jeyyfuJEMT31nFvZnUZMWrRBtawLhd9Y1Hzlpsk0hHkXS+ccbh3dCBf/JG0MnXzRyyyYX5MQS7e6NcVLNtSLfEg9WYnDqgCTszQpLihwfAGxpV2LGTx5Qnw6p3jyfmtxrnvk2EnrUz660uzyKEYqlOzY7PYzZAtVqtyd5Qmg55IynxCwZaJ7t3XY1t5tDGpRMGAfReJ/zziI7IhsOV4efz/ny0IEaav4q18bshxF3j3FUchILHKT1YE+lwhQBCH74uEwS6Kxh+4osZyJMDA4xjRglNg7v+2oN9O1tT8cnyZA2wZGpe0LIeNRN2Doi3ZiCNTRu2qPU4Wn6Fh4gLKncM0DE+OiiasfJSnl9f41hZjv/rjKKoP0x2f+0x9Cak9mfN/tDshS8QsJsy7SEEMeNXDeA0oJn/M0zRhcALvNCNEFbao4t6V21bl+k4X9MtQKTuZjlVwNqkXTKMbPbRWcSM9ntoKG7sm5XK1K2JFIm7mZwrW6Ywie1QS2D2Qm6ZVnaEl+BLp8hl3YNMOhFzBwP+PSSX/079YNs5+8WC213ubznozhpnTo2LQ7hBbUpkhJjFAAQ6ha2rw1Iq1HDfhyjB8cEAVGVZZFTMMzMquteJ37BAo7AVFrhVsHTnCAtUj2YrZi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36860700001)(2940100002)(9686003)(356005)(81166007)(47076005)(33656002)(70206006)(5660300002)(82310400004)(8676002)(4326008)(70586007)(86362001)(107886003)(7696005)(508600001)(316002)(6506007)(55016003)(110136005)(54906003)(40460700003)(8936002)(52536014)(2906002)(336012)(186003)(83380400001)(26005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 10:00:20.2439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dae7b63-8e6e-424e-3d5d-08da07fcf23c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7101



> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Jiamei Xie
> Sent: 2022=1B$BG/=1B(B3=1B$B7n=1B(B17=1B$BF|=1B(B 17:17
> To: Ross Lagerwall <ross.lagerwall@citrix.com>; Bjoern Doebel
> <doebel@amazon.de>; xen-devel@lists.xenproject.org
> Cc: Michael Kurth <mku@amazon.de>; Martin Pohlack
> <mpohlack@amazon.de>; Roger Pau Monne <roger.pau@citrix.com>;
> Andrew Cooper <Andrew.Cooper3@citrix.com>; Konrad Rzeszutek Wilk
> <konrad.wilk@oracle.com>
> Subject: RE: [PATCH v5 2/2] xen/x86: Livepatch: support patching CET-
> enhanced functions
>=20
> Hi  Bjoern,
>=20
> > -----Original Message-----
> > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> > Ross Lagerwall
> > Sent: 2022=1B$BG/=1B(B3=1B$B7n=1B(B10=1B$BF|=1B(B 1:12
> > To: Bjoern Doebel <doebel@amazon.de>; xen-devel@lists.xenproject.org
> > Cc: Michael Kurth <mku@amazon.de>; Martin Pohlack
> > <mpohlack@amazon.de>; Roger Pau Monne <roger.pau@citrix.com>;
> > Andrew Cooper <Andrew.Cooper3@citrix.com>; Konrad Rzeszutek Wilk
> > <konrad.wilk@oracle.com>
> > Subject: Re: [PATCH v5 2/2] xen/x86: Livepatch: support patching CET-
> > enhanced functions
> >
> > > From: Bjoern Doebel <doebel@amazon.de>
> > > Sent: Wednesday, March 9, 2022 2:53 PM
> > > To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>
> > > Cc: Michael Kurth <mku@amazon.de>; Martin Pohlack
> > <mpohlack@amazon.de>; Roger Pau Monne <roger.pau@citrix.com>;
> > Andrew Cooper <Andrew.Cooper3@citrix.com>; Bjoern Doebel
> > <doebel@amazon.de>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>;
> > Ross Lagerwall <ross.lagerwall@citrix.com>
> > > Subject: [PATCH v5 2/2] xen/x86: Livepatch: support patching CET-
> > enhanced functions
> > >
> > > Xen enabled CET for supporting architectures. The control flow aspect=
 of
> > > CET expects functions that can be called indirectly (i.e., via functi=
on
> > > pointers) to start with an ENDBR64 instruction. Otherwise a control f=
low
> > > exception is raised.
> > >
> > > This expectation breaks livepatching flows because we patch functions=
 by
> > > overwriting their first 5 bytes with a JMP + <offset>, thus breaking =
the
> > > ENDBR64. We fix this by checking the start of a patched function for
> > > being ENDBR64. In the positive case we move the livepatch JMP to star=
t
> > > behind the ENDBR64 instruction.
> > >
> > > To avoid having to guess the ENDBR64 offset again on patch reversal
> > > (which might race with other mechanisms adding/removing ENDBR
> > > dynamically), use the livepatch metadata to store the computed offset
> > > along with the saved bytes of the overwritten function.
> > >
> > > Signed-off-by: Bjoern Doebel <doebel@amazon.de>
> > > Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> > > CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> >
> > Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>=20
> Tested-by: Jiamei xie <jiamei.xie@arm.com>
>=20
> Cheers,
> Jiamei
Sorry I forgot to add the scope I tested in last email. I tested it on armv=
8a. It worked fine and  didn't break arm.
Tested-by: Jiamei xie <jiamei.xie@arm.com>
> Cheers,
> Jiamei


