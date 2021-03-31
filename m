Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3453034FFB1
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 13:49:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103891.198179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRZKR-0003gA-8C; Wed, 31 Mar 2021 11:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103891.198179; Wed, 31 Mar 2021 11:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRZKR-0003fl-50; Wed, 31 Mar 2021 11:48:07 +0000
Received: by outflank-mailman (input) for mailman id 103891;
 Wed, 31 Mar 2021 11:48:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7d7x=I5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRZKO-0003fe-Ub
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 11:48:04 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b03ff23f-811b-4a54-8b38-7aa34f46f21e;
 Wed, 31 Mar 2021 11:48:03 +0000 (UTC)
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
X-Inumbo-ID: b03ff23f-811b-4a54-8b38-7aa34f46f21e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617191283;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Pqsiuta4tLV8He0nZdG+3XgTrjswV4232IcmQTuN9r8=;
  b=hP93KEMoPy+BGYs9qpbqyKa3Iqoz/PtnESHe4EJw2rmLnb5ygm/g5YmA
   AtMoM1qJMt6o+9h7eRNn6KvXVSW3zdnYBsyVbdCECFXVvJw5EghQ704Nw
   dNOfliLcoNnEEJI2DQT/P9t6M0xuyddNRAM1mDcTXP/g5nmpyTe05b4kp
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jyi0/gRZGkhQDYcStek7IdoT5AF1nZoUkB/U7V0BwTvt8/vc9WOsWHmFHhitQqyaDGVP2gMWGa
 IiHGVTElrXsOzXofi4Prh0bhHo/XDrYnVRfWOFNCQxI4zVqNbaeto36jQOBYygakBObeCXA6L5
 GSBU2e32IgWyZtyARlwRaPFN/c28/9URM2ymnfGTcxDNbSwfUa5W5ndsp7qi5h5R1CtZT9H39f
 IihcPc/Vhz/18PgS5EejWnkXhIVdzERfpnfMMQcWw5Zh3KDl5AsX/tEcjjNr1eR2SLV+K1mHoc
 /pA=
X-SBRS: 5.2
X-MesageID: 42000114
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:UYQHRKl0NcUoZolSH5vQByvfeZnpDfN7imdD5ilNYBxZY6Wkvu
 qpm+kW0gKxtSYJVBgb+eyoFaGcTRrnn6JdzpIWOd6ZMDXOmGztF4166Jun/juIIVyGysd49Y
 NNN5dzE8fxC18St6fHyS21CcwpztXC0I3Av4zj5kxgRw1rdK1shj0RYjqzKUF4SBJLApA0Dv
 Onl6x6jgGtYHEGKvm8b0NrY8H4u9bJmJj6CCRqOzcb7mC14w+A2frTDwWfmiwTSSpIxq0vtV
 LYihXj6r+42svLrSP05iv/1tByo/fPo+EzZ/Cku4w5Ji/vsz2PIKx8RrvqhkFQnMifrHsnit
 v0mDFlFNhy7n65RBDRnTLdnyTtyjQW0Fmn7VODm3Psrff0S1sBeqh8ub4=
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="42000114"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5Fnlr/LQL9hhFwkBCXRGipvTHpIY3NQ+um/Z0GUyFQ+EE0qHyK1vIaGavPy86DWPqqUlKsoe+pHAdLKb81c7tmQcEYKJI5fPN3luiYBuFvpWkKdS4aI6AfAyIlg6T7tDhmceGSjbprcdtw0vC6uQCVcTlrnILg9cw7OnKYJ/uErIMQ8YlThojdCJjUpEh9Oxb0bkSRdvqXYSjUr8nI3LqUGm23St1MkkLoQvVR80W54Z9D4K8fvW8nShFhwQCVNlfrDliQV67QJEsJJUzyzAuxydqgZD46ABKFjS5a2SxF8NTCoQVarxSuoqV+FC26WX0esqMne4QuTxI2GTtskmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9Xjwe1/PwRUhoOBGGwpJxFhUY4F5mFQTd6KqR2NGeA=;
 b=ZNcGWgHMTOneqNDMpbhwmdYo3oNiTpXjZOdt9bM4VQ6aSbbjC26M13cLe5uNQmEV4iQyvivgEm0d8roLT8DrmaMA8lvFdzrV/hlz9eWFnxoDJ2NWLtDQOoWSqBcN5FfyY2pG2JOPL/AgGYanyxWC897vgV20LpVypYWmVtqN5t99uqB/6QmrJy52lIzZNb96lc2EncLcHIVc2+e3xgHmqPfzlRX+XOfD0mwml8siqcWFVPPr2e3tO/a5+yL4WGv/yjin7W/d+fptYDv4+Y032cIDwFsmwT8zOXwAtn+xuVb5zPeBwSoezNXBhkH0JkUlzUarOPdpImHB5OEBnsd3pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9Xjwe1/PwRUhoOBGGwpJxFhUY4F5mFQTd6KqR2NGeA=;
 b=gGOdlrwFoeF8aWDx0axrRZLQYWt0DfLcRsVQY7nNtzxAQZ1+7G4eZuWouQhHhBaJ3qjkGVMlYrmBYn/HXUJFs9xkKDXQDAMoCcwxctxejLfZD155LNgMoNISvajV28dkPvVvxobDqsHOy1vsZSF7CXLAfUXyqjtmnaJuvPdZDcc=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-4-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 03/11] x86/vlapic: introduce an EOI callback mechanism
