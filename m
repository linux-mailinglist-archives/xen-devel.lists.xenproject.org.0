Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKcFHmYV62lKIQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 09:01:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1330745A755
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2026 09:01:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1293194.1571067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGAXN-0008Cc-EY; Fri, 24 Apr 2026 07:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293194.1571067; Fri, 24 Apr 2026 07:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGAXN-00089w-Bh; Fri, 24 Apr 2026 07:01:17 +0000
Received: by outflank-mailman (input) for mailman id 1293194;
 Fri, 24 Apr 2026 07:01:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peng.fan@oss.nxp.com>) id 1wGAXL-00089q-Sz
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 07:01:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGAXL-006jNo-6R
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 09:01:15 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peng.fan@oss.nxp.com>)
 id 69eb153a-2eae-0a2a0a5409dd-0a2a4501895a-2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 09:01:14 +0200
Received: from [52.101.70.1]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <peng.fan@oss.nxp.com>)
 id 69eb1539-c1f2-0a2a45010019-34654601b784-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 09:01:14 +0200
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA2PR04MB10409.eurprd04.prod.outlook.com (2603:10a6:102:415::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 07:01:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 07:01:10 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=fail header.s=selector1-NXP1-onmicrosoft-com header.d=NXP1.onmicrosoft.com header.i="@NXP1.onmicrosoft.com"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJJEWl6eUsg7FJGRHBtb1pqagURtezzozstln08bvrssGQ9TDvlkr7tzjdbw245K7L4Vd7UdRyf6upEeIW8f9X7/sLD1G/70cVegKQtO3u9XZd+sqXL/fTZJQ0MIQ5QdSjG6SDqOb6+59zyCX0y82f2ikUVvcfidGBznQUKRnWgYbK3bjlm6zS9jYNI/uZv7zgAPaJoBwfrkMuO6ZgvvXwOpPTgmvPlSGamUnzsqAoa1ubEf5aNnfpIv/E7NrC1E0Z2BiDCf11hBpTrweIhhJYOpail07EV7N3Z/OUnpW9EW7kYyEtt5NGP0zpI2rR3/5jMIcInIK9NbOGF0JoQ95w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGr2Z9sqmZh4cojztcKkGkFL8NLY0gWLf9f7OmFQdHA=;
 b=yMqc+cnfAtkDmzwxRqDwB2WykFsc8Urk+eh3jZVlZBHfM/p4FGIGofu1WSyKi9RyKR1oVAH3lHyI3yoEo21oPKfBiEr8AnCziJEg17+d6duWy0QCmZPGqCBLfN3KkA37211juYff2qvZmVodOrFZTJCt1IWITUEXSkzMrqdGoKgqChonbObit/f4Tz9NC2OU1hd/Qvx9gcHwhXnVhPabGIMlntzNiP34N+2ZRvrSHkegQ5+dynuOGzXMidABfKjwMQwRsVwhrf+RZDV1Ddjh00Zl4XfkjFraAwq091osSMqG/xsh9kJ5f0wuLdPRuZhk8aB4PWhBSuYd5QLVEKIipQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGr2Z9sqmZh4cojztcKkGkFL8NLY0gWLf9f7OmFQdHA=;
 b=b1ZNCwxbg0gxjAZOUVzgHg2UbIdapLj36wuO56oIWN2dm8rA3l8mO5iiRhNsT1lCHXmY04oME3aO45Wx1XNJORahs61U3v3SFp1bZyrBhKfXj0g9Len3XKRlTRx56ioXJCjXFi2O5DCOfIyAde3FuWSUtFGtfykNGL29jni1gKtzJmxaakM6OER/PFTR5L8X+5EqsMvhjGK5600iKl6JqQ0Xjyi2Qz5tsZ7vlCe0QgFHRHDZKtYj6HCEVZJ8yIXzWM3adgILqqXYN5LnI758ykRYbCRrMLznnj4tjjXrg57RauBNtV5Mb4QID6pHxXCpH7okI/hzntL/uP3uiHKEHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Date: Fri, 24 Apr 2026 15:03:45 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC] xen/swiotlb: avoid arch_sync_dma_* on per-device DMA
 memory
Message-ID: <aesV0ai8SM89cb3j@shlinux89>
References: <20260415-xen-swiotlb-v1-1-de24eda3c0fd@nxp.com>
 <f6cf1d46-9d2e-4b52-a6b9-fb45d01b874f@suse.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6cf1d46-9d2e-4b52-a6b9-fb45d01b874f@suse.com>
