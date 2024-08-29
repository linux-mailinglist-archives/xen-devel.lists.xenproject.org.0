Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E5796401B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 11:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785594.1195065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjbTt-0008RC-BU; Thu, 29 Aug 2024 09:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785594.1195065; Thu, 29 Aug 2024 09:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjbTt-0008Or-8S; Thu, 29 Aug 2024 09:30:17 +0000
Received: by outflank-mailman (input) for mailman id 785594;
 Thu, 29 Aug 2024 09:30:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4mUO=P4=epam.com=prvs=5971918609=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sjbTr-0008Ol-PN
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 09:30:15 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a3cc759-65e9-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 11:30:13 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T7fK3J007529;
 Thu, 29 Aug 2024 09:30:00 GMT
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazlp17013012.outbound.protection.outlook.com [40.93.64.12])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 41amtq8ja7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 09:29:59 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS8PR03MB7046.eurprd03.prod.outlook.com (2603:10a6:20b:23e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 09:29:56 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%5]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 09:29:56 +0000
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
X-Inumbo-ID: 4a3cc759-65e9-11ef-99a0-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHQ2ZsB4tDp0SkJYU++PMUCq0fUef0W4pDlOeNRTZ1asCRMSKmJL/zEhAZF1GsIb9pjkpamLI6c+v2jUmKbfYJsvy4BTgvuKMSGPigeeLWYTR7PN+t7qSPbtUsS34iVl6gcq+WbZyIjDxiuTEqXQAyHct/33DewGiPxIRHAvwiOo9u3SXSesqQznGmYw/JQvWwQVOdtubPT+hpL3iiwSor4OtUp2XGM3+XzlWGqx6keQ6niju7Q+to+QBfS9ZizrenAkoA4RWFpJjuiLQof1woR/HE2UF/m5SlAw/GYCL9hgDOT3IVQ+U6WjHHj3NKDTyStw6QIoddtAiB7/iI3o6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QX60cFgxvS1j/hQCViRG5wRI6bX/9dzwIwqyk0nbFgo=;
 b=JFq/nb9ftMHUBUeuFcklZl+nNbzH4wCzzNIAhw1PAS239NUy3Mq3y+wNKHZ7aIaAoZebOP2dNBvLBc2O5YdfeS+5w8yQTDZIeX60WvJG4qDO5ukGkYRR39G40vyrmjUxU3xuzd8mWY3FuA+N5JaYotpj44yZ8h81TCsHluzDeD2EoBUB+cpNZI/VnK2IvwUK+IxAtNHIYZAP71XftX5hdMsdH98lDb0q1q3SbxKQdEj97NZwrhGEimvpJHx9IbcdJmbHn/JomMnnKOmWyNtRVq+hGdlQwg8uts76ZVEJCEv/t9GjHxKKUx8sOdgVh5craa1Of7CE6uvFo6Sxom+jHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QX60cFgxvS1j/hQCViRG5wRI6bX/9dzwIwqyk0nbFgo=;
 b=Td1FbezMMiYweH0BaNpu1Wh/nEeT9PeFyMRaUp+Yy5FndPAwQw0WjYNDW//bUVR8wvdcZN9PeK6P9cAhdunaGtLFKmLW40TefWmj++VexqqMoktUFRrN4hkgcc+gbiGyrbf50PdlIqIOMnW//RjtZX0V+n0HZh4NBkmN3Ll/VbF9c1UsszvvGcV2aWPMC8lPGBlDDP0pbTJxXNSper2KODfdAqbkV4mRVseuYJT/IcD3ppKhHy4DnLpspmxSyC8GJ4ueGeDKR5nT1q4aUbiVF6jx7JFq7XGL9n9wq15kZ+tczy9CSkIdJVHLv/LNaLXOdxLoQxjATUunN2l+HlSUuQ==
