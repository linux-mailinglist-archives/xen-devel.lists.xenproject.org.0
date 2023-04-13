Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC47B6E0CFD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 13:47:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520651.808470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmvQB-0001dF-Id; Thu, 13 Apr 2023 11:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520651.808470; Thu, 13 Apr 2023 11:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmvQB-0001aj-Fe; Thu, 13 Apr 2023 11:47:23 +0000
Received: by outflank-mailman (input) for mailman id 520651;
 Thu, 13 Apr 2023 11:47:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vvgu=AE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmvQ9-0001ad-RI
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 11:47:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f18e9345-d9f0-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 13:47:19 +0200 (CEST)
Received: from DU2PR04CA0309.eurprd04.prod.outlook.com (2603:10a6:10:2b5::14)
 by DB9PR08MB7472.eurprd08.prod.outlook.com (2603:10a6:10:36c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 11:47:16 +0000
Received: from DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::a7) by DU2PR04CA0309.outlook.office365.com
 (2603:10a6:10:2b5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.31 via Frontend
 Transport; Thu, 13 Apr 2023 11:47:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT055.mail.protection.outlook.com (100.127.142.171) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30 via Frontend Transport; Thu, 13 Apr 2023 11:47:15 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Thu, 13 Apr 2023 11:47:15 +0000
Received: from b0881e927402.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4EF8F059-50DC-4055-81F9-3256CD8EDB95.1; 
 Thu, 13 Apr 2023 11:47:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b0881e927402.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 11:47:09 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS4PR08MB8047.eurprd08.prod.outlook.com (2603:10a6:20b:587::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 11:46:59 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 11:46:59 +0000
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
X-Inumbo-ID: f18e9345-d9f0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kldRuhPLful5lckP+1pa4Nka1yK3wWVImOAu6JXy/wo=;
 b=cFTqr8UH4rcUVKFLHT/+FuL2Bp8UvLA/daG8hLIHfcGM9MBEUhVSMHcy2Am/bZhYON/13upX9T0V5GqQNyTPwtEpzsuZ5mnCNAHKVZFk0cF+A3iIT+bbOhaDed2cmPFiFTf1hHIMRf37RpAgfnoQoxST17PHkKXA1Tk6JXnXfLg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQb0TfzET0VtJ8ScGdEmGsWv+lDOmcRoQPy+dK68L3PXRLFNn+3cpYBHTxha4YrliRhSu3lhKaW+GsRJfaNj51+CJndWdzsV+jTjFUr8p9Fe0MmX8tkf1AUicgDAGy+Mcwu3mkM3GtvX9lcnjkAjrVahpgZtxpZTK2KWeFCqB9ARuCsbn4MZsf7uMDHK+Pp8j9n9IYHceYrsI9SmjMQYGBXP3VFIIFSvIoSfhzWpNKDIpmK6/HMXu4OeD4a7gEnfWJ6FKgeMGIkiI7qcJjMBpM+e6qk5cnvmfog5bpwTi9MeV0SE0JLJCc6FPK1pSgMitZVGGYUddVMuS/WqvAWpOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kldRuhPLful5lckP+1pa4Nka1yK3wWVImOAu6JXy/wo=;
 b=DaNo9raLfPmNnsNDNC5oFJzNEx/QveKHZxq/UE64F6dBSjBkTB8NVb6cqfpIZntabrZNz8M6ZJ3C+F5P9FdUUtzBjHD8EoIx0203Y95WopmehztIAUUlBZ+k6h77w7eANGwVpMq161pt+H3gUB58ZTLGLDMTuX0LucEUoDADXrfNvhFK2AmmgLVI4cbvu6VAGnuQmSz7qN+O1SXoRj4Nql+fs5HUY9ffKC2AUHx5JJigjreveoW0nhnaNT+j0Z3TNISyJoXvwhrYppS2cvkrMMPtJOLLQI7aE+vpRGmMW+zBKioWT1VdGMVVNYpL/dF6ida/sR7xJhfmMGpceD5+kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kldRuhPLful5lckP+1pa4Nka1yK3wWVImOAu6JXy/wo=;
 b=cFTqr8UH4rcUVKFLHT/+FuL2Bp8UvLA/daG8hLIHfcGM9MBEUhVSMHcy2Am/bZhYON/13upX9T0V5GqQNyTPwtEpzsuZ5mnCNAHKVZFk0cF+A3iIT+bbOhaDed2cmPFiFTf1hHIMRf37RpAgfnoQoxST17PHkKXA1Tk6JXnXfLg=
From: Henry Wang <Henry.Wang@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN PATCH v8 15/22] xen/arm: ffa: add defines for sharing memory
Thread-Topic: [XEN PATCH v8 15/22] xen/arm: ffa: add defines for sharing
 memory
Thread-Index: AQHZbdhXhHRhSefTr0SCWhhFgt3t1K8pG5rg
Date: Thu, 13 Apr 2023 11:46:59 +0000
Message-ID:
 <AS8PR08MB799188B36D51EF5BB367590D92989@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-16-jens.wiklander@linaro.org>
In-Reply-To: <20230413071424.3273490-16-jens.wiklander@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EC8D0DEB56B5594F85B83D6046A37D1A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS4PR08MB8047:EE_|DBAEUR03FT055:EE_|DB9PR08MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: b934e56e-f009-4b3e-cdb0-08db3c14d3bf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FzrkwmufMJXB/sKU2IXKfCzBdVUpdqFXsLnwoLPwYWCy4LJoYnlI8jOJ0NrF+bjlGrxDfgPVt3dC6wTPeG78VXM1weQxTBpO3sOC7YfABYSoD7505YQ53/yMhXaw3++2sCgKHrUyAkoQuc5okcCMkDyOFONE7r10eKRpGKs3tLeJBZwgIxGj0JamYHTTcG/aLak6zqnvbjehGy+m0lyXUodzaKX7zdB3RQhV04RS/xJ2EUeKFnsfJtbC7WLwV8eEn9TvbZhRVXIz1YpOM7tNwWlNin3tEhY8cKbO4eZt1zSy672PSN0tsO/ROfEkUqh4pGi/2zBNDM3qUKRtv0F0gxETIZ76QS2PiVYnHf2D305Tw5rj5gQsq9ptjt/fsjk1itVa4F7A2kVaVTvXOVTGg+4NjUdaD4PRvTETbgbFvZuJwnEfMdWT7L8rrPWT73azltHNPb6YUIp7V7RsToNOfjQwdgnv8wGcoweTXIWBtrk0Cmc8KH0GVg7l0R25qvJX8QmVJ4oywwyenAa6XDm0NqAgrp441im9Zozc2vst+NMk/ESFHBF/+ocI2j7ube0XcD7+1baoZYgq21iudaZzzVV8Osl5A2UuV87HtF/bsi6Qpv6OMD7mVG35/yfF9/eI
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(8676002)(8936002)(76116006)(41300700001)(5660300002)(52536014)(66446008)(66476007)(66556008)(66946007)(64756008)(122000001)(4326008)(316002)(2906002)(478600001)(54906003)(110136005)(86362001)(38070700005)(38100700002)(7696005)(186003)(9686003)(6506007)(55016003)(71200400001)(83380400001)(26005)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8047
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8570bbb7-4713-400c-6319-08db3c14ca6a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mmvWpRSnCggVWBxggvOukhv/EL2tSWDlsCH4xvRit/Pqqkzvj35gphYWrkx4ndQYzcWtSfk8NVwHcFwBT5DmkDhD9QHFb+nLO7GgGdgprKdyYLr6uurYMHJE9KOERPdU/LSuxplWciH4PLhPt6DtmcUyU6OgqrQagTgn+PxIQwvx/CJ7Pci7hd46dp9p2++QaH6P+ylyDlx2f/C45KOn/Ou3dllZli2CgbeE2rNSsP9UgEtVJLFiewvy0Wc+jCt5c7/GU+EDB+XprDVJ6AD/K2MC8krshkZkjqtuSNNw+3fRiBc2idEsfurzf8gAmTRRTf0sX6uEbCxPSGSTRNPDGUZWV61RTF0p5hlgUxHy7FipWXaSBhU3ceacdoH3KJBfkuANZJObr2SEPBqCOd5Gyz9uBNfwLDNhsxuMfDrzoT6WcLartcicohu7UE1XVD+g2jMyyfdsgmVka0H8AIkQcKW4y2Hc5iOszquzfax8JbuAYTrn0l0C8rbu9xbBnIJ8EFxXk29ueyD3VplSQ+1PfLZU9c6Gkm1thwrSioLqah9+mfGVpO/Ozj1sHd2xt9+Tpp4sygv/1MZBMGErR+RxxKoEONg/zM1V7jHVhjajOxH52PwWnAjpedg1uLDNV6Jq7jPvR23QmeVXb0MdPjw+nbDUlw0U110XA3+O2r5kQfJLtS36iBzqfvYUs5YDkaqkg4NUqe5BO1DTOhDusCirMw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199021)(46966006)(40470700004)(36840700001)(36860700001)(5660300002)(41300700001)(33656002)(82740400003)(40460700003)(2906002)(52536014)(55016003)(8676002)(86362001)(40480700001)(356005)(4326008)(8936002)(70586007)(70206006)(81166007)(82310400005)(316002)(83380400001)(336012)(47076005)(6506007)(54906003)(110136005)(26005)(9686003)(186003)(7696005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 11:47:15.2632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b934e56e-f009-4b3e-cdb0-08db3c14d3bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7472

Hi Jens,

> -----Original Message-----
> Subject: [XEN PATCH v8 15/22] xen/arm: ffa: add defines for sharing memor=
y
>=20
> Adds defines needed for sharing using the function FFA_MEM_SHARE and
> friends.

Same as my comments in previous patches, I would suggest to also mention
the references in commit message.

>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  xen/arch/arm/tee/ffa.c | 60
> ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>=20
> + * FF-A doesn't have any direct requirments on GlobalPlatform or vice

Typo: s/requirements/requirements/

> + * versa, but an implementation can very well use FF-A in order to provi=
de
> + * a GlobalPlatform interface on top.
> + *
> + * Global Platform specification for TEE requires that any TEE
> + * implementation should allow to share buffers with size of at least
> + * 512KB, defined in TEEC-1.0C page 24, Table 4-1,
> + * TEEC_CONFIG_SHAREDMEM_MAX_SIZE.
> + * Due to align issue mentioned above, we need to increase this

s/align issue/alignment issue/ ?

> + * value with one.
> + */
> +#define FFA_MAX_SHM_PAGE_COUNT          (SZ_512K / FFA_PAGE_SIZE + 1)
> +
> +/*
> + * Limits the number of shared buffers that guest can have at once. This
> + * is to prevent case, when guests tricks XEN into exhausting its own

Typo: s/tricks/trick/

> + * memory by allocating many small buffers. This value has been chosen
> + * arbitrary.

Typo: s/ arbitrary/arbitrarily/

> + */
> +#define FFA_MAX_SHM_COUNT               32
> +
> +/* FF-A-1.1-REL0 section 10.9.2 Memory region handle, page 167 */
> +#define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
> +#define FFA_HANDLE_INVALID              0xffffffffffffffffULL
> +
> +/*
> + * Memory attributes: Normal memory, Write-Back cacheable, Inner
> shareable
> + * Defined in FF-A-1.1-REL0 Table 10.18 at page 175.
> + */
> +#define FFA_NORMAL_MEM_REG_ATTR         0x2fU
> +/*
> + * Memory access permissions: Read-write
> + * Defined in FF-A-1.1-REL0 Table 10.15 at page 168.
> + */
> +#define FFA_MEM_ACC_RW                  0x2U
> +
> +/* FF-A-1.1-REL0 section 10.11.4 Flags usage, page 184-187 */
> +/* Clear memory before mapping in receiver */
> +#define FFA_MEMORY_REGION_FLAG_CLEAR            BIT(0, U)
> +/* Relayer may time slice this operation */
> +#define FFA_MEMORY_REGION_FLAG_TIME_SLICE       BIT(1, U)
> +/* Clear memory after receiver relinquishes it */
> +#define FFA_MEMORY_REGION_FLAG_CLEAR_RELINQUISH BIT(2, U)
> +/* Share memory transaction */
> +#define FFA_MEMORY_REGION_TRANSACTION_TYPE_SHARE (1U << 3)
> +

I confirm the values introduced in this patch are consistent with in-code
comments on top of them. Thanks for the pointer :)

With the typos corrected:
Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


>  /*
>   * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
>   * BIT(31): Framework or partition message
> --
> 2.34.1
>=20


