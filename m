Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CB3A68CBC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:25:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920562.1324698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusTw-0000fw-Bv; Wed, 19 Mar 2025 12:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920562.1324698; Wed, 19 Mar 2025 12:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusTw-0000dD-9C; Wed, 19 Mar 2025 12:25:12 +0000
Received: by outflank-mailman (input) for mailman id 920562;
 Wed, 19 Mar 2025 12:25:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abOv=WG=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tusTv-0000d7-0W
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:25:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2613::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3243145e-04bd-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 13:25:09 +0100 (CET)
Received: from AS9PR05CA0064.eurprd05.prod.outlook.com (2603:10a6:20b:499::14)
 by PR3PR08MB5836.eurprd08.prod.outlook.com (2603:10a6:102:8f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 12:25:03 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:499:cafe::30) by AS9PR05CA0064.outlook.office365.com
 (2603:10a6:20b:499::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Wed,
 19 Mar 2025 12:25:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Wed, 19 Mar 2025 12:25:02 +0000
Received: ("Tessian outbound ec1a125a00e6:v597");
 Wed, 19 Mar 2025 12:25:02 +0000
Received: from Le61865386ede.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B821F237-F8A8-4AED-90CB-FAA480B69D3A.1; 
 Wed, 19 Mar 2025 12:24:52 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le61865386ede.3 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 19 Mar 2025 12:24:52 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 GVXPR08MB10686.eurprd08.prod.outlook.com (2603:10a6:150:150::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 12:24:47 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 12:24:47 +0000
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
X-Inumbo-ID: 3243145e-04bd-11f0-9ffa-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=A/0iUoeoHFAji7Sgq7C0Ms7RWBhcSzRfdsk2GcCdjVXuWZTLb27pFHCRReXlU1FHdQg46VAvoBAnjrY7TcQJRt8AiqfkROrfeIzhYBC6MHNIYhgZjCh4T+w5KbyWHUcMOL1AY8xtd+k28N6y0D8CEqkWbv58qYu1WbJyiieowQ3YZzNev0FcKTJGsbEK4imwxfdhbkMv60jsOmTquZUeTKUUfoU2qHaI98zLrgamt3AtIKkn5gvhBif76lIA6YV1yyJrKD3XKm+MdWMGUpQwQhZ3waFhEsaYhc/oWR6zHz3ci0wyx+H4ipUPUX6WU6kBWx7QbgPBFQJY8HvXlhrKpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmgsT9LLY1+AMem+hNahUPrYUjJDEKKRRV3TYLgNnqs=;
 b=OtuF7yoLNX4iJk3mqWLFPe2hDSgluCb2PrHOceTSBOx9Q0/6Wzmds6yMDjuoyvb+F+bZjzpuHjo18pM9tiRsbCmLs9ao2xTmmBKba09qhSqJn+W4troJNpZ7uTWp3KbSpi3UQjN9EtjxStpqqg/8wTuM6BhcZc/MCHzXpIwep+PcuTYcBS9qs9b1U6kqqX/JWbIAPQ79gsciw986dYg/nRmkZXq4AtJtCMX7tgZ1i0je9U877fZ4QV0tnYzh/OOuqQU57AsgFrCI5Tfv9+KcKpZsmTnkUs6GPYITcvYEMVYzZPnt3bT1Gnog4KIhi9v+Yb/LjZD8fCPayc2X5rnw6A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmgsT9LLY1+AMem+hNahUPrYUjJDEKKRRV3TYLgNnqs=;
 b=HSIgO6ENRALTI3K2VtCFNdanyrruzAGpjSvtjaqrKjtAg6znYc7A0fHg/1TTXvKSHLArlQbVfjMfl3xEdUfLbJ1l6oNANCdbhM2qG+XwigHFLUf8sygq5ekLdpz/niGtLW1tB3HI2IcN7EvhEVHWFzXBJb1VcU+v9MhYK0J+vH0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2b01a7191bd69f86
X-TessianGatewayMetadata: +/IK2RxRFFKgg6WhxAGJd3ELnohOM6ChnWIb30p0ODHV64My3VoqLv7SabHlZq+3lSHEUnP8IMIFbEXDODbtP6ynstuSCblURgAjlMXGK1xH54MWbFp0jOdXKkC0IXV8KnS+PKINiTf7dGOJezuV2vxjzSKKJrOGV4sjmREQl+U=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBGlAf6XYbVJ18uYRQ43CbJ56yR9QzaXLzpPciXb/upVRtvCIWnMie7Grr25YbChtM4R13+y0OMkvfPpClV7rhfkvi1N+cANO+6Dh0KSbL0GPCND7CMiZxmuj4Sb2XdG4q5TIU9vogwTy7Ly7n0paZjw9CRYhkyXSoO/S/3/0fnRlHl0KhYiR3pmHxncEGNAU/bJtWOZVHmABnxcmzl9NvsYSwwH4UN7/oaFKJNtkxY0q3H5VMSx2Z26CklOtPSWncwY9d+dDkjj5xzg5KoxWOWeCZSXrJBvhtfs0Oe39Mm7tXwohX9GPb3fMVysjGVYiN8WyKVj4qpvBj3qBLxM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmgsT9LLY1+AMem+hNahUPrYUjJDEKKRRV3TYLgNnqs=;
 b=cxDLq5+JQXYRwkg5x4M07yaVrPwzETJjrwirfXxaJXMdgeHOopM17ke6CJAp57vVOcLIoCQdtMX4JCqkF9z5VYH4ooWzJHovA+m/iEs+dtTxTDc+pjT1aLSc0NayZNveFPXIWPrcax+ShYPJgM2r/TWukYrZZqb1WA0I3evpQqcZJQ7CK9oevjtFuoXLuouc0Cs1505TI84ye0WxeDB13xBpbkFo5OmjR9EcnUV9bRzUCTEly/krkI/+YeLVReez6m9gyCVPlnwF4iwuktE9908gJcwRUZlwZueccLjFD9eDVlRyHMG5bVG29qTWEkRWzbdmamAhbVs58cXe4gXEcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmgsT9LLY1+AMem+hNahUPrYUjJDEKKRRV3TYLgNnqs=;
 b=HSIgO6ENRALTI3K2VtCFNdanyrruzAGpjSvtjaqrKjtAg6znYc7A0fHg/1TTXvKSHLArlQbVfjMfl3xEdUfLbJ1l6oNANCdbhM2qG+XwigHFLUf8sygq5ekLdpz/niGtLW1tB3HI2IcN7EvhEVHWFzXBJb1VcU+v9MhYK0J+vH0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Wei
 Chen <Wei.Chen@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 6/7] xen: introduce Kconfig ARCH_PAGING_MEMPOOL
Thread-Topic: [PATCH v3 6/7] xen: introduce Kconfig ARCH_PAGING_MEMPOOL
Thread-Index: AQHbl3hIuq5Ui4sTKky0PpKNFdMoBrN43e6AgAF5B4CAAAvlgIAAAd+A
Date: Wed, 19 Mar 2025 12:24:47 +0000
Message-ID: <F827A271-0E9B-4240-BB1E-C039E9EE5656@arm.com>
References: <20250317200727.798696-1-luca.fancellu@arm.com>
 <20250317200727.798696-7-luca.fancellu@arm.com>
 <85ba02a9-f9f9-4141-85be-a9a2d431e450@gmail.com>
 <26583ecf-4057-46b1-8f87-f4589d7bec17@suse.com>
 <D86D58F5-1EDD-4362-B163-5AD25C5DCC51@arm.com>
In-Reply-To: <D86D58F5-1EDD-4362-B163-5AD25C5DCC51@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|GVXPR08MB10686:EE_|AMS1EPF00000048:EE_|PR3PR08MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: cbdaff5a-cdfb-4910-4e3c-08dd66e112f5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MHZRUjdNUXB0SXpXMHNkNHBxMFpucm8yc0pBVHhVcjdSMnNzcm5rb1Q3ODVY?=
 =?utf-8?B?amh3cE5HL29jUlkwbStsbmhQaG5INEZQb3dlYytGMzRwSENaS211eUdaeHVq?=
 =?utf-8?B?N3dBb3VMSUVaSGhDeUpTUERlVnhKSStFTWpqNlpnSWR3UzBoa3NHZjhpdXM1?=
 =?utf-8?B?eHRjeU80U2JvNFJBdXY5VHdhVTI0SW13RXNMTXpxQ3ljaGVKcTZLZ0dJWmh2?=
 =?utf-8?B?Q2h4ODgydmJlWXBlZExST3FTTFRsOGZqaWhBdTlzSEJxQlRndnk0RUl2dFZm?=
 =?utf-8?B?ZllCb3hmLzdOVWFRcEZGZ0tNVktsbGNmendoc2VPM3h5azdCalpocTRpZTIw?=
 =?utf-8?B?OCs0L0pVS3lBbGVwclJMZmk3aStnQjVncDhOcVpMaTg5bHpOd1hFcnR1NGZU?=
 =?utf-8?B?L1A1dWhNK1l0c01SaUZPSGtyU2UySGkrMzFkVHNMUlBySE5SUU53WnRlZTdD?=
 =?utf-8?B?ZG5PbEhKcXFiNHUrM2ErdDcwNjhMK0NTb0IvVHArTk8vRktCd0h0cTZXWjVa?=
 =?utf-8?B?ck9VZ0p3dUxhcVZOK3MwSFhQajh1aGlyUVUyRVQ0aHdBSDBhaEtuUWI4Y1lV?=
 =?utf-8?B?elp5bDhPNVIvTVRseDBsRE5BQWJkMUJRWUtMbWRESWRwbnFGc3VGYjhYRi9N?=
 =?utf-8?B?UElCZDJzRkpMeHh4NVh0ZWhJSGRxRjRsejdiZDFqbWVnLzFBWnkxT2hMVTNy?=
 =?utf-8?B?M1JyYThnR21uQkpwK1pqSk5jbmZiWmNoWTBDM0plaXk3MDlrWk1CVWtoZ0pO?=
 =?utf-8?B?R0xaaEQ3d0Q0M1FEbmhUWVRPL3BUODBPNDNPbndyUENiZjhDNjlhcGR6U0Nr?=
 =?utf-8?B?M2piUGFVaUJWeTI0Nk5tVzNJY1kxVFh0Z0JRb3FRejVrUHVoT0d6bjd4dFhs?=
 =?utf-8?B?NDZsd25iTU9sODBPa0cvOEVnR1pmSTJ2ZGVFUEZmWUpHeVJnZER3ei80d3FY?=
 =?utf-8?B?bXprc21CNnRDSDZ3cHorN2FwMEdDWGt4SjdTektnTWFVMXFablN3MnFwcDZs?=
 =?utf-8?B?UFBpMHdzRW5ZSGptd0lDRVhCNjRSVER3L2tTZ0hJOFk0QVZ2eTNRTjRXQ3Qz?=
 =?utf-8?B?MStNMVBmdnptNzI3Qlh0elFyallDV1ZSSlRDZnRGNk9wK3lxSWRMR1E2THFY?=
 =?utf-8?B?Y2NyUUxrdFNoWjBVOHEvRVRKaWxrMWpjR2ZPNlkreWpiQm1SNC92NEdoTnlI?=
 =?utf-8?B?cTFCRThYUDFXRDcvMGduU2tEbmVIZElTR2JGL244RDZMVjUzTVVnTnNRVnFi?=
 =?utf-8?B?eDA3ZE0vSEFENHJ3dU9GbzRqdkxDbzFFbUR4eS8vSjIzd2Jndk5rOUl1Rk8y?=
 =?utf-8?B?YXpFZ1FueEhGR1JHSnVZdjFvU0FHV1FNcHRuU2V3K1RhZE50TURlTC81dFJh?=
 =?utf-8?B?S2pZWVhrTElzL1M0QVZRNmthMXhtTys2WjdNaFk2TnJ5VnptR1FXV25SN2R5?=
 =?utf-8?B?eEtMQWk4aDV3QXdrR1RobTNrMkppbXF3aDBmTEFUbmJZNGsxcTh5VGpDc2M0?=
 =?utf-8?B?d0twWXZKaENZbk8yR0ZVT1lwS09LbmRFUEoyT1Y2dUUxY0F6Z2svMC9Ma0lV?=
 =?utf-8?B?MFdQSUJFVnJCN0laT2RmQm5SbEs3QVpBSzRwbzdOZzJlcktPZ3QyT2ZSMENU?=
 =?utf-8?B?TE9oaG5nQlpoRGc4Yll2RjUwdDczWWZMVVZaZWxkRVA5RFZDYnU5c0xuaVZO?=
 =?utf-8?B?NlpNbDRjcFpmRkpIeHBrR3B5MXJncnVIeGsyZTE0WkF5VmNjQ2h3ZExqZlI0?=
 =?utf-8?B?U2NJNXMrdE0vb25laGhqc2hNYWNuc3E0MEh2L3BPSnB2ZklLS1BMS0JxdFVZ?=
 =?utf-8?B?UnphWEdDQkdTMk5wNmx5YkpKSnJVdHcwNTFBR3g5VVc0eW1pbk45S1hsaXVr?=
 =?utf-8?B?akZlQi8rRVJWMloxckRrUVdsRlNQbHRqVS9qTmlVQWJzVWFlTFI3ak1nNmNT?=
 =?utf-8?Q?SCjrZc1UYbv3PD4ISNLqaAVoWdBZT6z2?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9333D62EE57DF742ACC59304071AF2BE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10686
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:5:1c::25];domain=DB7PR08MB2987.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d8c968a7-0ec4-439d-ea42-08dd66e109ca
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zko5c3lsRE1BV2VJZ1lwSGZjRWxQMXkxZEpIcFUzYkY0aXpFV3VFVzcwanQ5?=
 =?utf-8?B?a0FKT1FWQ0NxSjNjVFpzL0JIVklCVmI1MktRMyttUEt4WitMQ0FndmRvMGt4?=
 =?utf-8?B?ZWhvOHZ4ZkM4dEE2cTlGRy96Z2RXcEIwTk50M2NUU0xEeGp0WWY4c2YwNGxn?=
 =?utf-8?B?czdCY2RLNWdoOFZjT01QQVZQc1B6OHlDdjhCNGI3V25hZ0lnVDhhQy9Hd3Z3?=
 =?utf-8?B?bk9WbjlyVUl1K240U1dvNEduZmRRWDljUlE1bHVaS0lMOFlLYnFXS1Y0ZTlh?=
 =?utf-8?B?RnBCWWpZOU9Hd3h1dEk2RjNZVkNUTHV2ZUhsR3BxaC9XK0llOXAyQVVGZEpL?=
 =?utf-8?B?bGVaRWV0QkhHZ1hlbDZ2Q1hzNUtqS3FYUmJrcTZNZGZwZU9jT2ZKS2oyYXhQ?=
 =?utf-8?B?cUxqNWdmamQ4bW5Lajc4MWhsLzl3b1F3VzEzUmQzMTV4a20xeE9UYWJzZHZH?=
 =?utf-8?B?ZE9sOUR5TjRmcE5WM05ha2FaU0I2Q0ZualAwWko1ZklRZ1dmK2t0dnhuczZ4?=
 =?utf-8?B?REo4V1kvdGZrZ3ZnUWpzSkJybk1FY2RoRTJ3dWx4Y0s5U0tocFBMdlhVRDhB?=
 =?utf-8?B?MFBrdEFqdlpXUVFtNG05SG1MTktzd2VTek5aL1lzd0FkZUs5OUdKdHdDYU15?=
 =?utf-8?B?YkJGWHZhdU5NYi9qTjJtbnc4TTFZYlN2WG00b2xUNWx0TC9PZ1ZFYmI1c0Vr?=
 =?utf-8?B?Y21LZVFRYWU0ZWZsazBVRDJ1TFI2MmJMNi9ENHpFWGV1RTY0R1ZEd3hxUEJP?=
 =?utf-8?B?U3FnQklkYnFSZE4yVlNUR3NQMjZsdlNEMTRZQWEweUsydUtydGtqbC9Td1Nl?=
 =?utf-8?B?R1dLTWZ3T3UrdThBY2F1MWdVS3JXRCtNTEJBMERxdllBc3FQNTQ3N0ZsRSs4?=
 =?utf-8?B?Z2dGeSt5TkczWm1sbVJPNmtBMjBsRXE2ZTRvNktDcXFLT0FDVjZsdkRnNmto?=
 =?utf-8?B?NWlMaU56dXllMHJYRWpueXU3LzZLVndzYXR1M2FsaUt3c0YvSzF0U0FIalFG?=
 =?utf-8?B?MktUbUVCY0pBcDhJcExrSTRPSmlSais4b3VDT2x3emExV1dhMUMyYTR5dVZG?=
 =?utf-8?B?aitwRGhRb2JLdUY0S3ZWcHFFTG41RjJqMTRxUXI1N3ZMdEdBcVVZSnV4TTVQ?=
 =?utf-8?B?S0tZL2gwaUlabG5NMG0xYmIybkpQTmtsSWF6SnlObHU1cENUeU9BMWtjWDNm?=
 =?utf-8?B?MHljRTluelRyU1dlMjRiQkQ3L3RWSnZaTlhMK2E2a3NLY1l1SmJlWHVMU0dU?=
 =?utf-8?B?Yk5MMzVzbndFSXB3ck9BZlNaL2ZYQWp3MUJyUTkvVlpMNXFJZ0VxcC9FZnl2?=
 =?utf-8?B?NHJCdXI2MGlpQk5KZ1JEQkcxMlR5ZENjNnAyVUpKbDdId0E4d0lmSEdSMXVV?=
 =?utf-8?B?RzdLMDZLSGttYS93cXZqZVRVVWI0Vkp1b1VZaUJMTXZDdHR5My9wbloySEVG?=
 =?utf-8?B?WWMvUFoxRDNTL1lXMUp1ZmNOQko0NEIwaUphWWhITnZ5T01lbEljbWRxSStY?=
 =?utf-8?B?cWhQUWs3cy95cFdKTURETW5aUitoV2FlWUZ3cGY1QnZIaUNKU1pnUlhkbFB1?=
 =?utf-8?B?Y1dMQkcrZTNMUHo3bEczdG1uMFljLzV6c1VmQjl4a2Vsek9ncmJrdDIrV1gz?=
 =?utf-8?B?bnhPQW9KamdBUHR2Vmhvc05KT3VwNC9xSUFDQWxHMyt0dU0zQ3ZWV1hxNTdt?=
 =?utf-8?B?VVBLVEpneTZqNkthclQybFd3UzBUbHhKZ3JYeGFVRnp2amxsVVNkQzhLbnlz?=
 =?utf-8?B?M2gzbEpFb3hPTUxGWmNOeUZQeEF5ZzcyV0lxVmRLblVJTUVkbHhIYmJYMnVZ?=
 =?utf-8?B?YXU2RzFqaEVHdU5kOXpQbVlhWW9HZmQ2b09lSmRNMzF5QjdJWEVNZ2JuR3oy?=
 =?utf-8?B?RmFNbjJxeVdpMSs3RURhUDF5QUVxa1UvN0w4a3hZd3ZnZzI1VmxGejd5WkFB?=
 =?utf-8?B?K0w2aFEzL3hSYmRvS0o1Tm01MUVaSUZ5QmZDWEdQekRja2Fzci80aE5nTG9u?=
 =?utf-8?Q?etcePPVWFSDQ9janudwGpg1HGIvEKQ=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 12:25:02.7594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbdaff5a-cdfb-4910-4e3c-08dd66e112f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5836

