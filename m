Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECD45B08FF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 17:45:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402006.643990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVxEw-0000WJ-FL; Wed, 07 Sep 2022 15:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402006.643990; Wed, 07 Sep 2022 15:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVxEw-0000UT-By; Wed, 07 Sep 2022 15:45:22 +0000
Received: by outflank-mailman (input) for mailman id 402006;
 Wed, 07 Sep 2022 15:45:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVxEv-0000UN-3f
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 15:45:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 133e26ad-2ec4-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 17:45:19 +0200 (CEST)
Received: from AM6P192CA0079.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::20)
 by PAWPR08MB9099.eurprd08.prod.outlook.com (2603:10a6:102:343::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 15:45:17 +0000
Received: from AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::b2) by AM6P192CA0079.outlook.office365.com
 (2603:10a6:209:8d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 15:45:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT051.mail.protection.outlook.com (100.127.140.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 15:45:16 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Wed, 07 Sep 2022 15:45:16 +0000
Received: from 94905ddf24df.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6C38BD67-FB8F-4D5B-8F9E-ACFD08828DF9.1; 
 Wed, 07 Sep 2022 15:45:09 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 94905ddf24df.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 15:45:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA4PR08MB5949.eurprd08.prod.outlook.com (2603:10a6:102:eb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 7 Sep
 2022 15:45:07 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 15:45:07 +0000
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
X-Inumbo-ID: 133e26ad-2ec4-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Pt4DLXBpg7Nn1rK4H72L3Ky1/as1W9Yglzu83dLuzwFeo/noEkd0flp8sG0xyKhWVbRp40amZ5xFNl07d5gyEnxY8M8fHgVpmpcS31akkaeg2H1fabg/PC9eh8eCfuPIJHuo/WZc0NhVGl1TAH2KXluTxqqh3THTI5u3tmrdRPC6cx54o9w0iU7TLtAMHG0DAPci8CVETi3nfp7AHdDHFjLHvpu/O40DLRt6N7Z06q8ZfJR8boPRhXDMDSVrRCvP3EaWdV4KOS61OlDxr97cnGSk8ZKycYINQmCSD3ZPbPlWrQM29ouWAuNjB0zDBKvRFn6HxyioOQ8tb1LpxUuk0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mm7RCssHSVB72mF5TsSZZ6r3qwhKtdWpn7Zx+wr+95w=;
 b=ffxGbqh35azrGam5viKfUhEhBLVCUWHR6grtR+soOo/Ebh5RgtLeyxVhWvytNjUIYfKhFnvykzseER1rf5DHms/kxb5hH7YCJNu/WjnQr1BwHzkB6rhVMomAhkizpf+NIiNSNHli/kM7/2J4jBIxaz8/KeiIe0pK7Apq43Ejey4z1WjDHBgzCLi3C4YETAPuBcvzdYVnD3tOmPkYZauzkjECYa2knwHSnyJis6ZKD8joauVTtBCnCZ3qfglPght8VEymIqELgyFbbh/iXF8kw5154Xa73KPgo/TEHDhxQZloh8pN5bUljyyhOSzEtPGeaFSjupUJgycLvWQu/+nnQg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mm7RCssHSVB72mF5TsSZZ6r3qwhKtdWpn7Zx+wr+95w=;
 b=GqORUFPwVNz7xesQTa4tlD/x1jgDT4G3403XEe12DYlzhCepREfQnv2gVfFBOVHsPjDbDWFnw7msWff3N6H0P6iRuEtFCq+NHtUjhzPmUgAE5EJiB/o136oSiNipGCN9oS5ReZbx4Yk1iDShImM+ExfR0s/6qANRGeGXoRpUFUY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a6af11f5e0b8d906
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YctznOlrxOFex2awQCatqxZGK3LPkXZhJTKJ8AUAJmJNOLHdZmf2YenTun7+BIV8xZZqxPXLir3daad4VPlbokg332fB23+ks0WgUHYVcJJRp1MJp18ZT+bguNGuMO4iYieWIyEW22V8qaZstWwlhWzRVh16zrMJ237ahsPmVdUeM4R8wmGSfL8OqlNAOCku2L+IHyuf1XhomBT6L906E3QFAXhUsOOdWrU3U3vw3mFTxPvCkES48sO5CTNrTQ/plj70la1ZmfNGIVuxuWuaFs12AKe6aceiSxUi5GG72F/aPgi/CzZWTCvT3IgeeMNcR+EqJeF3MISbNj3tYNCdKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mm7RCssHSVB72mF5TsSZZ6r3qwhKtdWpn7Zx+wr+95w=;
 b=LO5mLZdTnj2hGkV7MvxJArBjkeOseRznbE8X3PUcTYGn6uvjdoR0Zd/8/+uCD3vmsFkNQza/TtJzYx1jOJ9Ug0/rYctheCsuezgCU+W5OCzMLJk40ZKkI6kTHf5wr0ul6ZU+MlUm9wrm8sWH258Jnqnjyl/5RALwbxcB8jFcbVaY/HrznVgUww9KPgudnXcwBiIOP9fCenbTmKaGjG6dTxWvwz6ailix0wVP7dLTozKPS+W07BNpQVgTJnL3lt0dxBXqIqjZNn4W50p1Gg2brvehMD8cF+r4vilhoXQH8KQoCVOYjDapOaWPv7f9/7ks4J0ZhUc4jSGoW1At2SlahA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mm7RCssHSVB72mF5TsSZZ6r3qwhKtdWpn7Zx+wr+95w=;
 b=GqORUFPwVNz7xesQTa4tlD/x1jgDT4G3403XEe12DYlzhCepREfQnv2gVfFBOVHsPjDbDWFnw7msWff3N6H0P6iRuEtFCq+NHtUjhzPmUgAE5EJiB/o136oSiNipGCN9oS5ReZbx4Yk1iDShImM+ExfR0s/6qANRGeGXoRpUFUY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Unaligned access on arm32
Thread-Topic: Unaligned access on arm32
Thread-Index: AQHYws7Zew4zoBRJmEmNmoI/aV0uva3UG/wA
Date: Wed, 7 Sep 2022 15:45:07 +0000
Message-ID: <0615D7B4-EB2F-4084-83C2-4C156BABFED0@arm.com>
References: <c71163f6-2646-6fae-cb22-600eb0486539@xen.org>
In-Reply-To: <c71163f6-2646-6fae-cb22-600eb0486539@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 640acb7e-344c-4e8e-603e-08da90e7f642
x-ms-traffictypediagnostic:
	PA4PR08MB5949:EE_|AM7EUR03FT051:EE_|PAWPR08MB9099:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nB7wl/ZZcWAE5E1jZl3kiXrSyuxrdfnJ0CjpvYBzOioRpzNObXD2AtX0iUjb44CkfhiBx/VdST8dJulbVSHiXpY/tqzJnqA4TPRJvX8uZeINUZ37B7VyQZRJhwZDFuZzpj9ralNEt6u6bNx6hNxMNcBrMsBsKeCr4q5a6tq6DklT2k09KC4vim7u9wEE9kVRaIMUzvPliE9/rFSkEaR9iFGeb1BAHjXvBn/kqLd3nP3FdzP/X4BQwrOh2CZ+0wkQBzKsWHTtqWY9vyfaFwRDIbtXKCv3gotmbtWNMPgbBMwtGj6whplv31u4HnDAwGGx5PyrQCAw44etrG81opb3WeObVVY7GyoIPUVuDYGPEE1ZMxXvWxnMs1P+XUIHvSOELUzrI/gHzNO87bMOAFYmAW90bT3euKEIMJUj/x78DlgBFVDv3NEEP/8pmHE8jvT3cazk0D+y8PwYI2WNYdEdEOQo9U1NXVkne+yIEhc5Kgcv79SNY7Q2FQSxOkmCPg7B9T5pFIXvxlB7TFSp4zab7szRgX1x4ymuZGShBJvk2L4zBCPemA5kBKXfyJHHdB2HgE3Fd24TZ7P4iirZrLt/QX3wQmZJP2+2lNidUAj5ki2ZVjXLCDHYL2b6PGFxJxMUAQKlftIry8go2e82aLUKQBzMB1boJt+MXXLZ7Qvo++RcqHF7NKdfhxn0VrmL688m8RkB89nBMNfYboYyC4sXEpi6S5ejZbSxP2RSzJ75bqdYHtvReziLDnwUwRgjlj0e4rxaMfbMx+B8ZxAWKaVrLFx7SpSD49pZ1hgzvfTxe7xl0pE6L1Mnp63B1mQ6DKXrNur9Vhzc9fc6FCi0S1cAjQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(38070700005)(8936002)(966005)(86362001)(33656002)(54906003)(6916009)(6486002)(316002)(478600001)(91956017)(41300700001)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(53546011)(8676002)(83380400001)(4326008)(6506007)(26005)(6512007)(2906002)(2616005)(186003)(122000001)(5660300002)(38100700002)(36756003)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5C8AADBBEB9FC34C859D5D4A3AB2772F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5949
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f81e0c1d-3acf-4e57-e800-08da90e7f071
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WFDYcm7pA46FsOUCWr0OZ/RTNeYvQBhVOu5ljxYqini6t/bwbLSfk1WQka29BZy+xX00aMjSxbYx+Tjx3OJ2cm0KgaHUVD/4cC48jHw4GSYw8t5/4ny149bI8GKCcGKVOLCU/ppxyIj9t13t6PS6C+veGNXEBj0WdX59yYcgK5sLV2X12g6WagW/jubShliBKoNEGKJPpUpq4zd+TaMdRfQCFLjwZOZCgEInIHpsEUB2Rjn6z030D42+p17MUjalX/z0RFTVyhFu31uobU1oOllG5qglFDdHjq4zZg+94TK6PhBgLc40pff8oEP2hYKRIQ5PjnGzeJx/mLIg+Maft8Qe4T01dKHfZON5AIvmix5k8CzIiNQkBIGTLdLSWbgJlC8fLLQslfDcexPvZgWNykE1z99X7jhhTems4GPoaFUe6qsnznohTiwxQZoY4S9z7+upCsxBPkIFvQoAk+rX5/ZhQh9Ta6+IANhx5XfrVRTbK6ofpf0SX36bD4xXB5SHcsztFMHx4dWyHFN6MXPd83dcQsP6jFYCH2tP2KiRR/a7JDoqT6QbfCW+kW3OCyALhDxntzr9KoMosd7l0IHkgcyCwzCoTvw/Q2Vn4bUkv2OSw7AkcFm3trWBi+RJakhfVC8MSnDla8XcIoM1l6gKln+fBTWL0s6dEpU5lMI6SEptpbYILcTm50eFUi5JNx93RePSi0OhSgtqFHejPtOQj11w5pUKh+AGfGUUWlpxA2GkQPnAkc9K+B+pDgWan/oMXN9Uiaj610tb8kvJwVSy0Se27yZzmNbQtQPR33Ap984=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966006)(40470700004)(36840700001)(336012)(41300700001)(47076005)(8676002)(70586007)(2906002)(2616005)(316002)(4326008)(186003)(54906003)(70206006)(478600001)(53546011)(36756003)(40480700001)(26005)(33656002)(6506007)(83380400001)(36860700001)(356005)(86362001)(82310400005)(82740400003)(6512007)(966005)(5660300002)(81166007)(6862004)(8936002)(6486002)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 15:45:16.9111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 640acb7e-344c-4e8e-603e-08da90e7f642
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9099

Hi Julien,

> On 7 Sep 2022, at 16:30, Julien Grall <julien@xen.org> wrote:
>=20
> Hi all,
>=20
> I think mentioned it privately a while a go, but never sent an e-mail abo=
ut it.
>=20
> While testing arm32 with IOREQ, I noticed Xen is crashing because an alig=
nment fault:
>=20
> (XEN) Data Abort Trap. Syndrome=3D0x1800061
> (XEN) Walking Hypervisor VA 0x40027ebb on CPU0 via TTBR 0x000000004012f00=
0
> (XEN) 1ST[0x001] =3D 0x00400000bbffff7f
> (XEN) 2ND[0x000] =3D 0x00500000bc000f7d
> (XEN) CPU0: Unexpected Trap: Data Abort
> (XEN) ----[ Xen-4.17-unstable  arm32  debug=3Dn  Tainted:   C    ]----
> (XEN) CPU:    0
> (XEN) PC:     002613b8 try_fwd_ioserv+0x44/0x1bc
> (XEN) CPSR:   6000005a MODE:Hypervisor
> (XEN)      R0: 00000000 R1: 00000001 R2: 0022a748 R3: 00000006
> (XEN)      R4: 40027f20 R5: 40027f58 R6: 40028000 R7: 00000000
> (XEN)      R8: 40027f20 R9: 4003a438 R10:002f0044 R11:40027edc R12:000000=
02
> (XEN) HYP: SP: 40027e94 LR: 00260edc
> (XEN)
> (XEN)   VTCR_EL2: 80003558
> (XEN)  VTTBR_EL2: 00010000bbff8000
> (XEN)
> (XEN)  SCTLR_EL2: 30cd187f
> (XEN)    HCR_EL2: 007c663f
> (XEN)  TTBR0_EL2: 000000004012f000
> (XEN)
> (XEN)    ESR_EL2: 97800061
> (XEN)  HPFAR_EL2: 0067faf0
> (XEN)      HDFAR: 40027ebb
> (XEN)      HIFAR: 67600000
> (XEN)
> (XEN) Xen stack trace from sp=3D40027e94:
> (XEN)    97800061 0022a748 00000001 00000000 8000005a 00800000 4003a000 0=
0000001
> (XEN)    4003a180 00000000 bbff47ff 00000000 67faf200 00000000 4003a000 4=
0027f20
> (XEN)    4003a438 40027f1c 00260edc 002f0110 40027f58 40028000 4003a000 0=
000013b
> (XEN)    40028000 002f0280 00000090 40027f58 67faf200 93820006 67faf200 0=
0000000
> (XEN)    00000000 40027f54 0026b6ac 93820006 0022a748 00000001 00000004 6=
7faf200
> (XEN)    00000000 00000000 00000000 00000000 ffffffff 68000000 400001d3 4=
0027f58
> (XEN)    00201870 60000000 67601324 67faf200 00000000 00000013 00000000 0=
0000000
> (XEN)    ffffffff 68000000 400001d3 00000000 00000000 00000000 ffffffff 0=
0000000
> (XEN)    67601074 000001d3 93820006 00000000 00000000 00000000 00000000 6=
7601008
> (XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000 0=
0000000
> (XEN)    00000000 00000000 00000000 400001d3 00000000 00000000 00000000 0=
0000000
> (XEN)    00000000 00000000 00000001
> (XEN) Xen call trace:
> (XEN)    [<002613b8>] try_fwd_ioserv+0x44/0x1bc (PC)
> (XEN)    [<00260edc>] try_handle_mmio+0x2b0/0x2f4 (LR)
> (XEN)    [<00260edc>] try_handle_mmio+0x2b0/0x2f4
> (XEN)    [<0026b6ac>] arch/arm/traps.c#do_trap_stage2_abort_guest+0x18c/0=
x34c
> (XEN)    [<00201870>] entry.o#return_from_trap+0/0x4
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) CPU0: Unexpected Trap: Data Abort
> (XEN) ****************************************
>=20
> The disassembled code is:
>=20
> 00261374 <try_fwd_ioserv>:
>  261374:       e16d42f0        strd    r4, [sp, #-32]! ; 0xffffffe0
>  261378:       e1a04002        mov     r4, r2
>  26137c:       e1a05000        mov     r5, r0
>  261380:       e1cd60f8        strd    r6, [sp, #8]
>  261384:       e3a00000        mov     r0, #0
>  261388:       e1a06001        mov     r6, r1
>  26138c:       e1cd81f0        strd    r8, [sp, #16]
>  261390:       e3a01001        mov     r1, #1
>  261394:       e58db018        str     fp, [sp, #24]
>  261398:       e28db01c        add     fp, sp, #28
>  26139c:       e58de01c        str     lr, [sp, #28]
>  2613a0:       e24dd028        sub     sp, sp, #40     ; 0x28
>  2613a4:       e1c220d4        ldrd    r2, [r2, #4]
>  2613a8:       e50b0024        str     r0, [fp, #-36]  ; 0xffffffdc
>  2613ac:       e5d67a26        ldrb    r7, [r6, #2598] ; 0xa26
>  2613b0:       e14b24f4        strd    r2, [fp, #-68]  ; 0xffffffbc
>  2613b4:       e5d43000        ldrb    r3, [r4]
> * 2613b8:       e50b0021        str     r0, [fp, #-33]  ; 0xffffffdf
>=20
> The problem is GCC [1] decided to use 'str' for accessing an address that=
 is not 32-bit aligned (fp - 33 =3D 0x40027e73). On arm32, we are forbiddin=
g aligned access, hence why it crashed.
>=20
> Looking online, it looks like GCC has an option to turned on/off the use =
of unaligned access [2] and it is enabled by default on ARMv7 (I am not sur=
e why we didn't notice this before...).
>=20
> I have rebuilt Xen with the option turn off and dom0 is now booting fine.
>=20
> However, I am a bit puzzled because the C code didn't contain unaligned a=
ccess. It was all introduced by the compiler itself. This is breaking our a=
ssumption that the compiler will not break down correctly naturally aligned=
 access.

Strictly speaking without the option the compiler does not say that it will=
 not generate unaligned access so nothing forbids it to generate some.
So I doubt we could argue that the compiler did something wrong here (there=
 might be a debate on why it did so as the C code is not doing one).

>=20
> When using the new option, Xen size is increasing by 0.40% (about ~3KB) i=
n my setup. Nothing too concerning, but I would like to have some opinion f=
irst.
>=20
> The alternative would be to allow unaligned access. That said, I think th=
is is much saner to have a strict enforcement as we can catch GCC trying to=
 do unaligned access when it is not expected.
>=20
> There is also the argument that unaligned access can be slower on some pl=
atform. So it is better to avoid them.
>=20
> Any thoughts?

I think we need to be coherent: if we are not allowing unaligned access the=
n we should explicitly ask the compiler not generate some, so here one way =
or the other we need to add the compiler option.

Now on arm32, unaligned access might be slower and seeing the size increase=
 I would vote to stay as is to detect them and pass the compiler option to =
not do any.

Cheers
Bertrand

>=20
> Cheers,
>=20
> [1] gcc (GCC) 7.3.1 20180712 (Red Hat 7.3.1-15)
> [2] https://gcc.gnu.org/onlinedocs/gcc-4.8.5/gcc/ARM-Options.html
>=20
> --=20
> Julien Grall