Message-ID: <595e2722-5812-49c5-a668-2ab88250c925@epam.com>
Date: Thu, 29 Aug 2024 12:29:54 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/5] x86/Kconfig: introduce CENTAUR, HYGON &
 SHANGHAI config options
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Alejandro Vallejo <alejandro.vallejo@cloud.com>,
        xen-devel@lists.xenproject.org
References: <cover.1723806405.git.Sergiy_Kibrik@epam.com>
 <2a217c9602e92f92050cb4894bb9a42ee99a84ea.1723806405.git.Sergiy_Kibrik@epam.com>
 <5cd1fac5-bf4f-4a5b-b02f-e971d36581b0@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <5cd1fac5-bf4f-4a5b-b02f-e971d36581b0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0243.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::8) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AS8PR03MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e83e4a7-e8dc-4f36-0fc9-08dcc80d254a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlB4Sit3bXAyVGtUY1RZbGlLVlVEVlljTjl5dDlQRVB4TzlHVU5iRVZJMTFm?=
 =?utf-8?B?L09rT0REVW1iWnI5cjJlYjRqZkVDK1NQNnFHd3BKYzQ2SjRkWG5TR3RNQWtG?=
 =?utf-8?B?aFdjdWZJQlJ6RGhJZzQxWFo2NzZxSkM5K3pOek1RYUVkcjdFRm1CREVqYWRI?=
 =?utf-8?B?Wk9KWkJtbXFFMUxiY1dQckdSckEwWU1jdVlLZmZ6QkZQTjFpcElEbW40VFRs?=
 =?utf-8?B?Z1FXR0N6SmVNcW5ZaTNQUk9CRm5sQlZaZTZIcUQ2TGQ0QXZYL1JPRFkxWm1w?=
 =?utf-8?B?MmY3VzBBdGx6NnNxQ0pGTG1rQ0JBVlozaVd0NXBpQmtYbVVabGM5V05xcERH?=
 =?utf-8?B?ZmRSOUVTQ08zMXNRTDVlaHZvRWpla0l5OFNOalZaZTQzTUNxQ2UzUGZYVCtC?=
 =?utf-8?B?cVRGOWROZ2RnMGk4ZTM1ZVR2OEc1UGhwT0JXekJBRGt4K0ZkdENKSkIxRXU2?=
 =?utf-8?B?RXkvdjk1RG8xaVFJVnJYcHRHMnVValdkbGxCSTBMbDZCTkpFMUZ2SXVKUjFn?=
 =?utf-8?B?QW9sUTllSWRWczh3d0VkZGt5VW1GcG96Y3gveFJubFpLRXJ5RDJ5eEY2d3Nx?=
 =?utf-8?B?N3RlR2o2V01OYUo0NDY1NmVPeC9BTllnWlBQR2xGTWF0ZnEva3lxMkkzZ3B0?=
 =?utf-8?B?bnh0c3VkaW5zTUxGS0hmYVpsK2ljOXkrWHdFQ2JVVUxIV2FSeFdaYjU2UzhJ?=
 =?utf-8?B?MENTaEllU3NYc1RsTFBMbzU5a2xPSWtzQzk5RUxoUTNNaUoyMTNsZHZnTGJz?=
 =?utf-8?B?T3hHem5uLzh6cjhTU0RNdkNkQkF4Zng3bGhGbkNOb3FNQ0dBZDF2N0NqY3NT?=
 =?utf-8?B?Nno2VjBUMzZLWGkvQ1FaYkllVVFqSytWbGEzWDByZVY0Z0crRkMxcGp1UGFG?=
 =?utf-8?B?QXpwZC9hSExRemVSTU9ocVRYTlJtWC96cmczZytpNm5YQnowcDQxeVhXSkEy?=
 =?utf-8?B?U28waUxxbXYwMG9HKzdxTHVoVzMzRHdGbjlrYldpbkdPQ0ZyYmIrOEQyay9j?=
 =?utf-8?B?TFhFZDFoZm5rZXp6ekJtVDMraFR0a1M3V0tTT0xoUjA1b2VSa1N5a3VrTHNH?=
 =?utf-8?B?WkJ4Z1ZDeDZKaERIK2dMV0o2N2xBWjZkVlJTc3R6RDVpUUI1c3A0ZTNrVlFG?=
 =?utf-8?B?clVhLzB6Y1l3R0lkZmNudzZuaWZXb1JhWUtvYXEzNTYxSjlyR2dGRzNWdUtl?=
 =?utf-8?B?SEhzaHJQUjVpZjMzRDFLUmN4MTF1amI2cFZxNUw2Q1VVSU44Um9lQjJRTTRl?=
 =?utf-8?B?SkNsaVE4TzR1ZjNjZHVuRzRubkNmVlpmeml6OVcwMnBuZG5yZGVmN0NIS2xH?=
 =?utf-8?B?ckVwNXExRXQvdkJnUUFzckFsTFlCMVJ1RmJYOVNDa0RzSng2TjdTbXlaSWlM?=
 =?utf-8?B?QTJ5TzJXRExBd2EzSmxwZ09tWjRFSTQzU3k3WWQ4V0JlMmJ0YUhmRnh4N3kx?=
 =?utf-8?B?cGxJeDVrd2pOVERVTW5QWlBoYVVES0tHdmFSQy9ZTmM5WEEvMG5neW9kdVJN?=
 =?utf-8?B?VHFSMFc2eFpLZnB1UC9IRWd3R0g2SVRKSStUdnZxaElrSjhYWVMvRnlaNUlM?=
 =?utf-8?B?RXVNMWxMZjBiaVFEU09VZWh0cCtoYVN2UmFxUFljcC9JbnVmZ2pRRU1heHJr?=
 =?utf-8?B?UE83OU5IZGJSODNaQ3J4UXM0N2pCd0tpQ0VBTWdTaUxUN1dObDJRTEhqb1Ba?=
 =?utf-8?B?cHBYR1dHbythOHJRdnJ2bnB6VUh1dzl6MGFuTHdjNlpEdXpxNTJpV2ZqODBt?=
 =?utf-8?B?MlJRTyt6R2daN2cxaFJQbkswTkwwOW94bDRsR2N4cnhiSU45U3JvcHVBbWJN?=
 =?utf-8?B?Tm85Z0ZJaWtpalRkcXhtQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anBXMUVPOGR0ZVEzNzJIQ2dmYkh6T0E5TUM0YW9YN1p4d2FvTW5UZVBONmVt?=
 =?utf-8?B?T3ZEY3hhMXpFMWZ6WmdKa3dKZ3crUWpENjNFUHU3NVVLRkx5VFVrRmxUOEZh?=
 =?utf-8?B?ZTU1UmtrWk9RbUF3RTF0dDN4N3p1aVU0VlUvUWJEcTN5dHJYOTA4eGVHU2g4?=
 =?utf-8?B?MFVhQXNEOXZwdHBieTdDS3g4SFptT2VUa21yRkhPNVYxZ2lkamFTWkhTbjZB?=
 =?utf-8?B?ZTh1T2VrTzMyQ1hESGREMnp1aVA1RXdmVWtBbE1lTEVFVmk5WWNrOERGaDRB?=
 =?utf-8?B?eHlhZUp2SnJWR1hacGMxM3BJckEzQWtCTEF5YXcrNm9YcTFaVUw5dXpiZnc1?=
 =?utf-8?B?TWtKM2xLdi9NNFZWbm9yMmtWTzlXUkhxeW5PQ0tYek1VRXFZOS81YXY4VGV0?=
 =?utf-8?B?UHp4eXJmVTh2M2dGR3ozUzJ2QnEwQ3RUSXhxQ0FLQWZVaU94dGs0YWc2L21P?=
 =?utf-8?B?SGtESHNKVUNjQUprN1h6aGJFRks2TWVWMkRJWEYxWFFoY2l4eWxnUnkvUHhF?=
 =?utf-8?B?c1dzNDlhanBDQ1I0RXRBekRGZTcxUVVSSEJrR0pROWV1c2Vrekx2OXVVWHJl?=
 =?utf-8?B?TUI4a3FWUHN1QmJ1Nll0UDVZR3dhZlFJZGJQSTFHTmhINU1vRnZVSG5NMVlC?=
 =?utf-8?B?Qll2QjhSa0svbDN4U2t4R2crSjJZaW5zcTRnaXZpVHdQbERaMnlYcllIS09T?=
 =?utf-8?B?UkVJYTRGSm51bmFxdzVyWmpFTy8wUlczRVhPZ3J4MVFiTVBScktVWEZhWDRr?=
 =?utf-8?B?ZlZFNmhJQ3pwOEtDWnFBRG5QUEJBMWlmdkpjMnl5RHdjREJwRWswYlBqamM0?=
 =?utf-8?B?cUxNT1NrYXFkN1dzN0ZQcFRuVzlDaUkrNHh0dU9mdkhLaXFpR1FxLzl4VlZo?=
 =?utf-8?B?L2g5b2tJYnBDcEo3bkVkL0UwZlhvWU1rNm5xSlZhYjZHODdvVjBXMVlXYmlF?=
 =?utf-8?B?b2MwZHdzKzlwZEg2a1RRRzlqekFPQ1c0RGhHMEplYnJxb3VDNUxNcVNobHpH?=
 =?utf-8?B?V1h3a05zcTRGbjFib2Q1THorZ2w5Y0t4SXNVWGJBNnlvVitCdXpTMDY5ZGsz?=
 =?utf-8?B?a1pqcmg4WUNOdU40RlZYc2xzTWE2S0FOdWtxdkxlZUJjY0E2cW42WkY5dXhW?=
 =?utf-8?B?S0ZNY0VJN1VFQUVRUVg2L2pKREtNdDVaRXFyYVpMSFlORDg5K2tHcGFJQ0NG?=
 =?utf-8?B?amplNDF1RUc4ajlETmpYUTlxcmZVSUFMQVVEdnlTSDl0MDUvMnliaG01dWR3?=
 =?utf-8?B?eDd4MllrSis1aEtJZjBhS0pyWGpSY09rcXhzL2hsYlF6UWVmYndXK21ueDRG?=
 =?utf-8?B?bDMwaEk3R0lZeVRkTXNWVmVEWGNYNStGUER5OTVjOElyZDdXbGJGeG5CYVdH?=
 =?utf-8?B?R0JkL2Q0SFF2QW9jekhiblZUNXk3TTJjUFV4UldvVUdOV3NuZmc0VlVGcmFr?=
 =?utf-8?B?aGhEWGM5MSs4WjBzcVVhM3J3WCthM0NhMVZWQ3ZIaStWaGtkZUQvbWFUV3JC?=
 =?utf-8?B?dWxsSFVZaUJSR2xLNmtDYjJDazIyOGpza3A4OW50eXZVWlFjYjFBaVBSRmVo?=
 =?utf-8?B?Y1Jpdk42REsxTW1xR3B6UnlxOXhVMU5CUEI4cSt3Zjc2KzN5cHdPRzlOVjdx?=
 =?utf-8?B?UFJ4NlR2TmZ4SUlGSDJVTjRqamJNZGVqZHV5ajF2VGVUWDVjRWVBOUUrUXVz?=
 =?utf-8?B?Q1Fxa2w0eHN6Rk9pclFlRjNEWWpqb0E1ejU3a0ZiWVgxN3YwVG1LamxHdmZJ?=
 =?utf-8?B?ZW13NkFaS1JTQTdlZU9FZUJSbGdDT3VwelpDbTF5WmFxV3EzWXF2anp0ZWVn?=
 =?utf-8?B?dDhzNWhJdlVjb1ZkZjhGaWR2b09CMEZReXpwT1QwdFFCcldpQkdqMTBIQ0gx?=
 =?utf-8?B?aDB2RmEzR0NHUzkzV0JnQXpNQzFWU3h5SExiT0psVisxMzlZN0padlFjeHpl?=
 =?utf-8?B?WHlHb0FjeEFham85YUtkM3l1Z1hEV243Vm9EN3ZjZWplcjEydXBlakRQdEFR?=
 =?utf-8?B?Y0NWc1lIWGMzRys5REpSNDM3OWh4Q2ZxSC9wVE1CS0J3Z1pYdUxrVXBxNWpk?=
 =?utf-8?B?WlBCOHZlcGxaY1lacnpGSWg2QTIrdGRVQ25aR20wSmwvZXJicGdQZU00RXlk?=
 =?utf-8?B?MS8yRFRpTHZsUkhySkxaM1FTWDU4NVZuVm8rem9ocWRGSXozRUZzd0Q4ZHZQ?=
 =?utf-8?B?MHc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e83e4a7-e8dc-4f36-0fc9-08dcc80d254a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 09:29:56.7200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mr/VbLegT3sG1d9xa8jjFrbmmsN7HbwxiR9hqkDY7ENfGESLhXwdNvWjDx834Iox4r0D+5/XwQZRQX85BAuAKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7046
