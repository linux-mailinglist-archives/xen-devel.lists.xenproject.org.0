Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EFA8A327A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 17:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704779.1101352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvIrb-0000Tu-5I; Fri, 12 Apr 2024 15:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704779.1101352; Fri, 12 Apr 2024 15:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvIrb-0000RR-2Z; Fri, 12 Apr 2024 15:30:51 +0000
Received: by outflank-mailman (input) for mailman id 704779;
 Fri, 12 Apr 2024 15:30:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HqPC=LR=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rvIrY-0000RL-Rw
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 15:30:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2613::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1b6e738-f8e1-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 17:30:46 +0200 (CEST)
Received: from AM0PR04CA0067.eurprd04.prod.outlook.com (2603:10a6:208:1::44)
 by AS2PR08MB9076.eurprd08.prod.outlook.com (2603:10a6:20b:5fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 12 Apr
 2024 15:30:43 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:208:1:cafe::d4) by AM0PR04CA0067.outlook.office365.com
 (2603:10a6:208:1::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.22 via Frontend
 Transport; Fri, 12 Apr 2024 15:30:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Fri, 12 Apr 2024 15:30:43 +0000
Received: ("Tessian outbound 9fd7e4b543e6:v313");
 Fri, 12 Apr 2024 15:30:43 +0000
Received: from 8bca064b5a18.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 71B41DA6-3CCA-44A1-B429-57F72AFAAD07.1; 
 Fri, 12 Apr 2024 15:30:36 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8bca064b5a18.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 12 Apr 2024 15:30:36 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB6390.eurprd08.prod.outlook.com (2603:10a6:20b:31b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.53; Fri, 12 Apr
 2024 15:30:35 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.053; Fri, 12 Apr 2024
 15:30:35 +0000
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
X-Inumbo-ID: a1b6e738-f8e1-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cLQho5YYD2A4NNU2S2CBI6+o8dY+Jc2ZRgoJLJBZKCut0va+1ioz8IG5T+ODrbjzRDA5NUFu+eumTU7WvrHupL6N9249ARMuPyxYGhlCCyvs6yJ4+H0Z5XYWgD6qA4or6iiOgJq91arnk5Qp6XAWOL2fjU5GQEjNpeov6iQMFj1OAhcBAIeepf7V60QwaGElsDsjaAPgJGEP3btuAsB/6v/hDZXsrdCPvfIovNEE7833n3hxMhX9LpJs3eGeqBpGnzmjFZHPi9UrFomcBm66lHLTN0DbPdP6dyqmJcPqoIHJkJBVIq6E5r8oPxmdA/kXyxVQYeRUHCMO91QBmtvJzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJmK3wVdKY1cpzBM1fyWzpOP5nOKjRVG/PS/RQthayk=;
 b=nMNKy0l1DaZQD8ayFQwv1l7Zyq1HSCGDRW6hjoFmFC3a8xyElIShO+55ldINbGB3YBaVOLQpfJpOHbKBa0y7spVMwnT/8Da3OivBHqJRQBi3Tphh/o73LLJeMFhNMh+tUq5PiWhCVckT5s9oN6dAkxzNeh+vUFi6Q0+Tf8lNdl196Dy6+KYVONtBDjUf4j9vHCMYrvsex5zOZsSMmocuf69tsluwfoqrQa0PV1t0oJoA83COFXdb19cMet4Usk4GyyCjbiuTpgIvSdgs03O5ttV5jo4NGKPzKKq5G+cUqOfcfbcgmktSRnE6RTXOD+6mOLBfW/G0eIC/wQEnJ5AjHw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJmK3wVdKY1cpzBM1fyWzpOP5nOKjRVG/PS/RQthayk=;
 b=d4Hu1PySTVSw+gPabhODYkMm2m+FLHm3sN4GAaolAKKuiwnFQNkUVMDp68Q/hUDCs29+ZPFonM2YFsBGNazHS1gDiHw8DbabZIxrbMTxkFU9JI2vfvgQu2T8DSPuu5BeKaXGYmO6+3HvdeMDyV0x0WnhX5S0a3S0S2nmfwdudII=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5bf501e3bcec1af4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EoT2Z/xUjd5k1P2DiCSyDTWvB2BrS/A1SKUq6/DNs6vHenF+SztGTJr+Xroi/VYTNitrFmw17GRWmRrqknp9THoL6e1l0Eutvivc1Rrm8cmNGjtNAC6lMfztYNMdhNvuDft72bZWPLYqMDlRZo6jdapGq3IimkPJN+c0QMx0AX8QYgayKQ/7Aeg4NcEnvaDRv4hFcfmCi0A4c6teAr9ZttG+BA9V95wmvaRhdwUEVAxiB/tkPC0f128G+yyT/Ya0oWpThJj8NReesfZBDh3++fKrf00JyMZ2Wk9oezVasQj+f2y/+/fa17DeG9TtJbxSfI+pWM9KuTJ4NHK3ZPPGFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJmK3wVdKY1cpzBM1fyWzpOP5nOKjRVG/PS/RQthayk=;
 b=CgUjhKBcOvxq0vc7dLy2mC1l8mf6iNhkewU8WfGAswie5HqAP86mDxp/GxcQwN3Ph3mtR86Sni0YM+ncmm+whpvBdl7ijPDkaSl2kR9PTnAUzNqjP4Zug7z9gZEGHwsntnOcatftZuZ/konWiTe5QJnVPyd3zWnz6onqlHVpGsOZCuQhcjAmWZnDJfWDtYI/t7we2ZrSU6ahBrtciSDTrPQ9ZxMXCccfH/1RoC6PDgu6chMSn9UBDd0eT3hpkcfsc5A+0Ro4JfSwlK0O+DPM+BUJInE2tatlof4hrOKZrehGbKpwa8+/c8f3gfWZQV6DZa+5EOyvHC5e0UazBssIEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJmK3wVdKY1cpzBM1fyWzpOP5nOKjRVG/PS/RQthayk=;
 b=d4Hu1PySTVSw+gPabhODYkMm2m+FLHm3sN4GAaolAKKuiwnFQNkUVMDp68Q/hUDCs29+ZPFonM2YFsBGNazHS1gDiHw8DbabZIxrbMTxkFU9JI2vfvgQu2T8DSPuu5BeKaXGYmO6+3HvdeMDyV0x0WnhX5S0a3S0S2nmfwdudII=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien.grall.oss@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Michal Orzel <michal.orzel@amd.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/4] docs: add xen_ulong_t to the documented integers
 sizes/alignments
Thread-Topic: [PATCH v2 1/4] docs: add xen_ulong_t to the documented integers
 sizes/alignments
Thread-Index: AQHai6GBZ8b+Nd1+T0SyR++yfNJA87FiLIoAgAF1zYCAAQgbgIAAGvcA
Date: Fri, 12 Apr 2024 15:30:35 +0000
Message-ID: <C8D49EE7-B214-41D5-9556-4D3B98629CEA@arm.com>
References:
 <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
 <20240410234740.994001-1-stefano.stabellini@amd.com>
 <CAJ=z9a3zMaSLSS0mfKT8dngVwrESycSspy8LnW4FZV6hdu_AAw@mail.gmail.com>
 <alpine.DEB.2.22.394.2404111454570.997881@ubuntu-linux-20-04-desktop>
 <CAJ=z9a2gOTLy2B7y9bELQHPhFmCpU2nhyV5zy9_uQvsvx5prqw@mail.gmail.com>
In-Reply-To:
 <CAJ=z9a2gOTLy2B7y9bELQHPhFmCpU2nhyV5zy9_uQvsvx5prqw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB6390:EE_|AM4PEPF00027A68:EE_|AS2PR08MB9076:EE_
X-MS-Office365-Filtering-Correlation-Id: 790987ae-c0fc-4217-f3eb-08dc5b05847c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Jpc36tR07GX5IrhVhy5gykkCDFmaPhoSkgxDbQguNLkmmtyPm3eUTe/obT4cN2YpSekWvoJyqoGQxKDcoMCJf2N2D5PEODSg8Ds5hPkH/DUmuwCNpb7M+YJWx9xDjzChLplXQMwu5E/Tp7TFQJ7s2rZuEwQOtR1av+MP5nw7e26YaHKFkOIf7rxsn4qBMMnAzyvIPxq+rhPV13rNSGimQyytTLtIkJlcbqSQnbD23ICocRELqxgkAgcmvEkKIGrP/KKQPH5o7gdzgXLCtlR2G5hIg4YSZ5Z7HIMc2KyEx8P0AubLzUrqT2KOPvMIlc+OS1OI4f3ZR6lZXks0E89eC36SXX9S58YWjfi1UmHi0E6phOOMAy8NSBicte8oNg878oFSzy0WtWF+Rt+zyloRN8DHAci2o1N8+W686rRWKcm0qmzBD+VAVzQtKYQxRohPribPgSAlHQDyODFk8o4b3onnKaucbOxBJkm5X0s+uk+KOLaJDC5hg6TzzDjNnqe3eFW0c/2js7ovkDksAT6QI7KceQbMAqry5MIh0g2rI9OLs7ywT5nM/0D/cQLkExJtQi35m6q8tIFOazXAE9Mt+dkb7Y9mtBQx1ahY7i/02Ujku0BSEPRTq9tQfebgrK8apSs6bD7jw6710ceJgzVN413ZgLO/Od1Uve8ekAQlOyQLWJRPZ5xKqFYMH7UxO4cq0SCi0Yh/Jki593FxzO0yTLfiClryaRyn0oTe4YC8Kac=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B00C4693732EBB43BB2A5031FDB4D444@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6390
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ee07a235-39c3-42ea-11e2-08dc5b057f8c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FkZe1LECbC6ylR1PppNp0LODtZURJcmkKAd8pF2DwazITokB6rgbbT/DRJpYGv5i6WHXt3SseaeceWQ8bF9WOlQgx/XBpn2XSch2xQtV8wTeh2Wx7K9KSQbgTH7tELppT69SMiyXlyFD6EnznOuONF5bPZzngVgIkG3s8iDltUU1If3xrOnpM5Y09rLTMcorkDoHWSrEyE6VqK9GZ1NLletFAI2QxncMzpZLfUelNgu27QB/mV6tKUZe7B2Z32e9yNBhhwsOHYbuNfYY7mZETqCfFPwpAc+ZZqW1TrqTRutDWUKTOYs0OjGIROGAEAEZSmdWU8tP1f+Af5HL9qY4jgAGXuNb8u+H3mg6AkpjxriNKESk5JfmjAHe7J3N073x3WHvHYL3UCd3Ud9pIZO2uFSuiEQLYlqu1kWZm2Hwh7D3cI/JmFuhowKyIRybWr1CqTgua2EbxZyxqPtdcuDgZgIfwffJNaB4BGqQNxWW/gh11NYGu+36L0ib4OGSWKRYfrBkN2UdPcr+IWCBkOMec6VwJ2HPUX5ZifunC6pH5du8blFHgfZcldt7LHcHEYH8CGj4mV7LppjaU6SqA/NMhcEzxnIEJBdzKf6Es/83yspJj+TczlANRqQjdrMbuim5izGdy4ZxckLvnLJYW5DiRLaU4wsYqiiMhIqZ9iBtDHskNdziVVCvR9UTny21ay08SpFF+ALynx3O4SXawOTHC+AJOkRywO/16NNd3b56v9y26IqE3bFQhCVG9IPmB251
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 15:30:43.4888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 790987ae-c0fc-4217-f3eb-08dc5b05847c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9076

Hi Julien,

> On 12 Apr 2024, at 15:53, Julien Grall <julien.grall.oss@gmail.com> wrote=
:
>=20
>=20
>=20
> On Thu, 11 Apr 2024 at 18:08, Stefano Stabellini <sstabellini@kernel.org>=
 wrote:
> On Wed, 10 Apr 2024, Julien Grall wrote:
> > On Wed, 10 Apr 2024 at 19:47, Stefano Stabellini <stefano.stabellini@am=
d.com> wrote:
> >       xen_ulong_t is widely used in public headers.
> >=20
> >       Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >       ---
> >=20
> >       Given that xen_ulong_t is used in public headers there could be a=
 better
> >       place for documenting it but this was the most straightforward to=
 add.
> >       ---
> >        docs/misra/C-language-toolchain.rst | 11 +++++++++++
> >        1 file changed, 11 insertions(+)
> >=20
> >       diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-l=
anguage-toolchain.rst
> >       index 5ddfe7bdbe..7a334260e6 100644
> >       --- a/docs/misra/C-language-toolchain.rst
> >       +++ b/docs/misra/C-language-toolchain.rst
> >       @@ -531,6 +531,17 @@ A summary table of data types, sizes and ali=
gnment is below:
> >             - 64 bits
> >             - x86_64, ARMv8-A AArch64, RV64, PPC64
> >=20
> >       +   * - xen_ulong_t
> >       +     - 32 bits
> >       +     - 32 bits
> >       +     - x86_32
> >       +
> >       +   * - xen_ulong_t
> >       +     - 64 bits
> >       +     - 64 bits
> >       +     - x86_64, ARMv8-A AArch64, RV64, PPC64, ARMv8-A AArch32, AR=
Mv8-R
> >       +       AArch32, ARMv7-A
> >=20
> >=20
> > We support neither ARMv8-R nor ARMv8-A Aarch32.
> >=20
> > I could possibly accept the latter because it works to. But the former =
is so far misleading.
>=20
> Yes I think you are right. Moreover this document
> (C-language-toolchain.rst) is meant for the Xen build. While this patch
> is trying to document the types used in the public headers for the
> external-facing ABI.
>=20
> I'll move the information this patch is adding to a separate document,
> specific to the public headers. I will only add the architectures
> currently working: I'll add ARMv8-A Aarch32 because although it is
> unsupported it is interesting to know the size of xen_ulong_t for
> aarch32 in the public headers. I will remove ARMv8-R as it is not
> available upstream.
>=20
> Thinking a bit more. What about Armv9? Rather than listing each version, =
should we instead use ARMv7-A aarch32 and later, ARMv8-A aarch64 and later?

Definitely you are right here but as for Armv8-R, Armv9 is not something th=
at we explicitely support right now (even though it should work).

Cheers
Bertrand



