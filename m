Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB263645B5
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 16:14:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112997.215380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUeJ-0007pj-Qr; Mon, 19 Apr 2021 14:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112997.215380; Mon, 19 Apr 2021 14:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUeJ-0007pG-NL; Mon, 19 Apr 2021 14:13:15 +0000
Received: by outflank-mailman (input) for mailman id 112997;
 Mon, 19 Apr 2021 14:13:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO6R=JQ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lYUeI-0007oW-Ks
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 14:13:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.55]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35401092-0d09-4897-9b1b-8119f9b8f723;
 Mon, 19 Apr 2021 14:13:12 +0000 (UTC)
Received: from DU2PR04CA0090.eurprd04.prod.outlook.com (2603:10a6:10:232::35)
 by DBBPR08MB6218.eurprd08.prod.outlook.com (2603:10a6:10:209::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 14:13:10 +0000
Received: from DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::e0) by DU2PR04CA0090.outlook.office365.com
 (2603:10a6:10:232::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Mon, 19 Apr 2021 14:13:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT044.mail.protection.outlook.com (10.152.21.167) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 14:13:09 +0000
Received: ("Tessian outbound 700fd1fc53d5:v90");
 Mon, 19 Apr 2021 14:13:09 +0000
Received: from c24b3c6c2a24.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B2FFAC11-0175-421C-A124-347A2A5876AE.1; 
 Mon, 19 Apr 2021 14:13:03 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c24b3c6c2a24.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 19 Apr 2021 14:13:03 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR0801MB1869.eurprd08.prod.outlook.com (2603:10a6:800:88::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Mon, 19 Apr
 2021 14:13:00 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 14:13:00 +0000
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
X-Inumbo-ID: 35401092-0d09-4897-9b1b-8119f9b8f723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pptalEV3k+fmXr4wxakCQXvd6uX8C5aeE2ux0ApGNTA=;
 b=jrEeP1HQxXglBQ7V/TgWPjk8QSQ1lymqGhZg/szVYo64PIqy3HEMD1REuhzwCbWTczmH9uyajegLxaZ7DOwu2UtwTec9xOU7QWWZPz81Pi5p3tOo8ZjNfvDgbOoUE20nnFj8OpAOf4ntVBNvpgq2/ztC0HfXu7dq63nuDy77rOc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0f4740b781314c57
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4Eu3X5d/2EZ85/+URIfUmnSnDbv//ZYUj4mvr1cpRza/lwz12jZ1XFC/BZwzkpsgYjvFy16u0ipTPHACFDXMV6EB1gr8d2IcPEZjyc+W2IdKVyKsxnqX0kV64SiY8NkCLvfMAi3Pks/QGO5+jty62wB/prHvKqKW4bxXWC3iCpgtDH10LVnwdgPDbSD3nZ3NWj13yiIZoRYJN7iG9Z83htSJMmIM4O02tjNgKyazX8Igq9vOePD5tuxFOnEHK2irmGF5Zi1UnDl0zQi4E1R39KyPx4ZY5RXFyx0LKZXd8fNoZ5W9zz8feBujNNJaDlgG9acL0tHVUJfqrIqfVetiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pptalEV3k+fmXr4wxakCQXvd6uX8C5aeE2ux0ApGNTA=;
 b=fQ62jR+nPtJLaH8M06ttKoGp8iFnOz9D/wCAMv76+6oNH1vFPzICuTtP9oC7gkz3LN+yzoGMRNxHAA8M4HLO4V9x0a2IzNZlmLTBh+hhIzuhw4K9WesBG5wf5zIxLjX5MNYK7SRQbQpoVNEsyE5Ef2zXPw74tNhLJq75SsCv+G2kiQZPb+VnCGRxLkpNTwP2NJl6UibwE8YamtGj8nkrxvmkt14QBsxNW0JOMGMIfRg5ETaTgQ+mDfHqNQV2sqzvoXztxDcWrLqYDIwhMI8jyOyyTsU0jMAvrvLQ8eug10ADe/SnbXkMfHTnYLeGOXzldOwEwlqpDSMLa57PLoCkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pptalEV3k+fmXr4wxakCQXvd6uX8C5aeE2ux0ApGNTA=;
 b=jrEeP1HQxXglBQ7V/TgWPjk8QSQ1lymqGhZg/szVYo64PIqy3HEMD1REuhzwCbWTczmH9uyajegLxaZ7DOwu2UtwTec9xOU7QWWZPz81Pi5p3tOo8ZjNfvDgbOoUE20nnFj8OpAOf4ntVBNvpgq2/ztC0HfXu7dq63nuDy77rOc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4] xen/arm64: Place a speculation barrier following an
 ret instruction
Thread-Topic: [PATCH v4] xen/arm64: Place a speculation barrier following an
 ret instruction
Thread-Index: AQHXNH0siWlslQGzzkGg4Th8zeJ9hKq74zoA
Date: Mon, 19 Apr 2021 14:13:00 +0000
Message-ID: <0433E681-2E59-42B2-88FB-94A56EF2E303@arm.com>
References: <20210418180334.7829-1-julien@xen.org>
In-Reply-To: <20210418180334.7829-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e290eada-e659-4815-165f-08d9033d42b9
x-ms-traffictypediagnostic: VI1PR0801MB1869:|DBBPR08MB6218:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB621894D2509404FB26E377139D499@DBBPR08MB6218.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fmPcw4Qd2FfmgWHS/Mra74BoKs7xTBWtfDwJTVWPOr5xiub0FgMUo/g+/sX6luRoSRWZWLWtUdEC/hM6NY4dz2HyWQbLTHYXFkhVs2FGizy2C2Q96ir5UJiiiaNj8nTrGUD1tIqYxMDbcgC1Cj7QIe9iNbNmi0wPMTpfDZp747gYSDShzcw0+NpQ/ovfjfaAuKwHpFlR0F3+3/fcMJHWfrfJuN7CDL/6lEhRLVGPXTafAMolAR0w73ynGOnqx6mnxwxYOH7utu8KOuKPLWe0pGP0enPh4dbI2YI0dmZSIzjbRBX94r2GI6MvxXSu4P3OiI/qIUkEN/CbUt+AkvABPAut61DK6fI4ZKyPVMG9OMnXgbnf4HxsQk2BB4ThKVZkqQvr0Hzd1wz/4nRYoTP+weWWrTfNcUbwsGf170uTMr0du96RB36mcrRkhXJCMBkFSf7wNT5DytrwzX+ljRFDB6lE4QOe72UHa9SsDLvYI2SroTfl1hM6Dlupr//X+Znp26cKRGRWHwGT3X3vgIlyyEy9uvIJn08Cn2W6ggWbUvPtAaVykgOy7XIvE4sX/zeDayHr5dNgeoOerdjpr2zMX8z45bbdzPga1CvuqUUwa7md2Fv/BVefPGSo9mj4pHTYb0ln8Spm63Qydw6v01rTSN0Kok3ygCj6XMB6xtyWy2H+tn3c6m9U38W1kFTbGJmzpRWxZqir2I4MUDsG3cNJN4ErROe5qhq86H/r0EEYDj4k5lFndK1oHuEkoolmJDGXp+0fGT34IHBzJTar4mqv8Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(4326008)(6512007)(91956017)(186003)(66476007)(86362001)(71200400001)(26005)(8936002)(76116006)(478600001)(8676002)(6486002)(64756008)(66446008)(6506007)(33656002)(66946007)(122000001)(316002)(53546011)(5660300002)(54906003)(6916009)(83380400001)(66556008)(2906002)(2616005)(36756003)(966005)(38100700002)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?BriTdPeW/82zvQ+SoxUXFq0EopQ1cty0r5uoHh69UUgEzMdglZk/jnAD2rdu?=
 =?us-ascii?Q?fDF9+a6D4Oaj5zY1CJcMRlxzIVFqkr+He7aMUnk77sgi13XO9pgj2MMn7w4j?=
 =?us-ascii?Q?y6cfcdgAIHOaTx+kK4DBFU9E//OZECmIR1hYnV3h1Lng+sFJ/BXvVuyYcTYq?=
 =?us-ascii?Q?KR7EIBZR3lgmBMN4WrYA8I306TUbodLO+pacnsz1W3eJQHsDxSia51BnTrr2?=
 =?us-ascii?Q?pOHjwVNohNZuzsxtzI3hyBm2YF8c4n77avqEqmp3BXzjtFDuTSJc/WsrshQ+?=
 =?us-ascii?Q?VtzZ3iZdQYR1DixMDros/S7/FcFwItSw+oFFoNkFawsYarZ9CdTg/SmmKqCa?=
 =?us-ascii?Q?2LxWRYhgGii3DKpCREYqPqe63VyPqeOjbiL4p4KM/4YzSv3p3P8UhA+/NaWD?=
 =?us-ascii?Q?HBo0ketCI9rQDMeBB6imGN2gZPPrvrhl6oEWtu5sM1UFreHmpnHCqcIZqOj7?=
 =?us-ascii?Q?pzzYFngtFnRIOMc3BGbwZ07EOwdfvQ8IC5UAkI2bXS+WxQhV6a13Ls7UseoQ?=
 =?us-ascii?Q?GAz2s5m+TKERBbPRaLSguwwpSs6tTkPYlqIhv8dfGqdDjACe6k8KtvzgU++a?=
 =?us-ascii?Q?qJjL8IwltIYgM+//PBp8UMpsnJdeYfhxqvKf1eU51qaH+vM/Wb7iJWo3e5YX?=
 =?us-ascii?Q?UZiKvRfimZLi/+X2AwIibPGw6RU6Er2vO1togklF0BsVdb/GkOiw8BlWblRh?=
 =?us-ascii?Q?r/j9+1TgiO9F/EQ/HdqYm03EduWj46JIni2dzQ1QBBMmnUTi02QLRmK6yJTB?=
 =?us-ascii?Q?d3HWlCJR+VPrN6G87m2YmIsk4YGJ8Xq4c4mS50gzbRYsk8X3NFXeLfsvSzGm?=
 =?us-ascii?Q?XVAnlSpSlXJnjqFTrdahpBJEbDPGdsTgEX4PkwBrdoGSaATA6gjlYWejxzCZ?=
 =?us-ascii?Q?+33MA3a16E9BMh/gLEOTG7YRt27nKkoKUKtrUStgnQy0nt9kURzQfY0JoxLW?=
 =?us-ascii?Q?FQNpsi+aUblirPoyi8DoLVhP5XNnbsKHz5l5C7JCidsn1t4LwJ4ScpJqP30p?=
 =?us-ascii?Q?yQ/ruInPTDwUFa+x+6B7BZtD/IWcEWjJ+2jUIZFImtruvqmzJrHZecgGeJ3+?=
 =?us-ascii?Q?0jNk5f5cZ4YGFrr2Zv6+TydjeHvrVpuTF9f7iG7Lpcsw3jFvk6Khfkenv4bn?=
 =?us-ascii?Q?oTipHIwXAcu+dMyNhUv1/a35z1hH0JVzD51rFuiEUZb12lPkm0RQmeBNrOim?=
 =?us-ascii?Q?hsbY/+OPSIo6hvrehzdJNX2b1dVR0gcr1+s1gYdpvdhvhbjrZVSnT75/gOUP?=
 =?us-ascii?Q?NIpHPVmzLAWORLF3Oefayzn8U4hxeCLpxt/yK9a16KTAuyOwr4MFIULhDSe/?=
 =?us-ascii?Q?SpAf36vkN5qP4P9/fq038mri1/H95uX/TDfdlI2yd+9Jig=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D4A61751F6064846B09CC466EB3A2F90@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1869
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	57b2d680-d61e-41a2-33c2-08d9033d3d3f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	URdb2YsWHFzvsys7EiFUz3nsTyP77zA5XROPL4BBL9eBNWPnXeZE2fBdK0A4yuT4rO/GCQ0SVhhUD6iS0YsDsysrCprkZy8nvXrg9XjqNcAUNvOq8QPhib4BQ5KwlzuyjLWzawnbmEE/4QECCLY/m0hTuJ8VfW82hq8wsNPXOmXDnjeIG+0JpXAPsrRsGbClu6if9rWoBr+EShL+R0YaEnPWxSCfI95oDCnD75l56/z9EMOLeJeCQBWv8XVF8rK1K+gUJ5jWTU7ZyAV29F9/XPOk9mOxPXVJLuiARn1VMVXA45DLNVlD/xQSym9rRon70vNNocaDQDOT8G37OQc4GsxKMIAbUpk/vaFG6qlKanxYblGeP2pGl+Vo0i0Lv9ndcYiWPakceol4sX5jd8A3Cc+6gcd5ZigASRxPGIhCY4X4HSjgq1eLHUaMfxCun3xh9BJLMSSKnDikCRDurRiIy/R1guFuhSBjQr30ztRd1w/oiwevOiUbsf69nxjXHYnzKkqv+gVqcqheZV2kGg421pBr666HebDg1021ca36F8vrpG7PBjTldg4Z31zeSxp0YehJ0XRovS4doK7tWnU4nskcleR7eBeFQT32FyHv8fGdZfIe0Bimlmlq65CQCGboK0KUs5dozVjqgmU/8eIua6q7xaegkfO4IVuIY1so66Wm0u1NNtob1s9AqZOjBVnSahCvIgTbd4TaLzntzfyfBeC4dCrAXZXdVhiwL0nCvqCE7b+B3/Zv6ZhDE46ZsfGR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(36840700001)(46966006)(5660300002)(186003)(47076005)(83380400001)(966005)(478600001)(107886003)(53546011)(82740400003)(82310400003)(6512007)(36860700001)(26005)(356005)(336012)(2906002)(316002)(86362001)(6862004)(4326008)(2616005)(54906003)(6486002)(8936002)(70586007)(70206006)(33656002)(8676002)(6506007)(81166007)(36756003)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 14:13:09.6810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e290eada-e659-4815-165f-08d9033d42b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6218

Hi Julien,

> On 18 Apr 2021, at 19:03, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Some CPUs can speculate past a RET instruction and potentially perform
> speculative accesses to memory before processing the return.
>=20
> There is no known gadget available after the RET instruction today.
> However some of the registers (such as in check_pending_guest_serror())
> may contain a value provided by the guest.
>=20
> In order to harden the code, it would be better to add a speculation
> barrier after each RET instruction. The performance impact is meant to
> be negligeable as the speculation barrier is not meant to be
> architecturally executed.
>=20
> Rather than manually inserting a speculation barrier, use a macro
> which overrides the mnemonic RET and replace with RET + SB. We need to
> use the opcode for RET to prevent any macro recursion.
>=20
> This patch is only covering the assembly code. C code would need to be
> covered separately using the compiler support.
>=20
> Note that the definition of the macros sb needs to be moved earlier in
> asm-arm/macros.h so it can be used by the new macro.
>=20
> This is part of the work to mitigate straight-line speculation.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ---
>=20
> It is not clear to me whether Armv7 (we don't officially support 32-bit
> hypervisor on Armv8) is also affected by straight-line speculation.
> The LLVM website suggests it is: https://reviews.llvm.org/D92395
>=20
> For now only focus on arm64.
>=20
>    Changes in v4:
>        - Remove Bertand's reviewed-by
>        - Use /* ... */ rather than // for comments
>        - Remove arm32 changes
>        - Explain why the macro sb is moved around
>=20
>    Changes in v3:
>        -  Add Bertrand's reviewed-by
>=20
>    Changes in v2:
>        - Use a macro rather than inserting the speculation barrier
>        manually
>        - Remove mitigation for arm32
> ---
> xen/include/asm-arm/arm64/macros.h |  6 ++++++
> xen/include/asm-arm/macros.h       | 18 +++++++++---------
> 2 files changed, 15 insertions(+), 9 deletions(-)
>=20
> diff --git a/xen/include/asm-arm/arm64/macros.h b/xen/include/asm-arm/arm=
64/macros.h
> index f981b4f43e84..5ad66efd6ba4 100644
> --- a/xen/include/asm-arm/arm64/macros.h
> +++ b/xen/include/asm-arm/arm64/macros.h
> @@ -21,6 +21,12 @@
>     ldr     \dst, [\dst, \tmp]
>     .endm
>=20
> +    .macro  ret
> +        /* ret opcode */
> +        .inst 0xd65f03c0
> +        sb
> +    .endm
> +
> /*
>  * Register aliases.
>  */
> diff --git a/xen/include/asm-arm/macros.h b/xen/include/asm-arm/macros.h
> index 4833671f4ced..1aa373760f98 100644
> --- a/xen/include/asm-arm/macros.h
> +++ b/xen/include/asm-arm/macros.h
> @@ -5,6 +5,15 @@
> # error "This file should only be included in assembly file"
> #endif
>=20
> +    /*
> +     * Speculative barrier
> +     * XXX: Add support for the 'sb' instruction
> +     */
> +    .macro sb
> +    dsb nsh
> +    isb
> +    .endm
> +
> #if defined (CONFIG_ARM_32)
> # include <asm/arm32/macros.h>
> #elif defined(CONFIG_ARM_64)
> @@ -20,13 +29,4 @@
>     .endr
>     .endm
>=20
> -    /*
> -     * Speculative barrier
> -     * XXX: Add support for the 'sb' instruction
> -     */
> -    .macro sb
> -    dsb nsh
> -    isb
> -    .endm
> -
> #endif /* __ASM_ARM_MACROS_H */
> --=20
> 2.17.1
>=20