X-ClientProxiedBy: SG2PR01CA0120.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::24) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA2PR04MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: bc8f0303-5185-4b93-8be2-08dea1cf43d2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	B0Ryomm9ILjLwzc2JpMtG8XWMGSGT7VPt4mF8rDk6UCtvYXPNj7Hukqp59n5wEq1ZPZLWaH/x/tUB8J3rvNxfQqpJeVGIhDKwPeX715H4yfNvkYDyR5ylsneJFSywV11t7oVojv9Qoo8Kh/n5oLnhwMUQMq3itygS+HLwwO8ZkMN9ZCXieSrIcL1LII03zE5CyFyCXAN95GDvXWnd0qsAnonXoLhkF53/Yne/sO4RTkWJY23XxIhuGp2Dz8NasitzgqFSuPKTBXT4xwyjEtrOZgSxPn7mzVWusnyNgagL4WCYVipTt9DWiiETRlL2mk0VEMZFQNEQIg3y7RUlLzGoA5Rz5NxwgVPb9dqrnI1VPjcAtagd8JnXDMBJZYT/kX7Jve4sXRmMQOSufgVMZgUNVIk2slhPh8w5pUvXa7B5DuvWvsggNmFspS8POZNWp+/eM5Itlqy9HSh/z422PGzRJifZX78BbaNuQemGzF/5mpOHCieDP4xflbA+1afJtWYopys2wBVVaw2/6ixqbSL6ZZVsVttmKSeks2YTk6zrq76kR+lf1/8LKfUFd6jjn3/zN4Kp1nqicSMDuGAbq7huGTonPGAgK+oSxje76Kh3181Vgl5BmZWcLV2sIb9CDST6UBKdjzVykYvHxqq4OfKSaG4xSTgfm7g+JhMx5KA+7XiqaOWZbhpk8PgoUmvaAU19WNRzaJGnL3805+kVHbB0/RpIM+WBZ2pQX6RFDYfJ80IYI8mYcI3TTcm1GWXHvoMObKHVdv+OKDkjI2SRFS7RtTobzDgjjodGlC4o993/VA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?a8+nYhl5q7cDIeF+1a7B5U1WZwIHon3qdjbPZ9uW5BPhQbuMVXm5yqLy4s?=
 =?iso-8859-1?Q?OuTlRejUq/XrF69Chv/fwzxYphXohqJ7l1Lrk0A8eQA3+rMCZ2ja43aqRp?=
 =?iso-8859-1?Q?MPdyOaAuJXemrodo/OVtbeG7TfaQ7gtaifVaVjBlHtmNarUh+IxXYbPFWY?=
 =?iso-8859-1?Q?Ksz97qYLtcnoCZIZFmY/T9rWUKjojqhgisU1oWsjkZdzxzjs/0cgXiHD/P?=
 =?iso-8859-1?Q?ite3lV7o4iYBuucG2mzhnAv2CiN+8g+p2ARQqBTN0AXcAIaDMdDprrjKdd?=
 =?iso-8859-1?Q?kM/LcNCokMUSIWQtQzaC3DkJc9gx5T03+QJmL4TE880EWKN1ML4d7EtIT5?=
 =?iso-8859-1?Q?5YrfMEYmQynGXGclzP9L0MueZAfV82qTQlhuTzDW3D98dz5I0yKYakTgUS?=
 =?iso-8859-1?Q?4VS+aVofDfV597EK5pkIs/WJE5ajB88Jjaz1m9c5lyqeuXVZzXi+sszcHF?=
 =?iso-8859-1?Q?JRj+Ib+tYbNFGG1rGa2ZT4QGVWKi3l1Xo5o8S9Wec2C3PCjE55BNYZPbCd?=
 =?iso-8859-1?Q?EUv8r9EurrTy0SJ8h2HjVt8zr31dPcE9qTuQuzuigIaUOjPK2dBLFH92cL?=
 =?iso-8859-1?Q?WXtqTpEAcnZlLHxpsZM0eKzYv/JFzYkHMAYHB+ul9klTDFsIM8A3ntSTki?=
 =?iso-8859-1?Q?ky3XmABgFpfoSWAAPTxVfp4rN8pFqNeeGLcBLOupMcNH8p0y9mNAyaNO1n?=
 =?iso-8859-1?Q?47WxoTHNHPi82feeQ8FIbb2rDPds0Hw94nXWmQS7sxjcB7G+ehrru2M401?=
 =?iso-8859-1?Q?tUICXXCJpy1eTVKnkEMU5pYx3GQ3S/SrRkouzmXRpnpo/b2pCBoZ4HpSuI?=
 =?iso-8859-1?Q?yTmJhUHarod5Q2AumbyrJt/PvrdB+GF8SjynylYXa6Vgl+LAZnzC58j1+u?=
 =?iso-8859-1?Q?TMqyjOG68pLocfS5q/rZcfFy3XsUktB96CfCpvDu4YJzfQ9FAMww48R/EZ?=
 =?iso-8859-1?Q?wxLKgpn6pNMU/lyr/rpRzopNmVQWRmhQhR5QWx7nNbWp29lMvA76Mu6mCj?=
 =?iso-8859-1?Q?Hbw1aUz2gNsE3/ofMdroUs/YhBU+7r4NlzwA3v2h7tm/p5CV4EkoFwXfGI?=
 =?iso-8859-1?Q?O/oMAigYPjF0tHWGzakVIkaTf4QQ6x3kFuCDpuHbAFb+GbkgJzH5XK27Bj?=
 =?iso-8859-1?Q?ii4mQwT/VDNNJxaWbRUPjY3vBu+PkGqk9K3mnOcfhsnQF4s+PAEbyQODX3?=
 =?iso-8859-1?Q?9Er2beVtbJ0BXDazwkZvr+joXnd+kwndonc4WXmhMJ5M71PMRlBXyyK9wo?=
 =?iso-8859-1?Q?6jp5dEbKLUd/nW0XQqmfityHqh61pilq/Q4VYsv+GRC3oYWNvphbieVRcY?=
 =?iso-8859-1?Q?CaieAbw5e4p+9Kzqy4YQnJERC+bqO0dV+Xfy72zJEHDjR+6b+cLKlIvWM/?=
 =?iso-8859-1?Q?CNX1evFEnLQ6RsXS1hbjVOy7u+pIfrKdMBEcl6qaC9Z4pAZhlF3Hr3wOw2?=
 =?iso-8859-1?Q?/CNSiN3uiHBzs8rTkgc0Il8VoT3H2jYK6az/cGai/eUSx4Iif39E+OxZgz?=
 =?iso-8859-1?Q?+5dPRDhQfeOzcinK2jgWctko7BsostCXNanc160+etav1PvdzsZY53ea12?=
 =?iso-8859-1?Q?cD7Hp4Ur57VwXIKro+OaI6NcPVv4HMhVsHVDD5Fe3NdT59XW48E5J24VZs?=
 =?iso-8859-1?Q?wbOjNxgdUkLUvJyhTR4ZRP0cgsAAletV84p522wa5iVFJneVUQp3/vWTBP?=
 =?iso-8859-1?Q?YoktUT8JSJE0um3UoziCtJnf/nxbcogPAjm6BWEvwD2wHNvM+knouXDT0X?=
 =?iso-8859-1?Q?Z41eyHOVUcgY6sVBx5M1gGnNRb0kTiB0gTqqa9vIV9ghUUsBLsuOpjC8QH?=
 =?iso-8859-1?Q?s6j/4cp7Yg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8f0303-5185-4b93-8be2-08dea1cf43d2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 07:01:10.4403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMKcCOlLbrk1wDDTOCW6LCsj4Iyy5vkraUDNrAjRY4tuYjtqbSZaFzG/DWZs5sb6vViwHT8OO8+5J6jxcnW/Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10409