Message-ID: <a41aea8e-9ffb-957c-10ca-b70937400f21@citrix.com>
Date: Wed, 31 Mar 2021 12:47:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210331103303.79705-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0113.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::10) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aad46354-b378-40c6-2801-08d8f43ad575
X-MS-TrafficTypeDiagnostic: BN6PR03MB2868:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB28683B6E7056D0EE6C7AA2B2BA7C9@BN6PR03MB2868.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v1rGzl309uZRCKsPZWzrnjKkj6AXYK0TmA0paviqyzsNEnjdR3MIYFNpAP4hLMQDY6b3vH7f8GoXnLbZAoZK8FPBl4O0JXk0COJOO5avHjDLcSzsaffXVjGh8qJ+uQXS8OTWcK2oM+MLXDwvRMfuDpazD1zPvMhXT1IlLsul+FAPj6qH+GZrhjt6tmPBCGTLqxYaecQl4lg4heT7tiBGL90huA3cjM4vjV9G3e8rbtuuzx92+kQtEnKAAouun3Hx/DIr0rz/5204yuSgYpdLFod+ewMZKH4kQfeh8DsNgD9fkjkvW4LJsY3FV/ey+fvcB2dVqipTrDSAveBEG+xcVBV4fleiYvkNyJlQXl2SbHEzJF9nSdqo2yLvWEgVVYUEk1cZDP9XpvU0q0vKV8A1iwy1rJ4phdWL1AGOatnHt5ga9DEgCrZiG1wQ5DRaDwcP3qaw3oN7v7PeoVgazPx8caMqJ4muy8CadPxW4XPBhL2bPAwQusdRC6M8bPtvifjK2PGXO0t20eNlWRcr2Gq/Mb8+PfEGWlTYLwbdrmcLU2ZX23MmFymUh/nwGk4TSzpboQG0dnIRHVUaIu242NAixK6TJJmoj6ZcwPmjM+ZrxEJZUs+TDhUIDi0nZlFMb6LXBdo/TbeCwEHnp9DPbzH85bDgc2Kei9T7Hx7QUjKwIzXRj4U50UDR1zjkPd14FMWu47k7CV2yVToqh6byd6vl9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(956004)(2616005)(66556008)(2906002)(66946007)(16576012)(26005)(5660300002)(4326008)(86362001)(54906003)(8676002)(8936002)(478600001)(38100700001)(4744005)(31686004)(6666004)(36756003)(186003)(53546011)(16526019)(66476007)(6486002)(31696002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V0xLU0dqS2t2S1VNWGRyaWJ4dGhBOVgzQlhUWmVKQ2RvUEZJVlc0SldQbEZw?=
 =?utf-8?B?ai8va3pKZzlTcnpORnBid3FWczVQSmZQUjhhSDZ4blVvbHlEU3U0c1pGeUtV?=
 =?utf-8?B?Z1E0Z0d0K0lML25YbXNycmZ5MEgyRkROTmV6bWEwenBwbjRTY1JnS1NJY1VH?=
 =?utf-8?B?Nk9EcEY1eTk3dENxYUJOenZsOTlubTNndU94cXFPTWU2WUY0L2g5SjhmSmpa?=
 =?utf-8?B?ZlYyVUE5aUVIUGFHbUJucnc0ZFBwTmQ2ajJ6cEplK0hpT2NvSmdBdkIzMXF5?=
 =?utf-8?B?bjI4Q2h5aUJJeUtIRURhRVQreExydzAzMnV1aEd4UDZXenVFamxtMzVSV09x?=
 =?utf-8?B?SE5Bckd0UlVOZFBtQ292T2V5NWxkQUkzbGp1S2RuM0diV2MwZ3JqVXBORVlQ?=
 =?utf-8?B?dVQ1V0ZhTlZwbkNjRTBISUhlT0JzSFBPSTFEQi8yZXpoQmlBQ1dSZ2FBekZ6?=
 =?utf-8?B?ZkZOM0dnM1BibkhFRnNpYVlnRDJKdEFNR3pEVWZVNkNrc0FVbGQwYVpWZW5V?=
 =?utf-8?B?VXUvczFuRXpwOC9QbGJDZUdzdTRIMGkwTWZnSk80b3MyREU2VkpCWlpDaEc2?=
 =?utf-8?B?R1psa0hmQk85cFhTbFRaOW1hejFLTnQ1TGsvb2VrWUV3NHVDMEpOTi81NE9S?=
 =?utf-8?B?R001UzVtRmRhOFlqd3hjMm1OZC82NXl4Rm0yZnllWG9TdGdwbUdEbTZvMUJU?=
 =?utf-8?B?UVg4THN6Z1p5eVdGazZNSkFQTDUzMHBVY0oybWdVZEUwdXk1WkpITnB3eUxx?=
 =?utf-8?B?YVpMMVJEYllWOEZRSDM4eURNZ0xyVEdDWnZTakkxUXhjOFJ1MWRnQ21nQ0hC?=
 =?utf-8?B?R3NnR1k4WTlIY244K0l5VUdlcDVEZ1F3YmNtdXVoYkhpcEFSaVZnT09EWTNr?=
 =?utf-8?B?UTFKaEFPYWs3dGw0aGU0dHMwTGpTMU02Q3BtYWJLRlBOTUJ6R0EvTmxMcjJX?=
 =?utf-8?B?djRvV0g1SEhza3o4YjJzYUd2M1BTdmVNY2tYdFk0MWVveWN2dG1USjM4eCtK?=
 =?utf-8?B?Z1ovWGdzL3I1QnhMZnVndTdxd2VGem5RYUQzOGVRK3kwa0U0RTVDOVhXck9S?=
 =?utf-8?B?VURBYzEzdmh3K3BOcm9hSUdRZnF3ZHlEenpHZTNoUFRibXcvaTlKM0c0MWlq?=
 =?utf-8?B?Vi9NSnVvTzdkS2FZOTBxN2Z5eGRvczkzb2pjR0t3UnJRcE5nK3dDQmpGcEhs?=
 =?utf-8?B?U0ZwN2Q0SE5XczRxZXdBQ3VsL01QOUJKNVJ1ZW43YlhIeUl0ZVNKNW1CV1px?=
 =?utf-8?B?WDNJSTN4emp6My9LUGdKME9jZUVGN0xkVFlON0o0VzNGNG1qYlcweWtCUXVK?=
 =?utf-8?B?ckZEaFRHS3pGbzhrS3RkSXU5SlRER2Z4V1Ruc1lQSWFhb2VnT2ZtWFNTUVQ5?=
 =?utf-8?B?ak1CeHk3S0JxUlVRWGJGL05aM0M0SEg3OFBOZW1Pcmo3MCtoa0pxcU4rSEcv?=
 =?utf-8?B?NGJiWStyWHlja3VmOUl6U2tFVHhKVXIwQWZHUW5ycm1RWTNNMEhDQVJhNVlN?=
 =?utf-8?B?V0FiSXpodlREak1mUkpqUVR4dWJTSlpRekZlWnozam0vTjJZODFTcDFydnRo?=
 =?utf-8?B?dExwdWl3MXpyYkplL1dVY2xTUnB1RG5Ub0VwNUlOU3phU2VqcStqK1VNT2lN?=
 =?utf-8?B?RlhOaE5rL0swU214enprU0Y1NkhaTXU5RkpEU0l2c2pRUUtHbkM0VmYyY21U?=
 =?utf-8?B?R0dvTEdUNk9SeXlhbjlwdXR3Q1dlaGVDN0pWbU5nenR2ZmRjd2o3bGpyTWtG?=
 =?utf-8?Q?WsKG9MSRtLQ8R8dqXuOOS+PlmO6Nj0eYtiJpBYP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aad46354-b378-40c6-2801-08d8f43ad575
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 11:48:00.1229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgtYBtB8VUuzvk2tRumu4F2epPiVLSeaTG0Yi2L//3MuXVtIYNCyncKi0E4A8rMEbSHnB6pUK1fh24vpTILA81fmwMOHfTzReFB1ZZxayL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2868
X-OriginatorOrg: citrix.com

On 31/03/2021 11:32, Roger Pau Monne wrote:
> @@ -1620,9 +1666,22 @@ int vlapic_init(struct vcpu *v)
> =20
>      clear_page(vlapic->regs);
> =20
> +    vlapic->callbacks =3D xmalloc_array(typeof(*vlapic->callbacks),
> +                                      X86_NR_VECTORS - 16);
> +    if ( !vlapic->callbacks )
> +    {
> +        dprintk(XENLOG_ERR, "%pv: alloc vlapic callbacks error\n", v);
> +        unmap_domain_page_global(vlapic->regs);
> +        free_domheap_page(vlapic->regs_page);
> +        return -ENOMEM;
> +    }
> +    memset(vlapic->callbacks, 0,
> +           sizeof(*vlapic->callbacks) * (X86_NR_VECTORS - 16));

xzalloc_array() instead of memset().=C2=A0 Also, we shouldn't be printing f=
or
-ENOMEM cases.

As for the construction/teardown logic, vlapic_init()'s caller already
vlapic_destory().=C2=A0 Therefore, the existing error path you've copied is
buggy because it will cause a double-free if __map_domain_page_global()
fails.

I'll do a cleanup patch to fix the idempotency, which needs backporting too=
.

~Andrew


