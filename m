Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8504D9872
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 11:11:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290714.493130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU48t-0002Mx-T1; Tue, 15 Mar 2022 10:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290714.493130; Tue, 15 Mar 2022 10:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU48t-0002Kr-PL; Tue, 15 Mar 2022 10:11:03 +0000
Received: by outflank-mailman (input) for mailman id 290714;
 Tue, 15 Mar 2022 10:11:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CG/1=T2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nU48r-0002Kl-NA
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 10:11:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 366b1f1f-a448-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 11:11:00 +0100 (CET)
Received: from DB6P193CA0013.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::23) by
 AM0PR08MB3635.eurprd08.prod.outlook.com (2603:10a6:208:d3::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.25; Tue, 15 Mar 2022 10:10:50 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::72) by DB6P193CA0013.outlook.office365.com
 (2603:10a6:6:29::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Tue, 15 Mar 2022 10:10:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Tue, 15 Mar 2022 10:10:49 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Tue, 15 Mar 2022 10:10:49 +0000
Received: from 010d0aba4a80.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 609CAC82-C630-4B36-AE6D-812487B015CA.1; 
 Tue, 15 Mar 2022 10:10:43 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 010d0aba4a80.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Mar 2022 10:10:43 +0000
Received: from VI1PR08MB3967.eurprd08.prod.outlook.com (2603:10a6:803:df::16)
 by DB9PR08MB7038.eurprd08.prod.outlook.com (2603:10a6:10:2ce::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Tue, 15 Mar
 2022 10:10:41 +0000
Received: from VI1PR08MB3967.eurprd08.prod.outlook.com
 ([fe80::479:b7f8:ba2a:4a74]) by VI1PR08MB3967.eurprd08.prod.outlook.com
 ([fe80::479:b7f8:ba2a:4a74%5]) with mapi id 15.20.5061.029; Tue, 15 Mar 2022
 10:10:41 +0000
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
X-Inumbo-ID: 366b1f1f-a448-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Xd9tJPmVHqwTMr8HrUReVlY39b81yZ3QyHJIENAIsg=;
 b=9q9hMxrxdNvtkYhXgBGS2bglKivEvEWpNW0IQrtIE9v5xcVvNf8hsHJYkWsc9CVuwToGsYnFCpUbliWwSxLoAvg74/4wvmIulZ8k5n7gYj2OdDpT5DAuXquwA4tp00uO/+vmFI430T5600llbJKSWlG4H9XN86Jfh1tdjWXW2Ls=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3bc1c6264e32a537
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTd2Aa8YBLyFGeTeY5uSjv+21EuROhfF120Zlz6i94yVT7Y2s1gPgvllKAH2zViFPhrMek7mUucpDQmryaskLs2OdRig+uIdRdSm3vJzuDL2OE//EYdSRDPeyFrORZ4BADVSd+ERPPRUjPuv+0Wn56Q8XJhisXnFVL9eCQnfznXU/qjG7CnUDEl131de+Brj7qqOqgvuzhFM3QSg6qM36XHWvexZPvFZO6z4gBc1No5NnAd7dPkej9qefi7lqzjnh5oSWKu21Fs8GJL+eaoHoYHufenRe+G1fPrJRgGCQpJRu6c5jKiYQ7eRINOMqtGLaq69ErhQpE2WlfLVwqhayQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Xd9tJPmVHqwTMr8HrUReVlY39b81yZ3QyHJIENAIsg=;
 b=nM9wWA8CVfvYTfsOndxCAGoaHPIt/qH8kF7hhu0upS83fs0hglGjLsCZR4oK3nPt5MJtNqPby8J1wiKup1G/nSLDTqDZHAOoQmWUA8a1WO2AsQRxOAdog5MPXlnk0Oi1d3rzrEQILAPIBDdW878NMOmJUF0QspGOsZwIvSAOSAuMS7jBVY9CdxbvsYX+bSlRx7ZEgVZDbMRaFVTSCmNWnSflXptNhIIZM3IQG8kwhhtjSgrXi1EjN3Q6rEArFP7f8MXoNAjLgBubiJxYP/43xI5Q4QVmCKvGAqP4BIQWrz7SxLQGcmoJ3dFhFjlryt9qS3d+lPruT0NmDcY/T2SNWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Xd9tJPmVHqwTMr8HrUReVlY39b81yZ3QyHJIENAIsg=;
 b=9q9hMxrxdNvtkYhXgBGS2bglKivEvEWpNW0IQrtIE9v5xcVvNf8hsHJYkWsc9CVuwToGsYnFCpUbliWwSxLoAvg74/4wvmIulZ8k5n7gYj2OdDpT5DAuXquwA4tp00uO/+vmFI430T5600llbJKSWlG4H9XN86Jfh1tdjWXW2Ls=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [XEN][RFC PATCH v3 10/14] xen/arm: Implement device tree node
 removal functionalities
Thread-Topic: [XEN][RFC PATCH v3 10/14] xen/arm: Implement device tree node
 removal functionalities
Thread-Index: AQHYMyWCd0PyEjstNUKgDSNIsR/0BKzAQ40A
Date: Tue, 15 Mar 2022 10:10:40 +0000
Message-ID: <D75E31B5-3A23-4CD1-B81F-A792A4B88586@arm.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-11-fnu.vikram@xilinx.com>
In-Reply-To: <20220308194704.14061-11-fnu.vikram@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5e843277-adf1-4a66-d3be-08da066c1491
x-ms-traffictypediagnostic:
	DB9PR08MB7038:EE_|DB5EUR03FT054:EE_|AM0PR08MB3635:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB36352F779713CC26F2B5E270E4109@AM0PR08MB3635.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 k7YKxEx8OquTjKF6nMSSIQaXFPDhY4CaTMWFNTf69c1jB/tzMYMtF+dgm0jIklUCN7MZXJluntf+FLEap8PBeHpCOWE6b497kjepnss1KNsl55xQBXPXtetxQ1K/TcW8xhW5CDs3clfnTJduqwBmrnhUk38XoyX8WGfzrWV5EnnkXOV1f/gx0YTmHlzNYnNDjwJpaCZKGGiJHIcGIG/k0f7ci3xyLP6A+6Tq2snIcajtEcQEoN6vXRYF/3+4avLyu+GOPEBTPZrjvyPwhVhQPNG21Vh8HGgok99SVr2vj0CHEK6KJnD1UxYpja/zekqn/WQ3V/cKaqLgrl0lTbukWlH8uDGD6EyU6qBXLKDvR3Agxpsu8ZwsWuZ0NyGq8L+D7UfoVdmBB8ELuFzYHRuO4cDWnqGlMTVlwY/t7jd0rAIBXwosi9eRO2JAl1hPgnSqXxTC7yxgHnfP6GanZRFkR0xxsuP6VrhJxs1GqhSgYU9MC6uVKC22sWjjJ/rPF5z5rcG58+NkMDU5E4v0kFATMdgAYEHaNhabEpfNee185xSZB+UlkzxhdNcNhz0UOAVrpaITDyOmrZKP3sJVhIGTP9WJYRw1HysBMPRL2yS0DQLGL3ScW3Gya1SXUQxF5rSnmJrCrtzAcJhQDy7CcJkEYON9HlhRzZplwAk40Izvs+CL2+yBPCm1qq7tBZaocuZlT4GOkf0GQJM/AjZUpGPdkRl9e7lzmvqwQCGtdH15Y9bqeuU0A8/gWNBcxogp+Ux+X7aGY8MQ28tqQK85bGfQgZbjzW4vyq32qhNc2TCigP4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3967.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(54906003)(316002)(36756003)(71200400001)(6512007)(6916009)(2906002)(6506007)(186003)(26005)(2616005)(8676002)(38100700002)(64756008)(66476007)(66556008)(91956017)(76116006)(66946007)(66446008)(86362001)(8936002)(38070700005)(33656002)(4326008)(5660300002)(508600001)(122000001)(6486002)(403724002)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <88BC69CD595E4841998F0FD9B05BD690@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7038
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef56161a-ebc5-4969-a7b5-08da066c0f73
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Owsc2eJgQ2cihPvLLJ789B/LBu0v0B1LJ5nAmAv0LukoBsK55yQx/5LWZZsbBeJfQjFlkiC3yV5F9qCTSubJgejrI1l4YsQc7vMaFVMchy/z2VWt0vvhYf908Pq/nw8DwapOgBXGmdYtcOhiVDi/Z80SeHrxunHC0vEM/rY9aKJHc9Fk/UBovsJEZp5H3knl6hobqNZlRzYnLX1DTWvMdM4QRx6FwaydfSTmtS7EmuXctcSEjA5pKVHzjdi0I1cyVi575TLvhlqYVRoHyVt4LiollXL8jioi8Q1zXiT1GaUNl48x8P55R2qWTebDBFWf7GbidSK2BWr8e7nRMOMLRk7pQ1+259nyUFolaPiTXQUGGPkpWxljmaMjVIQBPr974GrISriXxViCZHiFK+mgQMn9Al1BG6dTP4tFh74zb2Rzi4Y9SPPtsh/Hzz9LfCuQeC0BOAasaqJp1drEM7PbRS2QiE1dUCjpsAnCZ7nWc7FZu3fJfU7u200HxaB9QGNm9Jrx297u18hJQJ04xc91GldR0AAVBSjaDQuwC4nJgw2NC9rQS/Me48AHAh5mYY9dezyJdC67a9PE1kvFUSvxVmuzBezSThnoIjwptr/cg76xuEJCT8fz7Efc3Mp+JQmWA7NtME8et8xFv+dnmrVTKdjsc9gr0tHmK3lKRBzLqwabLoKpzLItbVHyCePlGZVXG730ZLeHoQA4IuhgE15+FdB2/yWB8bILAQrlxmxwMkg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6486002)(36860700001)(336012)(5660300002)(54906003)(316002)(26005)(8676002)(70206006)(70586007)(4326008)(86362001)(6862004)(186003)(2616005)(8936002)(47076005)(6506007)(81166007)(356005)(33656002)(36756003)(2906002)(40460700003)(83380400001)(6512007)(82310400004)(508600001)(403724002)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 10:10:49.7587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e843277-adf1-4a66-d3be-08da066c1491
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3635

>=20
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index dc8d3a13f5..2eb5734f8e 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -54,6 +54,7 @@ obj-y +=3D wait.o
> obj-bin-y +=3D warning.init.o
> obj-$(CONFIG_XENOPROF) +=3D xenoprof.o
> obj-y +=3D xmalloc_tlsf.o
> +obj-$(CONFIG_OVERLAY_DTB) +=3D dt_overlay.o

I think the entries are in alphabetical order, this should be added after +=
=3D domain.o

> +/*
> + * overlay_get_nodes_info will get the all node's full name with path. T=
his is
> + * useful when checking node for duplication i.e. dtbo tries to add node=
s which
> + * already exists in device tree.
> + */
> +static int overlay_get_nodes_info(const void *fdto, char ***nodes_full_p=
ath,
> +                                  unsigned int num_overlay_nodes)
> +{
> +    int fragment;
> +    unsigned int node_num =3D 0;
> +
> +    *nodes_full_path =3D xmalloc_bytes(num_overlay_nodes * sizeof(char *=
));

Here you can use xzalloc_bytes and...

> +
> +    if ( *nodes_full_path =3D=3D NULL )
> +        return -ENOMEM;
> +    memset(*nodes_full_path, 0x0, num_overlay_nodes * sizeof(char *));

Get rid of this memset

> +
> +/* Remove nodes from dt_host. */
> +static int remove_nodes(char **full_dt_node_path, int **nodes_irq,
> +                        int *node_num_irq, unsigned int num_nodes)
> +{
> +    struct domain *d =3D hardware_domain;
> +    int rc =3D 0;
> +    struct dt_device_node *overlay_node;
> +    unsigned int naddr;
> +    unsigned int i, j, nirq;
> +    u64 addr, size;
> +    domid_t domid =3D 0;
> +
> +    for ( j =3D 0; j < num_nodes; j++ )
> +    {
> +        dt_dprintk("Finding node %s in the dt_host\n", full_dt_node_path=
[j]);
> +
> +        overlay_node =3D dt_find_node_by_path(full_dt_node_path[j]);
> +
> +        if ( overlay_node =3D=3D NULL )
> +        {
> +            printk(XENLOG_ERR "Device %s is not present in the tree. Rem=
oving nodes failed\n",
> +                   full_dt_node_path[j]);
> +            return -EINVAL;
> +        }
> +
> +        domid =3D dt_device_used_by(overlay_node);
> +
> +        dt_dprintk("Checking if node %s is used by any domain\n",
> +                   full_dt_node_path[j]);
> +
> +        /* Remove the node iff it's assigned to domain 0 or domain io. *=
/
> +        if ( domid !=3D 0 && domid !=3D DOMID_IO )
> +        {
> +            printk(XENLOG_ERR "Device %s as it is being used by domain %=
d. Removing nodes failed\n",
> +                   full_dt_node_path[j], domid);
> +            return -EINVAL;
> +        }
> +
> +        dt_dprintk("Removing node: %s\n", full_dt_node_path[j]);
> +
> +        nirq =3D node_num_irq[j];
> +
> +        /* Remove IRQ permission */
> +        for ( i =3D 0; i < nirq; i++ )
> +        {
> +            rc =3D nodes_irq[j][i];
> +            /*
> +             * TODO: We don't handle shared IRQs for now. So, it is assu=
med that
> +             * the IRQs was not shared with another domain.
> +             */
> +            rc =3D irq_deny_access(d, rc);
> +            if ( rc )
> +            {
> +                printk(XENLOG_ERR "unable to revoke access for irq %u fo=
r %s\n",
> +                       i, dt_node_full_name(overlay_node));
> +                return rc;
> +            }
> +        }
> +
> +        rc =3D iommu_remove_dt_device(overlay_node);
> +        if ( rc !=3D 0 && rc !=3D -ENXIO )
> +            return rc;
> +
> +        naddr =3D dt_number_of_address(overlay_node);
> +
> +        /* Remove mmio access. */
> +        for ( i =3D 0; i < naddr; i++ )
> +        {
> +            rc =3D dt_device_get_address(overlay_node, i, &addr, &size);
> +            if ( rc )
> +            {
> +                printk(XENLOG_ERR "Unable to retrieve address %u for %s\=
n",
> +                       i, dt_node_full_name(overlay_node));
> +                return rc;
> +            }
> +
> +            rc =3D iomem_deny_access(d, paddr_to_pfn(addr),
> +                                   paddr_to_pfn(PAGE_ALIGN(addr + size -=
 1)));
> +            if ( rc )
> +            {
> +                printk(XENLOG_ERR "Unable to remove dom%d access to"
> +                        " 0x%"PRIx64" - 0x%"PRIx64"\n",
> +                        d->domain_id,
> +                        addr & PAGE_MASK, PAGE_ALIGN(addr + size) - 1);

NIT: here in each line under XENLOG_ERR, there is an extra space, these lin=
es
Could be aligned to XENLOG_ERR, just for code style purpose.

> +                return rc;
> +            }
> +        }
> +
> +        rc =3D dt_overlay_remove_node(overlay_node);
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    return rc;
> +}
> +
>=20
> +long dt_sysctl(struct xen_sysctl *op)
> +{
> +    long ret =3D 0;
> +    void *overlay_fdt;
> +    char **nodes_full_path =3D NULL;
> +    unsigned int num_overlay_nodes =3D 0;
> +
> +    if ( op->u.dt_overlay.overlay_fdt_size <=3D 0 )
> +        return -EINVAL;
> +
> +    overlay_fdt =3D xmalloc_bytes(op->u.dt_overlay.overlay_fdt_size);
> +
> +    if ( overlay_fdt =3D=3D NULL )
> +        return -ENOMEM;
> +
> +    ret =3D copy_from_guest(overlay_fdt, op->u.dt_overlay.overlay_fdt,
> +                         op->u.dt_overlay.overlay_fdt_size);
> +    if ( ret )
> +    {
> +        gprintk(XENLOG_ERR, "copy from guest failed\n");
> +        xfree(overlay_fdt);
> +
> +        return -EFAULT;
> +    }
> +
> +    switch ( op->u.dt_overlay.overlay_op )
> +    {
> +    case XEN_SYSCTL_DT_OVERLAY_REMOVE:
> +        ret =3D check_overlay_fdt(overlay_fdt,
> +                                op->u.dt_overlay.overlay_fdt_size);
> +        if ( ret )
> +        {
> +            ret =3D -EFAULT;
> +            break;
> +        }
> +
> +        num_overlay_nodes =3D overlay_node_count(overlay_fdt);
> +        if ( num_overlay_nodes =3D=3D 0 )
> +        {
> +            ret =3D -ENOMEM;
> +            break;
> +        }
> +
> +        ret =3D overlay_get_nodes_info(overlay_fdt, &nodes_full_path,
> +                                     num_overlay_nodes);
> +        if ( ret )
> +             break;
> +
> +        ret =3D handle_remove_overlay_nodes(nodes_full_path,
> +                                          num_overlay_nodes);
> +        break;
> +
> +    default:
> +        break;
> +    }
> +
> +    if ( nodes_full_path !=3D NULL )
> +    {
> +        int I;

unsigned int

> +        for ( i =3D 0; i < num_overlay_nodes && nodes_full_path[i] !=3D =
NULL; i++ )
> +        {
> +            xfree(nodes_full_path[i]);
> +        }
> +        xfree(nodes_full_path);
> +    }
> +
> +    return ret;
> +}
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index fc4a0b31d6..d685c07159 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -29,6 +29,10 @@
> #include <xen/livepatch.h>
> #include <xen/coverage.h>
>=20
> +#ifdef CONFIG_OVERLAY_DTB
> +#include <xen/dt_overlay.h>
> +#endif

Maybe this header can be included anyway, removing ifdefs, and...

> +
> long cf_check do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
> {
>     long ret =3D 0;
> @@ -482,6 +486,12 @@ long cf_check do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_s=
ysctl_t) u_sysctl)
>             copyback =3D 1;
>         break;
>=20
> +#ifdef CONFIG_OVERLAY_DTB
> +    case XEN_SYSCTL_overlay:
> +        ret =3D dt_sysctl(op);
> +        break;
> +#endif

Also here you can remove ifdefs and use the header to switch between the re=
al implementation
or a static inline returning error if CONFIG_OVERLAY_DTB is not enabled, ta=
ke a look in
livepatch_op(struct xen_sysctl_livepatch_op *op).

dt_sysctl can take struct xen_sysctl_dt_overlay* as input.

> +
>     default:
>         ret =3D arch_do_sysctl(op, u_sysctl);
>         copyback =3D 0;
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index 55252e97f2..e256aeb7c6 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1069,6 +1069,22 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cp=
u_policy_t;
> DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
> #endif
>=20
> +#define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
> +
> +/*
> + * XEN_SYSCTL_dt_overlay
> + * Performs addition/removal of device tree nodes under parent node usin=
g dtbo.
> + * This does in three steps:
> + *  - Adds/Removes the nodes from dt_host.
> + *  - Adds/Removes IRQ permission for the nodes.
> + *  - Adds/Removes MMIO accesses.
> + */
> +struct xen_sysctl_dt_overlay {
> +    XEN_GUEST_HANDLE_64(void) overlay_fdt;
> +    uint32_t overlay_fdt_size;  /* Overlay dtb size. */
> +    uint8_t overlay_op; /* Add or remove. */
> +};
> +
> struct xen_sysctl {
>     uint32_t cmd;
> #define XEN_SYSCTL_readconsole                    1
> @@ -1099,6 +1115,7 @@ struct xen_sysctl {
> #define XEN_SYSCTL_livepatch_op                  27
> /* #define XEN_SYSCTL_set_parameter              28 */
> #define XEN_SYSCTL_get_cpu_policy                29
> +#define XEN_SYSCTL_dt_overlay                    30
>     uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
>     union {
>         struct xen_sysctl_readconsole       readconsole;
> @@ -1129,6 +1146,7 @@ struct xen_sysctl {
> #if defined(__i386__) || defined(__x86_64__)
>         struct xen_sysctl_cpu_policy        cpu_policy;
> #endif
> +        struct xen_sysctl_dt_overlay        dt_overlay;

Here I would need an opinion from someone more experienced, but I think whe=
n a change
is made in this structure, XEN_SYSCTL_INTERFACE_VERSION should be bumped?

>         uint8_t                             pad[128];
>     } u;
> };
> diff --git a/xen/include/xen/dt_overlay.h b/xen/include/xen/dt_overlay.h
> new file mode 100644
> index 0000000000..525818b77c
> --- /dev/null
> +++ b/xen/include/xen/dt_overlay.h
> @@ -0,0 +1,47 @@
> +/*
> + * xen/common/dt_overlay.c

Typo: dt_overlay.h

> + *
> + * Device tree overlay suppoert in Xen.

Typo: support

> + *
> + * Copyright (c) 2021 Xilinx Inc.
> + * Written by Vikram Garhwal <fnu.vikram@xilinx.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms and conditions of the GNU General Public
> + * License, version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +#ifndef __XEN_DT_SYSCTL_H__
> +#define __XEN_DT_SYSCTL_H__
> +
> +#include <xen/list.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/device_tree.h>
> +#include <public/sysctl.h>

In case you decide to pass struct xen_sysctl_dt_overlay to dt_sysctl, you c=
an remove
#include <public/sysctl.h> and use a forward declaration to struct xen_sysc=
tl_dt_overlay
instead.

> +
> +/*
> + * overlay_node_track describes information about added nodes through dt=
bo.
> + * @entry: List pointer.
> + * @dt_host_new: Pointer to the updated dt_host_new unflattened 'updated=
 fdt'.
> + * @fdt: Stores the fdt.
> + * @nodes_fullname: Stores the full name of nodes.
> + * @nodes_irq: Stores the IRQ added from overlay dtb.
> + * @node_num_irq: Stores num of IRQ for each node in overlay dtb.
> + * @num_nodes: Stores total number of nodes in overlay dtb.
> + */
> +struct overlay_track {
> +    struct list_head entry;
> +    struct dt_device_node *dt_host_new;
> +    void *fdt;
> +    char **nodes_fullname;
> +    int **nodes_irq;
> +    int *node_num_irq;
> +    unsigned int num_nodes;
> +};
> +
> +long dt_sysctl(struct xen_sysctl *op);
> +#endif
>=20