X-purgate-ID: tlsNG-d62444/1777014074-B586AFF4-DB4E70D1/0/0
X-purgate-type: clean
X-purgate-size: 2244
X-Rspamd-Queue-Id: 1330745A755
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.11 / 15.00];
	R_DKIM_REJECT(1.00)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:peng.fan@nxp.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[peng.fan@oss.nxp.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

Hi Juergen,

On Mon, Apr 20, 2026 at 02:19:34PM +0200, Jürgen Groß wrote:
>On 15.04.26 17:08, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> On ARM64, arch_sync_dma_for_{cpu,device}() assumes that the
>> physical address passed in refers to normal RAM that is part of the
>> kernel linear(direct) mapping, as it unconditionally derives a CPU
>> virtual address via phys_to_virt().
>> 
>> With Xen swiotlb, devices may use per-device coherent DMA memory,
>> such as reserved-memory regions described by 'shared-dma-pool',
>> which are assigned to dev->dma_mem. These regions may be marked
>> no-map in DT and therefore are not part of the kernel linear map.
>> In such cases, pfn_valid() still returns true, but phys_to_virt()
>> is not valid and cache maintenance via arch_sync_dma_* will fault.
>> 
>> Prevent this by excluding devices with a private DMA memory pool
>> (dev->dma_mem) from the arch_sync_dma_* fast path, and always
>> fall back to xen_dma_sync_* for those devices to avoid invalid
>> phys_to_virt() conversions for no-map DMA memory while preserving the
>> existing fast path for normal, linear-mapped RAM.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>   drivers/xen/swiotlb-xen.c | 17 +++++++++++++----
>>   1 file changed, 13 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
>> index 2cbf2b588f5b20cfbf9e83a8339dc22092c9559a..b1445df99d9a8f1d18a83b8c413bada6e5579209 100644
>> --- a/drivers/xen/swiotlb-xen.c
>> +++ b/drivers/xen/swiotlb-xen.c
>> @@ -195,6 +195,11 @@ xen_swiotlb_free_coherent(struct device *dev, size_t size, void *vaddr,
>>   }
>>   #endif /* CONFIG_X86 */
>> +static inline bool dev_has_private_dma_pool(struct device *dev)
>> +{
>> +	return dev && dev->dma_mem;
>> +}
>> +
>
>I don't think this will compile on x86.

My bad, I only tried the build for ARM64. I use below changes, if it looks
good.

#ifdef CONFIG_ARM64
static inline bool dev_has_private_dma_pool(struct device *dev)
{
	return dev && dev->dma_mem;
}
#else
static inline bool dev_has_private_dma_pool(struct device *dev)
{
	return false;
}
#endif

Thanks,
Peng

>
>
>Juergen