X-Proofpoint-GUID: U-QNnIPe7TJasjm8I-IocHAEA7e05f31
X-Proofpoint-ORIG-GUID: U-QNnIPe7TJasjm8I-IocHAEA7e05f31
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290070

19.08.24 11:53, Jan Beulich:
> On 16.08.2024 13:10, Sergiy Kibrik wrote:
>> --- a/xen/arch/x86/Kconfig.cpu
>> +++ b/xen/arch/x86/Kconfig.cpu
>> @@ -10,6 +10,25 @@ config AMD
>>   	  May be turned off in builds targetting other vendors.  Otherwise,
>>   	  must be enabled for Xen to work suitably on AMD platforms.
>>   
>> +config CENTAUR
>> +	bool "Support Centaur CPUs"
>> +	default y
>> +	help
>> +	  Detection, tunings and quirks for VIA platforms.
>> +
>> +	  May be turned off in builds targeting other vendors. Otherwise, must
>> +          be enabled for Xen to work suitably on VIA platforms.
>> +
>> +config HYGON
>> +	bool "Support Hygon CPUs"
>> +	depends on AMD
>> +	default y
>> +	help
>> +	  Detection, tunings and quirks for Hygon platforms.
>> +
>> +	  May be turned off in builds targeting other vendors. Otherwise, must
>> +          be enabled for Xen to work suitably on Hygon platforms.
>> +
>>   config INTEL
>>   	bool "Support Intel CPUs"
>>   	default y
>> @@ -19,4 +38,14 @@ config INTEL
>>   	  May be turned off in builds targetting other vendors.  Otherwise,
>>   	  must be enabled for Xen to work suitably on Intel platforms.
>>   
>> +config SHANGHAI
>> +	bool "Support Shanghai CPUs"
>> +	depends on INTEL
>> +	default y
>> +	help
>> +	  Detection, tunings and quirks for Zhaoxin platforms.
>> +
>> +	  May be turned off in builds targeting other vendors. Otherwise, must
>> +          be enabled for Xen to work suitably on Zhaoxin platforms.
>> +
>>   endmenu
> Imo this re-raises the question of whether it is a good idea to leave out
> "CPU" from the names: The more names there are, the more likely it'll become
> that going forward we'll run into a naming collision. Andrew, iirc you
> were the main proponent for omitting "CPU" - may I ask that you re-consider?
> 
> Furthermore I wonder whether "depends on" is appropriate here. This way one
> won't be offered e.g. SHANGHAI if earlier on one de-selected INTEL.

I see, then probably I'll use 'select INTEL' here.
And also 'select AMD' for HYGON.

   -Sergiy