DQoNCj4gT24gMTkgTWFyIDIwMjUsIGF0IDEyOjE4LCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNl
bGx1QGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgSmFuLA0KPiANCj4+IE9uIDE5IE1hciAyMDI1
LCBhdCAxMTozNSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+IA0K
Pj4gT24gMTguMDMuMjAyNSAxNDowNSwgT2xla3NpaSBLdXJvY2hrbyB3cm90ZToNCj4+PiANCj4+
PiBPbiAzLzE3LzI1IDk6MDcgUE0sIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+IEZyb206IFBl
bm55IFpoZW5nPFBlbm55LlpoZW5nQGFybS5jb20+DQo+Pj4+IA0KPj4+PiBBUk0gTVBVIHN5c3Rl
bSBkb2Vzbid0IG5lZWQgdG8gdXNlIHBhZ2luZyBtZW1vcnkgcG9vbCwgYXMgTVBVIG1lbW9yeQ0K
Pj4+PiBtYXBwaW5nIHRhYmxlIGF0IG1vc3QgdGFrZXMgb25seSBvbmUgNEtCIHBhZ2UsIHdoaWNo
IGlzIGVub3VnaCB0bw0KPj4+PiBtYW5hZ2UgdGhlIG1heGltdW0gMjU1IE1QVSBtZW1vcnkgcmVn
aW9ucywgZm9yIGFsbCBFTDIgc3RhZ2UgMQ0KPj4+PiB0cmFuc2xhdGlvbiBhbmQgRUwxIHN0YWdl
IDIgdHJhbnNsYXRpb24uDQo+Pj4+IA0KPj4+PiBJbnRyb2R1Y2UgQVJDSF9QQUdJTkdfTUVNUE9P
TCBLY29uZmlnIGNvbW1vbiBzeW1ib2wsIHNlbGVjdGVkIGZvciBBcm0NCj4+Pj4gTU1VIHN5c3Rl
bXMsIHg4NiBhbmQgUklTQy1WLg0KPj4+PiANCj4+Pj4gV3JhcCB0aGUgY29kZSBpbnNpZGUgJ2Nv
bnN0cnVjdF9kb21VJyB0aGF0IGRlYWwgd2l0aCBwMm0gcGFnaW5nDQo+Pj4+IGFsbG9jYXRpb24g
aW4gYSBuZXcgZnVuY3Rpb24gJ2RvbWFpbl9wMm1fc2V0X2FsbG9jYXRpb24nLCBwcm90ZWN0ZWQN
Cj4+Pj4gYnkgQVJDSF9QQUdJTkdfTUVNUE9PTCwgdGhpcyBpcyBkb25lIGluIHRoaXMgd2F5IHRv
IHByZXZlbnQgcG9sbHV0aW5nDQo+Pj4+IHRoZSBmb3JtZXIgZnVuY3Rpb24gd2l0aCAjaWZkZWZz
IGFuZCBpbXByb3ZlIHJlYWRhYmlsaXR5DQo+Pj4+IA0KPj4+PiBJbnRyb2R1Y2UgYXJjaF97Z2V0
LHNldH1fcGFnaW5nX21lbXBvb2xfc2l6ZSBzdHVicyBmb3IgYXJjaGl0ZWN0dXJlDQo+Pj4+IHdp
dGggIUFSQ0hfUEFHSU5HX01FTVBPT0wuDQo+Pj4+IA0KPj4+PiBSZW1vdmUgJ3N0cnVjdCBwYWdp
bmdfZG9tYWluJyBmcm9tIEFybSAnc3RydWN0IGFyY2hfZG9tYWluJyB3aGVuIHRoZQ0KPj4+PiBm
aWVsZCBpcyBub3QgcmVxdWlyZWQuDQo+Pj4+IA0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBa
aGVuZzxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbjx3
ZWkuY2hlbkBhcm0uY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1PGx1Y2Eu
ZmFuY2VsbHVAYXJtLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IHYzIGNoYW5nZXM6DQo+Pj4+IC0gSW50
cm9kdWNlZCBBUkNIX1BBR0lOR19NRU1QT09MIGluc3RlYWQgb2YgSEFTX1BBR0lOR19NRU1QT09M
DQo+Pj4+IHYyIGNoYW5nZXM6DQo+Pj4+IC0gbWFrZSBLY29uZmlnIEhBU19QQUdJTkdfTUVNUE9P
TCBjb21tb24NCj4+Pj4gLSBwcm90ZWN0IGFsc28gInhlbixkb21haW4tcDJtLW1lbS1tYiIgcmVh
ZGluZyB3aXRoIEhBU19QQUdJTkdfTUVNUE9PTA0KPj4+PiAtIGRvIG5vdCBkZWZpbmUgcDJtX3Rl
YXJkb3due19hbGxvY2F0aW9ufSBpbiB0aGlzIHBhdGNoDQo+Pj4+IC0gY2hhbmdlIGNvbW1pdCBt
ZXNzYWdlDQo+Pj4+IC0tLQ0KPj4+PiB4ZW4vYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgICAgICAg
fCAgMSArDQo+Pj4+IHhlbi9hcmNoL2FybS9kb20wbGVzcy1idWlsZC5jICAgICB8IDc0ICsrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4+Pj4geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L2RvbWFpbi5oIHwgIDIgKw0KPj4+PiB4ZW4vYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAg
fCAgMSArDQo+Pj4+IHhlbi9hcmNoL3g4Ni9LY29uZmlnICAgICAgICAgICAgICB8ICAxICsNCj4+
Pj4geGVuL2NvbW1vbi9LY29uZmlnICAgICAgICAgICAgICAgIHwgIDMgKysNCj4+Pj4geGVuL2lu
Y2x1ZGUveGVuL2RvbWFpbi5oICAgICAgICAgIHwgMTcgKysrKysrKw0KPj4+PiA3IGZpbGVzIGNo
YW5nZWQsIDczIGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQ0KPj4+IA0KPj4+IEZvciBS
SVNDLVY6DQo+Pj4gUmV2aWV3ZWQtYnk6IE9sZWtzaWkgS3Vyb2Noa288b2xla3NpaS5rdXJvY2hr
b0BnbWFpbC5jb20+DQo+PiANCj4+IE1pbmQgbWUgYXNraW5nIHRoZW4gd2h5IFJJU0MtViBuZWVk
cyB0aGlzIGF0IHRoaXMgcG9pbnQ/IFRoZSBzdHVicyBzdXJlbHkNCj4+IHdlcmUgYWRkZWQgdG8g
YWRkcmVzcyBzb21lIGJ1aWxkIGlzc3VlLCBub3QgYmVjYXVzZSB0aGV5IGFyZSBhY3RpdmVseQ0K
Pj4gbWVhbmluZ2Z1bD8NCj4gDQo+IHNvcnJ5IEnigJltIG5vdCBhIFJJU0MtViBleHBlcnQsIEkg
c2F3IHRoZSBzdHViIGFuZCBJIHRob3VnaHQgdGhlIGFyY2hpdGVjdHVyZSB3YW50ZWQgdG8gaGF2
ZSB0aGVtIGltcGxlbWVudGVkLg0KPiANCj4gSWYgbm90LCBpcyBpdCBwb3NzaWJsZSB0byBsZXQg
dGhlIFJJU0MtViBwZW9wbGUgaGFuZGxlIHRoYXQgc2VwYXJhdGVseT8gSeKAmWxsIGJlIG9mZiB1
bnRpbCAzMXN0IG9mIE1hcmNoIGFuZCB0aGlzIHBhdGNoIGlzDQo+IHVzZWZ1bCBmb3IgQXlhbiB0
byBpbnRyb2R1Y2UgYSBidWlsZGluZyBzdGF0dXMgZm9yIGFybTMyLg0KDQpPaCwgYXBvbG9naWVz
IEkgZGlkbuKAmXQgc2VlIHlvdSB3ZXJlIHJlcGx5aW5nIHRvIE9sZWtzaWksIGFueXdheSBpZiBw
b3NzaWJsZSBhbmQgeW91IGFyZSBvayB3aXRoIHRoaXMgcGF0Y2gsDQpJIHdvdWxkIGFzayB0aGUg
YWJvdmUuDQoNCj4gDQo+IENoZWVycywNCj4gTHVjYQ0KPiANCj4+IA0KPj4gSmFuDQo+IA0KDQo=

