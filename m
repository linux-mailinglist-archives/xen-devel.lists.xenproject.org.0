Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 852884B5861
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 18:22:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272572.467471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJf2S-0003R0-3D; Mon, 14 Feb 2022 17:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272572.467471; Mon, 14 Feb 2022 17:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJf2R-0003P6-Vb; Mon, 14 Feb 2022 17:21:23 +0000
Received: by outflank-mailman (input) for mailman id 272572;
 Mon, 14 Feb 2022 17:21:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2GqZ=S5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nJf2Q-0003P0-NT
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 17:21:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8720b23c-8dba-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 18:21:21 +0100 (CET)
Received: from AM6PR0202CA0068.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::45) by DB7PR08MB3564.eurprd08.prod.outlook.com
 (2603:10a6:10:4f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 17:21:09 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::66) by AM6PR0202CA0068.outlook.office365.com
 (2603:10a6:20b:3a::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18 via Frontend
 Transport; Mon, 14 Feb 2022 17:21:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 17:21:08 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Mon, 14 Feb 2022 17:21:08 +0000
Received: from 755a325212aa.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 793AE71C-781D-4887-BA9D-504BA0BB2216.1; 
 Mon, 14 Feb 2022 17:20:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 755a325212aa.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Feb 2022 17:20:57 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by AM9PR08MB6179.eurprd08.prod.outlook.com
 (2603:10a6:20b:2da::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 17:20:51 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e%9]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 17:20:50 +0000
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
X-Inumbo-ID: 8720b23c-8dba-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6ZTdptpjxbueCCMPaeWDSOHT05I9wowCjQfbNjENNY=;
 b=kKdGHFr6y+gZBuu8TRYGlgDVOSPY/zQy4Bq96r95gVbGpvwabXtky1r5yBJ0oozXoZpck1cdlZVGgtysCJ75nmz1PnB80xF/HIGcRGicDcdkTvxogP2jh3ZcxD7K5JRqvU6cxKhye8f0+MiARK1yECXwOXPug6rkzHS1MyXt4yA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 888d03b1199be590
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvBSVbByvZnadRpd3yDhNFARwOZy/XbG/RcabkZvzIGqNac+agLOulBgEEM1dy2GWckFecDqP7/ZVekpMZnrJ7Z8Cgh8CGCs0EjhT4e5gWEWe8qOxKpf/Rxiymgpa13oM/K54V/FfsrPId7YncI+qx0TLtCc0KXeANpH5AyLgKKE8wcoYXZOtipKW8Y9K/GDw17JtxiVm2HTW7Z7yibzMslwp5+yUjYejFiLmEkVTU1Z6L9ejgiKaVECWo0mRMG+1LhSnGPTfC9xJaj17c5F+YZ+7+BYvGFw8/XecnZs4NT+YRXHK81CSS7klvxjE1GkXF9abUzllJ+IHU86hpJxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6ZTdptpjxbueCCMPaeWDSOHT05I9wowCjQfbNjENNY=;
 b=GLJzNU2qziNpg++c37XAnSvmGI0BwIaxWm0GWl+vkQqFiKERjR+ETwcZ9GyTkcWsOTSGvflJ6Tw12KSf+WaT25n1XCT4hYbIJuRur2UbazBl15PiEPWSI2BKRjUDspkiGDm6+3XLxCbHblRTB78NCxTTvAo7XyzGibtlfDcj8ruUNzzAs8fUVRuilbgYWV8mXmbn7LcyjqufeOLO86MQwUaj4DsfGlbekaebBZ2CffIhMKr8VGaEf6yG09y+oef9O2HdYKWZAVxd6o+NJJvIYTZQrZgPM2LqTrGAPyOY5h7LVnX+PFMkR8KU/B+qCpUqlze4gu/gKV0BuLMm28YneA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6ZTdptpjxbueCCMPaeWDSOHT05I9wowCjQfbNjENNY=;
 b=kKdGHFr6y+gZBuu8TRYGlgDVOSPY/zQy4Bq96r95gVbGpvwabXtky1r5yBJ0oozXoZpck1cdlZVGgtysCJ75nmz1PnB80xF/HIGcRGicDcdkTvxogP2jh3ZcxD7K5JRqvU6cxKhye8f0+MiARK1yECXwOXPug6rkzHS1MyXt4yA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [RFC PATCH] arm/vgic-v3: provide custom callbacks for
 pend_lpi_tree radix tree
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <9eb5072b-6c55-7df1-75a3-c96594d64277@xen.org>
Date: Mon, 14 Feb 2022 17:20:46 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <54B5A035-086E-4912-B12F-AB3F7BF56164@arm.com>
References: <20220211150042.11972-1-luca.fancellu@arm.com>
 <81a2f978-9337-2e58-c8b2-86dc7defc2ec@xen.org>
 <1A16E009-F34C-4C6B-ABF6-FC08E395EABE@arm.com>
 <9eb5072b-6c55-7df1-75a3-c96594d64277@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-ClientProxiedBy: LO2P265CA0405.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::33) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 2c86073c-3374-4ab6-abf9-08d9efde63cc
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB6179:EE_|VE1EUR03FT021:EE_|DB7PR08MB3564:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB356425172F5B5764CC12B712E4339@DB7PR08MB3564.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dpo69Cg+2luy+5zS4yzR6onZ7Kz9P0HC/Etuj0+k2sEk9YXzpCYJD44/h8ZLH8epSwGJEs3LwLtuPj3ytDnFCcY05f0HWMFQ6fM3oHu42vd+wTj/SNUMwXMutc+BqyRa4CoOkBmWSKCIeQy9OW5aXtheZItCyuKzdDViy5qlgiYcmFOX1mgFZOuEMA57JHC1yd+bMskLjguICQDQ8J/qQx6RczTuXSWfzIGNaJhULI3L0R3xNARZxQDNXfBzU9L3bFd2kMrPLpa0QJQ3b3y8GXbWtNXP3DwsOzp4F6rafACHE4srO96I9IWeyMAGYu7SoSloEqpHF+8V+H/7GNqdVcqp8KJdjw2rlFUQvqJza1WQhNSgghunbmi/WlxlkPl7f3U3JvBR4Adr/Gbtic9cly2397a7g9QsNudsE5K9U3iUHjaN3j79ykEbLbVvPULjETukPUZ/oEyPVkeESXxiCYryjvkswk/YmM2K4MhcJ09+IU3T9N6ph+Uey/6dqa+5S0D6/ykbW4lFUDZvM6YYHCda+dCIcpDnnEnqvW11N3JrhULd3bpOMB+3bPi3UQxiGyI3ixC/HI0ebt9rkx0Hc+6RIuD6+hCKk/MgtAWbFc1Nsr/iQeBveWyXSobM1rXnwGdXpa/YiM8miRHnx1OAOUUeTXTkcKzclM6zCW7WHSsu2rUEQB63uSAap0+0uqlodloVVYlG2A2zSx3uaE0y0ao/EWGD84N7m4z1Te0S9aE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(66476007)(54906003)(6916009)(83380400001)(66556008)(36756003)(33656002)(8676002)(5660300002)(2906002)(66946007)(2616005)(38100700002)(38350700002)(6506007)(186003)(26005)(8936002)(44832011)(86362001)(6486002)(6666004)(4326008)(6512007)(52116002)(53546011)(508600001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6179
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dbb3ead0-807b-461d-bcfb-08d9efde5923
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J2tZQwy3q4WD/YJ0oBTwYigPVxXDyGrSeA+ec3B2eIXUt3f2pA1P2KOLUCuS25U4RjSoqORD7fhQf9VmUoFvhvhW+31jDxruO3uwCS3cGqerNPSd6GPOSVpUu5DL+hfskTRjGw+sazZwl086e0d1P+MMKYT45ikHkC70T+k6YMLLpdpud5rHqQbhkLU8QkNW+V9NhSCjKZlEfhZ5dR0bsckqMhe13nhyIM0Xz1tVRhLrCe49UsTRhCq+8JddhZUtOkveQ8QJNOY7igOeCMMFR6HTAp9hYsYK+JPGJKYiCqBYv8u6Y8dd9G9kq90+WAGsIhb93A76QbCs9pilYAOxzRCRzjznWKFCuoPg2JkEYpKlAMCtdlyoTfIIBQBGX1yAHVYxy9eL0GG5AXQRDFM2Cwgs7wgvDrQFvj2g4UTePsOfOj8lk0Y3/yH/A4hFUAxCTTvYO0YLdDHo8hkqRHh861I3f3txatSmLt1axerZ9nrx7mO/1HOSkX0VsBKvaUazPkNEZVgat4m3eoQBtn6Bs+a9xl4LOI1lQoUp2LlawX/+jgYa6yzynnDMmBS/a/BGVZi5b4JgfCcWYtrL/6ynTSHICuIK2MxPL8oa9NT11o7Smlrd8tA+B7CyQGCbMkkcFEuVG7OebHIc7Cdbinq4kVkCDfXcQrJrnKjLIPohoMzX6i61+iXa5I7u3t67YTx2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(47076005)(2616005)(83380400001)(36756003)(508600001)(336012)(86362001)(6486002)(36860700001)(2906002)(40460700003)(33656002)(54906003)(6666004)(316002)(53546011)(6506007)(5660300002)(6862004)(356005)(8676002)(186003)(81166007)(6512007)(4326008)(82310400004)(70206006)(44832011)(26005)(8936002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 17:21:08.4733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c86073c-3374-4ab6-abf9-08d9efde63cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3564



> On 11 Feb 2022, at 16:12, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 11/02/2022 15:45, Luca Fancellu wrote:
>>> On 11 Feb 2022, at 15:26, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Luca,
>>>=20
>>> On 11/02/2022 15:00, Luca Fancellu wrote:
>>>> pend_lpi_tree is a radix tree used to store pending irqs, the tree is
>>>> protected by a lock for read/write operations.
>>>> Currently the radix tree default function to free items uses the
>>>> RCU mechanism, calling call_rcu and deferring the operation.
>>>> However every access to the structure is protected by the lock so we
>>>> can avoid using the default free function that, by using RCU,
>>>> increases memory usage and impacts the predictability of the system.
>>>=20
>>> I understand goal but looking at the implementation of vgic_v3_lpi_to_p=
ending() (Copied below for convenience). We would release the lock as soon =
as the look-up finish, yet the element is returned.
>>>=20
>>> static struct pending_irq *vgic_v3_lpi_to_pending(struct domain *d,
>>>                                                  unsigned int lpi)
>>> {
>>>    struct pending_irq *pirq;
>>>=20
>>>    read_lock(&d->arch.vgic.pend_lpi_tree_lock);
>>>    pirq =3D radix_tree_lookup(&d->arch.vgic.pend_lpi_tree, lpi);
>>>    read_unlock(&d->arch.vgic.pend_lpi_tree_lock);
>>>=20
>>>    return pirq;
>>> }
>>>=20
>>> So the lock will not protect us against removal. If you want to drop th=
e RCU, you will need to ensure the structure pending_irq is suitably protec=
ted. I haven't check whether there are other locks that may suit us here.
>>>=20
>> Hi Julien,
>> Yes you are right! I missed that, sorry for the noise.
>=20
> Actually,... I think I am wrong :/.
>=20
> I thought the lock pend_lpi_tre_lock would protect pending_irq, but it on=
ly protects the radix tree element (not the value).
>=20
> The use in its_discard_event() seems to confirm that because the
> pending_irq is re-initialized as soon as it gets destroyed.
>=20
> I would like a second opinion though.
>=20

Hi Julien,

I think you are right, the structure itself is protected but the usage of t=
he element not. I guess now it=E2=80=99s safe because RCU
is freeing it when no cpus are using it anymore.

 - radix_tree_lookup
   - vgic_v3_lpi_to_pending (return pointer to item)
     - lpi_to_pending (function pointer to vgic_v3_lpi_to_pending)
       - irq_to_pending (return pointer to item if it is lpi -> is_lpi(irq)=
)

         - vgic_vcpu_inject_lpi
           - gicv3_do_LPI (rcu_lock_domain_by_id on domain)
             - gic_interrupt (do_LPI function pointer)
               - do_trap_irq
               - do_trap_fiq
           - its_handle_int
             - vgic_its_handle_cmds
               - vgic_v3_its_mmio_write
                 - handle_write
                   - try_handle_mmio
                     - do_trap_stage2_abort_guest
                       - do_trap_guest_sync

         - vgic_get_hw_irq_desc=20
           - release_guest_irq=20
             - arch_do_domctl (XEN_DOMCTL_unbind_pt_irq)
               - do_domctl
             - domain_vgic_free
               - arch_domain_destroy

         - gic_raise_inflight_irq (assert v->arch.vgic.lock)
         - gic_raise_guest_irq (assert v->arch.vgic.lock)
         - gic_update_one_lr (assert v->arch.vgic.lock, irq are disabled)
         - vgic_connect_hw_irq
           - gic_route_irq_to_guest (Assert !is_lpi)
           - gic_remove_irq_from_guest (Assert !is_lpi(virq))
         - vgic_migrate_irq (lock old->arch.vgic.lock)
         - arch_move_irqs (Assert not lpi in loop)
         - vgic_disable_irqs (lock v_target->arch.vgic.lock)
         - vgic_enable_irqs (lock v_target->arch.vgic.lock)
         - vgic_inject_irq (lock v->arch.vgic.lock)
         - vgic_evtchn_irq_pending (assert !is_lpi(v->domain->arch.evtchn_i=
rq))
         - vgic_check_inflight_irqs_pending (lock v_target->arch.vgic.lock)

   - vgic_v3_lpi_get_priority (return value from pointer)
     - lpi_get_priority (function pointer to vgic_v3_lpi_get_priority)

 - radix_tree_delete
   - its_discard_event (lock vcpu->arch.vgic.lock)

From a quick analysis I see there are path using that pointer who doesn=E2=
=80=99t share any lock.

I will put on hold this patch.

Cheers,
Luca


> Cheers,
>=20
> --=20
> Julien Grall


