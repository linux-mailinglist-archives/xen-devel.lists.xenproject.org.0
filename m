Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBFEM/tre2mMEgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:17:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE99B0D51
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:17:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216563.1526524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSpm-0001kr-GK; Thu, 29 Jan 2026 14:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216563.1526524; Thu, 29 Jan 2026 14:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSpm-0001iU-Bf; Thu, 29 Jan 2026 14:17:22 +0000
Received: by outflank-mailman (input) for mailman id 1216563;
 Thu, 29 Jan 2026 14:17:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fLTt=AC=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vlSpk-0000f7-Sd
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 14:17:20 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 384e11f4-fd1d-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 15:17:19 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by VI1PR03MB10078.eurprd03.prod.outlook.com (2603:10a6:800:1ca::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 14:16:54 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 14:16:54 +0000
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
X-Inumbo-ID: 384e11f4-fd1d-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJOLARJpayihsKsUXpI/JmsQeb5IaTpViX288NfF3Sv1MOh3XT2WnyXNOLTcm2o3Tpda/tQnpPow0ufIrwhMXhiY1lkLNJL+ejIp5Qvz8AN6vEO3j0rSM+90W/ZBnBkBgqyIm5f9xvSoiOg1+lcef5sT+Gesq6RJoU9fZtl9G47IvmkX7nr1sYlzXxJyybCkbwmAFL1F4G8rLyH14F3FOkFNdbLDDSYSw/LreoyhDzwvjiOk9rEXUTpwfpBqQ2NQkJnkN7JQxJY4OPWFWZPxCR+j1a34+TUobu7tbalci65u9TSTcOEBuPC80ubc3w/eRfSbSjBzOXxvwbO1p1gLlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Nk1CN+j4B/Mq/rCvZP0747CGWDJEwdX0Pe1Pu44Qbs=;
 b=y0qbVyVi/NADXLFvHT8nTB6wevQCkSH4H8Aa6/vw4gPU6/ouPM1MLDONm5g1By+XSp4+ByHWy7y8fXR6RNRtsFzHLL/tBnK/y8cetdJ/9oD2IfAWB7LexGdE90eNMij9ZG47pExiPnnSJV08W2nQdTJXiVZYjXAW4WcycT1CewE58cfenzsyAviVqyIBasEmzn6avffkW3Q13q6sLafVDDzbIOHVRymafaViwjV5vUJhA3sWFAvyiD2AWqPkNCiH1M0tTtbeChhy27xEAcO2poqSpmZboS6+i7PKPcTqYNiXPPovhHepYTsTenfZ9PgbnCSTA/MdqU7Ifd2mRYez0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Nk1CN+j4B/Mq/rCvZP0747CGWDJEwdX0Pe1Pu44Qbs=;
 b=UQGQfo3RfMP+/lYnjUNENoHoCcq6tttHEjZbSTdhRMlZeNkCgwpKr3NfhBeyJMNeNfsaeEgwIK+h9x6naiCHXQnvG0uuBvQJ/LkHfu1KEOtGJqRynOl6doEH0U5XG1O7EzyDCjEKTIQ5aeKqrr6sgdl4gI07q0cqxueIYCItiMfZHopq1zk4Yg9uL/KjhCQkOU99Vp9vtJAqwzC9/LeToypRUgJ9qVyZ8/A25hQKbzdNkaPmX79YjxpQmi4ow/4/pyjKx+wIv7a10xQ7xH5YMWjU59ImNG08ychKa/+sl8dlHinUbpXcwIOIfgFEZBxgxRO133N04EfO17rpL2RfCQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [PATCH v9 2/5] xen: arm: smccc: add INVALID_PARAMETER error code
Thread-Topic: [PATCH v9 2/5] xen: arm: smccc: add INVALID_PARAMETER error code
Thread-Index: AQHckSnrwskB9T/f0k+nAMu3X/hdCA==
Date: Thu, 29 Jan 2026 14:16:54 +0000
Message-ID:
 <366a3a85e89e868a12e261ea0ae07aca661d0ab6.1769696107.git.oleksii_moisieiev@epam.com>
References: <cover.1769696107.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1769696107.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|VI1PR03MB10078:EE_
x-ms-office365-filtering-correlation-id: 0eb11185-380d-45e5-6d71-08de5f410e2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?70RzBF0IgbuTK8XVueyyXxDI3b11wWXwq1hMSr5ADH/xjVOI5fjAEy4Uyz?=
 =?iso-8859-1?Q?2D9YNo21hpmf8JTxImhMq7hOCjyx4qtoizXh88CL/Y5I6/VL+04qg/Sq8P?=
 =?iso-8859-1?Q?daRY5dkQlY7lJBiynXxpszeJYI4ShvTZe+1guh5af3kqb8i8w3SbpoXsVV?=
 =?iso-8859-1?Q?8x8tYvsG2ennvnVtwhqMFfYFVo9gx+/q76zRsRiYq85lH+yJvoyqfKH7iU?=
 =?iso-8859-1?Q?5FrhwjlUrh8AknhFM6H4s+nn00fYY7JO5QJcYNEWBQE4zdgeKROl3dngOy?=
 =?iso-8859-1?Q?ObmV1VEJzsfoRkcOBw7jbWm5y/gJfgHoebHw8m+NXI04xzi7YOOex+X1rV?=
 =?iso-8859-1?Q?7q7C7tzanOFHVlim4AS+kuJ3+mDM07x1hOPLrBML6Rj5DMETSQacVJMrG7?=
 =?iso-8859-1?Q?5Dn7pV3LqSMcyz8oYNOVOUvwERCtIkchFddpFMt4jPT0nYmbGkJfeHClVX?=
 =?iso-8859-1?Q?ocktBar9259NzbZ63mwKjiY6FGJ13VmEsL152Nn8YQXFBsJrRuDW5bW+sU?=
 =?iso-8859-1?Q?Pw6ZL1oUbd4Gm6xKQkbBd//aQjfD2Dz51xlTs7NNRTpia7X6ynhDNKLtB0?=
 =?iso-8859-1?Q?0uOGDlOEXa+IL76KsWfNcIl2LSjmdFfyKVyLam4QFfAjD1cikssTyvvbvB?=
 =?iso-8859-1?Q?1Aey5sWCvujT3+ZpcbA7hG41RjicHC/AjDtKjxC4cdQ7UD0aT30LR1yOK6?=
 =?iso-8859-1?Q?lqsqhtkdLY95VwpPBSXAzdg0izNeNIN03bDNgUS4fJTiJrnQlkmu8ZvfuX?=
 =?iso-8859-1?Q?PbDOKImw3QXYAHILWkQXFmdiKlX6qmjDpxHAyfDxlSlygRTEkMx48zo6fB?=
 =?iso-8859-1?Q?7NJNu2LncxeKeRh1VGfG2OmpXZ8W/ob5nX9/nAxo0XtQ7dzlTiPN1AE3qF?=
 =?iso-8859-1?Q?2TQzCiIZH+BRQu+CgtUewAJDCYt3h33HBf7nor5OwsBLeSmjnDBtYUdMA4?=
 =?iso-8859-1?Q?w9m+Gz4pqcG8mxIP8zB8E4fSuEMrcnzWudYd7wWClTU6hVw2VNo4iKKqFk?=
 =?iso-8859-1?Q?xBusxZj56HrJNdKMf4Ur1DQryzdqJRAjs/nqPLw85G5ARohL1GNZP1oYQX?=
 =?iso-8859-1?Q?BeCYXuMyFkC5/UtzaoEC8LyWp6EZVjfLChR4ud5jt7TZVJa3R42pVqvH8y?=
 =?iso-8859-1?Q?/5x1Wayi/xG8EIvO+K599lWSxE/UG/wDn09Y1Rw8DbCH2mwowTNPFA9d7f?=
 =?iso-8859-1?Q?zJsZTGMCc0XLUK+CF1Br6Q8cbFRn3gJB0co5Qg0XlDL5JfGAZTg5BR6q6p?=
 =?iso-8859-1?Q?5GndbzZ5TiJ5tODg27G4K+e7/VkCRa7MOoG8vtPEh8JRwfcrOTD0x8cQkT?=
 =?iso-8859-1?Q?pNDyvcvEfMlsVExyLEmRgQH0RSSQoAaUhyV1azCBtGWVxvOcjTIhVqkIFC?=
 =?iso-8859-1?Q?xem+IXF2n/KRMfmqIv2AnnKaP1Wuu37NgMV+Fwxtcg3BKodH+u06G4JSOW?=
 =?iso-8859-1?Q?UOjExTWTQ0qKpTxkrK8zTyJIvBdelC2a7Ymr5mWpdmT1nvPp6xJ5vGt8Cw?=
 =?iso-8859-1?Q?FQ7MVWhD5b9L9T27JB+hVKbMd87bzUVYUv2WlES4ATeBZd20ykY6xtVn+E?=
 =?iso-8859-1?Q?gnXeic0keK5WyrkkKzuTGJpC2ZAAEEV2IQINUhyZy7l41Nw9/16Qqs9tPl?=
 =?iso-8859-1?Q?p2swJaJir7pMzL+VZPew0zHAviskhN276tcAMGndaDCCEZ5VJ/Bpl/DvE3?=
 =?iso-8859-1?Q?H3ekLZoYrdE12UDmoM4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+2lhQWQJx7zeudOhV2GMyOXRB8jOmaJXETfJkIhiwfWFwWdeXpvh3NyXCh?=
 =?iso-8859-1?Q?Yex1SG95S0itf+pYXl8nmCqtW/Vk5bKPUG8wTD+9PYG5O+Gv2meCane1dS?=
 =?iso-8859-1?Q?OrKWPMLT2ldFyQgFKkxvRTLW/jm1rLRVP0M5N7IAaua2dLCBwkqks0bSWf?=
 =?iso-8859-1?Q?j6yDkg4LcnsWVawP4M2g/OIPUnddLleW/qQ0l6LIyiHSTZXr45xEyr2Mvc?=
 =?iso-8859-1?Q?r61Eg8u0nBl2EtDE0RTeVUQv6I7TfVrK+bM5+8hWpJeLo8RvHs4cEYbgRL?=
 =?iso-8859-1?Q?9OzIuMZ2A80gXko7pHrErK6pcfafrGV/jQlkbCwe5mSCIpKTKeUmJkTmGx?=
 =?iso-8859-1?Q?ohIYHGRCeOn60o4oeDgDW//qTjt0mKSCNexP4MlIwZUdC6MhUMI/jF/xaJ?=
 =?iso-8859-1?Q?KYaFqGE7uqF94BHVGJpi808JHD03ojWlbuFmklgqI1y//TXQgb8bT7BuZI?=
 =?iso-8859-1?Q?LAOQ84zYHUhD14HSRnkTLLkzseuIFpHfa72WmukzBYimX678zHhVO5haId?=
 =?iso-8859-1?Q?wx+fGpG/qTsTTTlMoziy//qbbnXNvli3kteSSAQFgK95h0kYGVP6e6l4Nr?=
 =?iso-8859-1?Q?8Dz09ZjmZiRai/F4JZ5CE23ptOSquJechWtMFsf4oGzGaw0ReTbD3rcx5j?=
 =?iso-8859-1?Q?ALjHopgxLwqoMC0nPzwNCDe/SRJyb9puQ10UC3vY/e9nswKBDb2/JoZ5Ki?=
 =?iso-8859-1?Q?AMoXDv+gpOIV7zpvsxjJVKoXHcWWkD5M5zEThcJuoyThYTfxqQ9Mh6imVm?=
 =?iso-8859-1?Q?I5jnpsg/LavI3lLJH95WbtHZI1vQFlvK0d7b317/4mdyrTsTwNd60VEuH/?=
 =?iso-8859-1?Q?v7HmBEN/u+1UePlPImGWhQ+/id1xKijwDOazNz5lwIdm2qnNViwfxaDiTe?=
 =?iso-8859-1?Q?Q4zOEc4GekwaBHXo99f41XURZ4mp/4hSjiAhjDWbdNgjLeu8O1e2y4CKkG?=
 =?iso-8859-1?Q?iAauN3S+lZRNn1pHWBrKehrq7v/XSmC7CLZEcnn9W8VJEKfs+y/ZhxTXM+?=
 =?iso-8859-1?Q?BuRjGfPE9M/RG36Fx6VoOIiCWx4CLvMcVIa66ekY6e3nlxICfg6IUcpRTO?=
 =?iso-8859-1?Q?0e68vvzoUk6hoCdF7vbXxb3aPACJAgxoIXZOPm+r1imsAGN5qoXQzv7KOJ?=
 =?iso-8859-1?Q?vffqQSblKlyMgksIDPmIK9UpI7wunyqLptSJSjCnahk/alz6kVsFFRqpC2?=
 =?iso-8859-1?Q?CHJxoVndr+qT5AlgsvFhMywJRWrLhsZ7J7P47o4dPUDSU6HJgOQSxGusCd?=
 =?iso-8859-1?Q?4yh+5Z8jVl/7o2PHmsvxrs6942ShYiyCm0XE362H7ItUojLzVQRZQ6RgCA?=
 =?iso-8859-1?Q?4otMeYA1Z52KzRgSIQUB7oa4owgw0a3qXcIfRo3EOx7Nu6NKGWkEftaggQ?=
 =?iso-8859-1?Q?3nGZEL/FJE1FVkTOv87AoRifkb/B3SsVoLQms3Z7HJLvDKIjH6dUfRN/BO?=
 =?iso-8859-1?Q?13WM+hq9FagtXyT5IP6cY0wT9xsz5sL0cfmAFks+juogI8WQX5+Dlskv1w?=
 =?iso-8859-1?Q?JzOqREpgHPrV7Z0ApEdCeRV8AXdczLY7dvFwWDq48UsueH4Ocno3ZVdN6n?=
 =?iso-8859-1?Q?oujNbfthWL0JZqIFFuUJcY4lMTySleK6OxS33mtOX63Pdp9JdjAG/vZi3j?=
 =?iso-8859-1?Q?T4TgtrUi0NQ6zkn1ioXOmpj8d1uwG+uhn8wFHT1ZkXTtJ8pUFPgK+04ud+?=
 =?iso-8859-1?Q?tN4ceO1UY1C5GBFB2HwzxVdmCzcY+bUtnhsavm2n03nTPIc/b+diToD8lR?=
 =?iso-8859-1?Q?0Z9wl1NoSmw5EIrZDyCKEEIFEC0tEvZp/T1LqZ7RjY7gBDcY66QFItn8tS?=
 =?iso-8859-1?Q?nhXzbLz0DddAQjErzc3356goXh4mscc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb11185-380d-45e5-6d71-08de5f410e2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 14:16:54.7616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eXyTHCcPWD7VH6VKkGSeBSreu6RGXqtZMSLlGbKRiGD+gCQYLmdeM1xRrI3wNaHAFgV52M/X1xmT6Hqo6YujpvqM5Iq/Yt2RDr+8Dxs7nLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB10078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:Oleksii_Moisieiev@epam.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6EE99B0D51
X-Rspamd-Action: no action

According to the "7.1 Return Codes" section of DEN0028 [1]
INVALID_PARAMETER code (-3) is returned when one of the call
parameters has a non-supported value.
Adding this error code to the common smccc header file.

[1]: https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4c6

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---



 xen/arch/arm/include/asm/smccc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/sm=
ccc.h
index 441b3ab65d..478444fb09 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -381,6 +381,7 @@ void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs =
*args,
                        0x3FFF)
=20
 /* SMCCC error codes */
+#define ARM_SMCCC_INVALID_PARAMETER     (-3)
 #define ARM_SMCCC_NOT_REQUIRED          (-2)
 #define ARM_SMCCC_ERR_UNKNOWN_FUNCTION  (-1)
 #define ARM_SMCCC_NOT_SUPPORTED         (-1)
--=20
2.34.1

