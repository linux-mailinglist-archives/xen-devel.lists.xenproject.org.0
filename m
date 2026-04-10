Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL+JKFUJ2WnnlQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 16:29:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EBC3D8AA8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 16:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279191.1563737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBCrQ-0006XD-7H; Fri, 10 Apr 2026 14:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279191.1563737; Fri, 10 Apr 2026 14:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBCrQ-0006UX-4U; Fri, 10 Apr 2026 14:29:28 +0000
Received: by outflank-mailman (input) for mailman id 1279191;
 Fri, 10 Apr 2026 14:29:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wBCrO-0006Tf-PV
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 14:29:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBCrO-00HPFQ-5X
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 16:29:26 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d90933-e002-0a2a0a5209dd-0a2a45049558-24
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 16:29:25 +0200
Received: from [52.101.83.10]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d90945-bb33-0a2a45040019-3465530a2f21-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 16:29:25 +0200
Received: from CWLP123CA0210.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::19)
 by AS4PR08MB7478.eurprd08.prod.outlook.com (2603:10a6:20b:4e5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Fri, 10 Apr
 2026 14:29:22 +0000
Received: from AMS1EPF0000008D.eurprd05.prod.outlook.com
 (2603:10a6:400:19d:cafe::2a) by CWLP123CA0210.outlook.office365.com
 (2603:10a6:400:19d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 14:29:22 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000008D.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Fri, 10 Apr 2026 14:29:21 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AM8PR08MB5587.eurprd08.prod.outlook.com (2603:10a6:20b:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 10 Apr
 2026 14:28:17 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 14:28:17 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oDd0Ipkin1t98ruPPWTiYOrUj2Xwd+k22nalRPrUz1WvKCxvibNWnPl0PLufAZoMvEUtFz7ru8YA4bkFfKqtekUifPFhT1whT9xX0+WpLzWyDKA4NLvw7I2OsnP+F+mSGtWwWH1zFh1q8fUgHADNZqX4rqL//e6DmkDo31v861JABbCK9zGqChgkCwO2nI7Hmcb9OEoEOQS4+f2MLzfqISR3e5CeEv3fdkA+fs0rTKQdvpvJcbjmoMYYst600bfRJ7lZWtpOHE4D1wJ2T/rHZKHrSm3JH3doip7YQemg2buUexPEJBdWN/VF8RUcX9Dczw7yglxtMMtBubJnGRLDLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuNN5Xsm5V2t8jdqc1464X6IJZt1tsqeNB7XDP/BdVQ=;
 b=Y9Q5UH5gtw1ony9jgXevIq2do9tvKdmd0K6CtU61CaBEkfPEzun0IF/HytXSmaakLNrdKMbojTbBR+2WZYTcYv/bz50vKuCPjxJGUIjwRMDmqadI6uNEFkBz99PIOgLXXtLyHdaDCXpX5m+wVFSfk6t/4bKVjfs+v3mBmFa3sE/7CE1tyOTy6ow77vFpzRgND2q3B1103hhx/pmp/IMs5Z7MQMvOeunFaxPq97JPKXorAoQ4IpVcC7HtXyK2i/+3IE3aAeGOP9ixl2c8At4peVMpfDn0aCUWRV+V1fzOu83Cs3/AUBELjDb4A+p0v0a2DzO/XKmesX+E0qdxjtlqww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuNN5Xsm5V2t8jdqc1464X6IJZt1tsqeNB7XDP/BdVQ=;
 b=ElPRFkDTxnd8cZhWys0IYOg/LnwL/flzbFiA8kH0hZTG8dpZ1pgs38mgNZiu6wZaKuBQ2oYVtIBEf2dovr1NLG7VD9iKYygMqDRWKj75PLqJ9mFrxJ47BB3ZfYHB6pmpN/7MR7/KlVdRvXlZDiLOt6FLwRp3zReZA8hWXNebi9I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BE/Goq9Y45f9JgebPQF5enpDTlwFCAXun52Ak/orB82GQ0lEXmt0u1ZViB55fVAzR6YzIY7jNMRQ0PDtSuWVaZT04jUy950raM3y9G2WrtCxS2xTO7Vl/n/adjr1A88uv+Ahj58f/BpGa1IyvoSc9AreYxzjtMYq2wPxb4LBm4XivKfPGN5WTLrvHltVaWTCdoKE90WGJunZ1nhjuoANth/hdXR9xVhB/4ILnCAL83qeT6OJ0TpmqBEPB1l8erUtrcZLjaC21onrTIM/oLLKcWNhjwoxgK807pKcQ3dPW0z7KNbWfuLLn7fJiQq3z9ps2ouiURLMh8vLt0xhUomLpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuNN5Xsm5V2t8jdqc1464X6IJZt1tsqeNB7XDP/BdVQ=;
 b=Eq58nvMjj+xqoljhFq+zdg9vuD3T2euTzvt7zocBxZDLy3RHvHZ/4b4hoyITCluvl4uJCd+aixuYB/YU2ao8Zmb/EeI3F5HWcom1pmnjmAnuz91Lxw5xMIIHnnbQitMT5MQkbL1rIym+4AMHMH3/G0igcVnCGewywl+PzeDxTwAqGsky7OJPzYuK1CMb6qEk0qw5rkcctLXubbFKSTEIcCV0peAIRPbmB616aQ/0cVrgRbeprnwuNNCk2Nfr/vRlij7Fa1u0Ta4ixGSVAjBJylnKn25AaQZj2DFdBwcK46uq3CcYk85KNlVRGfAAb6Nd6oBs2deWyK5K038/rhrGqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuNN5Xsm5V2t8jdqc1464X6IJZt1tsqeNB7XDP/BdVQ=;
 b=ElPRFkDTxnd8cZhWys0IYOg/LnwL/flzbFiA8kH0hZTG8dpZ1pgs38mgNZiu6wZaKuBQ2oYVtIBEf2dovr1NLG7VD9iKYygMqDRWKj75PLqJ9mFrxJ47BB3ZfYHB6pmpN/7MR7/KlVdRvXlZDiLOt6FLwRp3zReZA8hWXNebi9I=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 07/23] xen/arm: vIOMMU: Add cmdline boot option "viommu
 = <string>"
Thread-Topic: [PATCH v3 07/23] xen/arm: vIOMMU: Add cmdline boot option
 "viommu = <string>"
Thread-Index: AQHcyPZFD1i896tq5E+b8JqjtvKuVw==
Date: Fri, 10 Apr 2026 14:28:17 +0000
Message-ID: <461C3828-5BCB-4F53-9B39-AB7FC8517039@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <5d86efa38ca99439153822fa19064bda6843fdc2.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <5d86efa38ca99439153822fa19064bda6843fdc2.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AM8PR08MB5587:EE_|AMS1EPF0000008D:EE_|AS4PR08MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fe9600d-0e2c-4a7c-8c9f-08de970d8edb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 b+Q+dVWmVK25wTaPLdEyZIVXt+NQDuSM0TKo4X3lmL5BcaMKAXEF+aR5SVGtwpvl5Wy/1gaZ5O5SWRk3709Z8LHvyhJfKgN2EqnOqDHu3aiv1aAYCulbWPMMM3OJCt+SxoNZVUriRLf4gHz4A9pNN+X5siIYCL4lQjiMXd1QLPIujD21SLHEYXqxz3ZdYhKwJ76sqmhBkhgHnhsJB2zhFp96RmYN5Aw+AOMT5BzjpNRwE2ldo68JyP3oS0QEkNTMRG9iZ+shgmYnuk2cSMeXmqUrHvRVqxFVRekyr9WEZZ2vRammb+/dcWu570OAWmAobaLCFtWxr2ixBl6IYDcQKcA4ssEWSCFMC9/XBxXEzRQO+AiRQ+5ZfJmAaKy6Pc+dAxT3Mdz73W46yIFoa7Y4jTgHrFylMVL0XJIEMx8qdWWogEyZ6o01zzc//X7lTRFjENCU/7TVtEgqIGLnWBbkX8zmPZErwZtpIzBANaE0DklfUgWBuZVxdw6Wq/W+8MUhYj+QXzAv4V7rUZx9VTmS8pyjGmb3IpbxJhLbeweSsESJp2Ol5bH90GFdMvhp5F9qob0JqmUdZEHLvN4auOrF4yy9dsxV0czk/C1Sasdgdx6mGlfAsEya+x0jpk/jgrACXrojWYOpV5bARnYRkBbCMCQCCDbUvucPzWZx+yifc2J1+GIVyhOnzWajqKokCWBsznJUSp0rIEv+WGnpacsl9pkk7yd7GyRpHvB/BD/XpMhyDGQ9Ig6QqeC5hr8BHOtVW+pPzY9jH5za0xYSnnFanHMl97nVCWJ7UqvRlWmBEDE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <31808764CAFB2A40BC60FF9466D5D940@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 g2epMz50ggjPIekTmcBbhT5Sc9BmGdHTjltlLAPSmxgzjpq/C8uA8NYxh3JCPjozJv8ECpZr5m1TTzJ9WSwHv1ZlERwwwvcfGcUcC9KFxID8MNIOQflBUqPonHkXZMNunXZhG1DviMumSN/7UjuZOPolmHLEW+3d//A6p6rsq8JDyvTKpQLpfU+JgysIBXqmpSFgKmdiuJzQvKOIRY+6Mp9WoAXVHBxH6vO9bAj8qqBLRH4jS9pBEuYC48yxfCrDWh0NTbdrstOsG5qszNu4IxpYUNKIR18snHS+JnCPPcuKkMzLVsEHS/adyuI+pDU/z68fWFeYrMDhtO7vnXRQtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5587
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000008D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e2f99864-abbd-4d8b-6e1c-08de970d686b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|35042699022|7416014|14060799003|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aTAm4MDN5vGrB8U1cZZzD8f/THhn29/i2WH0PmGBxYyirPIyFIax8b4nEU0G5nnqfInKwjdWNijBsE1SfM1XK90Dmal92yUXEHGAJrYHLlo+3r+OxtKe3qa7rZeFE8Fi07PC8OyBj8PXFrhxHBvBHwO6LGRrjNdHGTO/tJdjVZ7owP8/ygVJ9/G4SN85cACyxjBQZx4Qmejq3YrkqQwGmV+yEsHKxkeBCLETbTLDYTIg/X8EffAC9mZvunpFq00vmt4P59IbeFBIhDa0csVWV5dTvGe1xwKGknZEqZvR7699QaV7kxdV04BaozbWefL7yxE+FkweSh01g0ppjfsNmWwVgt3MBahMjDM+fwXlUG70hQf5cC47iomvGVQP5byzXP45GUd2av1wIrI1rSXAlq7LxfDJ36KsqJzFCT7DnD5yavSC1OHpp4xks5L8ihkEL7pRzsp8gH/EDMQALgqhoVFwxRtVbbVrv0SRntx5nrdQ7LGEno9HPAUp71Z9VRRk1zQ9QWB+lwPZYH92RI2Xu2HBHfWwwB7q8sWonG7/x2MTbg0UHsHZ+miLRxjk/T4/XcbEWKlqiXH16skj6W2Fky8pvyrNDNFNHYh4WIe6pfkLla4H/RbgefcH4UMxt76v3X8OHM7Z+kSduEVv9l8CKQb76+Iyd1PAUKOSqiC4I6k5BvIrptOoh/KzNeR6DtRMw3sAfhKg/TlrZlaEM3VlWuCWPYDbZ5wrHH9GwFGRdqkJh1AlvEyYwqJvR9aSXsz1EAWJHdqRoUkz3y2dTd3iLw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(35042699022)(7416014)(14060799003)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aY6IelDI3KwU+2xu5l1qzCSFZZqo1yK870IEemPtzfoR+YE9GqSShoOwG8fxad3SD+xHIhn5lRvnDnQ6eUEzvzGP5dO3hLj9HtPjUbqFkSsvEw3i6DarucvHayl/NV/Kftxh4+PpYwWwsmlvKdszgavXKNaYz+OIwgMUjleYrmlzn5Z6lyh5TFEDQnoFxT/nRVmWXhPo39TaSfsn9Z+opnQ/42nYDoP1Jn8EJtqvqK0QNQ5YnGGyOWY+x471WG5KaQZvSdA87TQtCXrpgBlhMpMzAxUgjkYFRAKTQNLteY0gXyeAcNwafrCHkzYv4JeyH4irSgz2sKsh70rVd6u8lQ+Mr3R21G6Zc0gYzuvpcdCTy2MQWdncxvXEILUQUSe/95NdEmzyN/8rGUQbdcs1/PACHTFgB1+382WdF7+YW73vOLQscFN2HmfD+rGPZIhU
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 14:29:21.9424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe9600d-0e2c-4a7c-8c9f-08de970d8edb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000008D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7478
X-purgate-ID: tlsNG-ebf023/1775831365-3273A51B-74863711/0/0
X-purgate-type: clean
X-purgate-size: 1064
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 09EBC3D8AA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

HI Milan,

>=20
> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm=
/viommu.h
> index 2a6742de73..ed338fe0ec 100644
> --- a/xen/arch/arm/include/asm/viommu.h
> +++ b/xen/arch/arm/include/asm/viommu.h
> @@ -10,6 +10,7 @@
> #include <public/xen.h>
>=20
> extern struct list_head host_iommu_list;
> +extern char viommu[];

As far as I can see this one is used only in this header by ...

>=20
> /* data structure for each hardware IOMMU */
> struct host_iommu {
> @@ -50,6 +51,12 @@ uint16_t viommu_get_type(void);
> void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>                             const struct dt_device_node *node);
>=20
> +static always_inline bool is_viommu_enabled(void)
> +{
> +    /* only smmuv3 emulation supported */
> +    return !strcmp(viommu, "smmuv3");
> +}

this function, it seems cleaner to me if viommu is static inside xen/xen/dr=
ivers/passthrough/arm/viommu.c
and this one can be defined there as well, so here we will have only the de=
claration.

Cheers,
Luca


