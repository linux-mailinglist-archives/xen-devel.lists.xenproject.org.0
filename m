Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3534D6E0C10
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 13:07:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520628.808417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmunV-0003Qb-ET; Thu, 13 Apr 2023 11:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520628.808417; Thu, 13 Apr 2023 11:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmunV-0003Na-B7; Thu, 13 Apr 2023 11:07:25 +0000
Received: by outflank-mailman (input) for mailman id 520628;
 Thu, 13 Apr 2023 11:07:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vvgu=AE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmunU-0003NU-Ju
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 11:07:24 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dd9f92b-d9eb-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 13:07:23 +0200 (CEST)
Received: from DU2PR04CA0303.eurprd04.prod.outlook.com (2603:10a6:10:2b5::8)
 by GV2PR08MB8170.eurprd08.prod.outlook.com (2603:10a6:150:74::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 11:07:13 +0000
Received: from DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::78) by DU2PR04CA0303.outlook.office365.com
 (2603:10a6:10:2b5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.31 via Frontend
 Transport; Thu, 13 Apr 2023 11:07:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT045.mail.protection.outlook.com (100.127.142.142) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 11:07:13 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Thu, 13 Apr 2023 11:07:13 +0000
Received: from 583c30d9f038.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B5692465-EF07-44D4-8B09-58C394C9F5BA.1; 
 Thu, 13 Apr 2023 11:07:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 583c30d9f038.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 11:07:07 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9575.eurprd08.prod.outlook.com (2603:10a6:20b:619::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 11:07:04 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 11:07:04 +0000
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
X-Inumbo-ID: 5dd9f92b-d9eb-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJWgnlrg0Wg4hkIVgIUCJl1zVVBS0VE1HQf7JQV7XmE=;
 b=0IvQBB02+ryCJFB31AN3SgAaFH2GruzdAEfFHELAX2o0zqn0FOqmKDA16GfbfiFsMWPZPt/TNhYcD7GXmAwrNmJmQycqc4JMdmWhUhw48/IfmJFs8L0IuN2wxYNBT5ct/u0BW0xULLgpuXZOCgqq7LMlbw+J0Du/C3bmQb2bURM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYxpVoQiolbrAZwtaaG74oJOTiGlSQcF/CcrnGTGPeFdcfKgdJ5aoWa6ub2V0d3LHzbmyYjG+ODUfaywRcohSRBVF+TcWeJVGg4tb0QGhCHt8O22FbTQ+wkR2KcLZufEfx/TEngKVIFdK97UTh6r7Rw7d+k5s6e6ciwpVmMNe5BDgkmEHKIuYt+C0YRDxWRnWZcEda04XugUlZFVxniz80EmGT6w+c7OtIysGnFrtl64JcAxjYWQgQ6zePNRLxPQSKeNkUF2Aq0EYxPfTYtrjjhPpKdwDxfTL7oX5dcLTpCBnnVC2yFIELlWxOJKZiM1ujJUX7Nksqo1TM7mEJavXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJWgnlrg0Wg4hkIVgIUCJl1zVVBS0VE1HQf7JQV7XmE=;
 b=j6HlG/SHaxh/tVVfEbLbKIpk1FfzQ6YCqIiOiMTFNa0nT2nN2jzn5yvnaRfzFFeZrJZD1nxjKDZGlJnvGPRwrMTMCMIJtBgz9vlROUYYeiuUJy+R8NTLPSrb/MuQd2jXy/COLh1//0reAt7ejheRIh97FiROYgbj1KqlurTZL/3dOID0Gm8ma++mM7cllr5XvFM6O4t4nriEkKhM5WZSDdmT9SjFjgiWCDbUBuI+tpSZEQ6/6Te9mbWZj+wdsVnj7ixJD4lc7hWWQi8B1c2/1J3WinSW1LwJjwHF/aqzEJLsGikUO+pOmTQokDtZwOw0KWN/tt7zmeb7KdeZTB+ghw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJWgnlrg0Wg4hkIVgIUCJl1zVVBS0VE1HQf7JQV7XmE=;
 b=0IvQBB02+ryCJFB31AN3SgAaFH2GruzdAEfFHELAX2o0zqn0FOqmKDA16GfbfiFsMWPZPt/TNhYcD7GXmAwrNmJmQycqc4JMdmWhUhw48/IfmJFs8L0IuN2wxYNBT5ct/u0BW0xULLgpuXZOCgqq7LMlbw+J0Du/C3bmQb2bURM=
From: Henry Wang <Henry.Wang@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN PATCH v8 08/22] xen/arm: ffa: add support for FFA_ID_GET
Thread-Topic: [XEN PATCH v8 08/22] xen/arm: ffa: add support for FFA_ID_GET
Thread-Index: AQHZbdfdlkWasQb0b0OUu0VnJOxcoK8pEVxw
Date: Thu, 13 Apr 2023 11:07:04 +0000
Message-ID:
 <AS8PR08MB7991020B2BB9676DACD2494392989@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-9-jens.wiklander@linaro.org>
In-Reply-To: <20230413071424.3273490-9-jens.wiklander@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EDEA08A656D40C4DA2380F8808E3DB5A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9575:EE_|DBAEUR03FT045:EE_|GV2PR08MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: edcb7e6b-2cba-4591-5a78-08db3c0f3c03
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 d/YWIZg8OFsN8TObEvR+Sm89L9a2gb0kajVkrioXR1dtZThz2kPSHihZ12MNeSiZak2pWOisaZoWGjXo1u7f8sLG8spqjJ+RcDCQk4L9OuCNARl3LnqABdSb8r0/7wYb4PPxMyc0zypTzJsP24FRqHmEwEFQCKqHL15FAkw4AaLxzYwJutb3nWIsM85XNHnJoialUM3YVFfI8mWy8uBf/0ESNum6NEUGpMWtHfDV2Enrz9LzrZNkhSg/7zoBVRX1B9KhMU3lTS1iOyl9zyMwraAZPjgRJ801LGk+u4tHmwYQkNC1ziBiD1gN9mWeUvEs08cTYgaeuAEFQ93jNUmUgBziGyP4nLh8fwmAwfbsNaN0446g3EKfChPplBUxKXKLX9NYRHG75qEhH7t5FNmkpRxoQvjiKEdCsqsX1kVDWdbXa0AQkVJRnrWukQxLUWGCbFF8PYR9PgBwVWQ7KJQu0R50pPxE7h6Wk+16PU2BzzSYrnkPSxbyWlrTZ7Wcmcz8ZNHogWfVvSoKIDEDxgEXmVks8jKEg8JJ2RrmrkoL+B+EEZsSY4RMDTxMiqg78IMa2OqkTR33N4/e1UsL82FQXTSDYdO4RzS3o0p/b0SEMv0Ss9Z4GsMsaDdvMV8plBI+
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(478600001)(71200400001)(7696005)(52536014)(33656002)(55016003)(83380400001)(122000001)(38100700002)(38070700005)(86362001)(2906002)(4744005)(316002)(26005)(5660300002)(9686003)(6506007)(110136005)(186003)(66446008)(8676002)(64756008)(66476007)(41300700001)(4326008)(8936002)(76116006)(54906003)(66556008)(66946007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9575
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	45487b85-16a8-44dd-fe35-08db3c0f36e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7kQ1jFSIFJyjlfcsiFgtjWEB1i7EErLPiov6yIGxzxk0W9bqtcaMlKx0XVCs6tLwerEqTiafck0pLQKh7OVj3aiLFSPSbenq9LgBIZ/4P7y8T5aWUg7UNiAnMNDLC2i/gwwrhxWSyYyA79E4Zj1ftZ10MVrNFTDXaDhT46pvldJQEK646gtXpWNaRh0cOOemAF2kqeyShiq3XLeKmNd1lHQRGd4Up2MlzPRqPsyOed65bKzSCdAw4AFLPnoqIOCjpNgFVHPBMANEIW934z4wmU1dmj2MihlTKdDDkj9JSyuWOLDeoPX1zK13ZeiRDGoFiLWlXI6fPuMUFbB+lWQahy4sPoGjEugknaMvxkozO2DxdOE7+vbECNED2baa+f3N9ETODvQe4TccS2MVGEutXxZx18KdlEepvI50+zD10LO4Vs/lj6EL/zuTDdCRjGOu0SKyQF7bvL2EdDKd+60GtqMBgktYUajZUATjiPUg56NToEQg4BSyERK6HRy3g+h+KsWW6J6Z3KUmmbPtdRc/64zegaJz0Uy5hzgra1aquiWc9UMterfr3/RI9oD95SjzqibTQM6HC8ttw6a9xGpxj6I25Ek6uZCwhPx47Kgpy4eSIZxEjHWT8At/auKWrt9O2+hbt0xem7Kl7fCZ491XD8bNRNTnvQ1r8IoNFSSvczyqsS5y95r7osJ6QWKbXj+IyDrkEWWFe2yyrI9eSuGzYQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(47076005)(40460700003)(7696005)(70206006)(41300700001)(54906003)(478600001)(8676002)(70586007)(4326008)(316002)(110136005)(81166007)(86362001)(33656002)(336012)(6506007)(9686003)(83380400001)(26005)(55016003)(4744005)(2906002)(5660300002)(40480700001)(36860700001)(82310400005)(8936002)(82740400003)(186003)(52536014)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 11:07:13.2085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edcb7e6b-2cba-4591-5a78-08db3c0f3c03
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8170

Hi Jens,

> -----Original Message-----
> Subject: [XEN PATCH v8 08/22] xen/arm: ffa: add support for FFA_ID_GET
>=20
> Adds support for the FF-A function FFA_ID_GET to return the ID of the
> calling client.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  xen/arch/arm/tee/ffa.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 90ed71cbfda3..f129879c5b81 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -181,6 +181,12 @@ static bool ffa_get_version(uint32_t *vers)
>      return true;
>  }
>=20
> +static uint16_t get_vm_id(const struct domain *d)
> +{
> +    /* +1 since 0 is reserved for the hypervisor in FF-A */
> +    return d->domain_id + 1;

Since here you want 0 to be reserved, I think maybe you can use
the "d->arch.p2m.vmid"? According to the logic in p2m_alloc_vmid(),
the "d->arch.p2m.vmid" is also a per-domain u16 value that starts
from 1.

Kind regards,
Henry

