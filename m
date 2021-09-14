Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56C440AC43
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 13:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186461.335191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ6PT-000362-6k; Tue, 14 Sep 2021 11:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186461.335191; Tue, 14 Sep 2021 11:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ6PT-00034F-3I; Tue, 14 Sep 2021 11:15:31 +0000
Received: by outflank-mailman (input) for mailman id 186461;
 Tue, 14 Sep 2021 11:15:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K1wc=OE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQ6PR-000347-1g
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 11:15:29 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cc70b71-6668-4588-919c-afa071cce71e;
 Tue, 14 Sep 2021 11:15:27 +0000 (UTC)
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
X-Inumbo-ID: 1cc70b71-6668-4588-919c-afa071cce71e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631618127;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fbwPSSqtThBA55/yBXof+39Y2XSi/PWHDb/MFGDwcuQ=;
  b=V4srH+W/b5oOybe+as23mZfN8c/wHsncH08S3Q/CCnh3Vs0YR6Berz2e
   sjkN33aRdrK+tRzE7Cx+pDy+a9sRWp0mBykXCn6O8atiGS/7jsqvgcYpW
   juAK1zRexOcCYXWl4qVZWfE7GZONH8cL0H4RAEfQwveXAn6sDfC0cP155
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SGBRNgBbIYNKrgd4gVtK1JMQ8wjoUnqbS0HgjD+ezjUM6V+dTukYjFMmRwCXsXV1sic8R/JFu1
 ASTJyz7Bq0eGBqFstwpQIbJ1q+UkNKpYvL+ejivCn0UkE35Wjv0obRmuuNy+n5vNPQygkGrzrw
 XYv/Sfh8RSqFKHsZUjmnr9bsoC2JHHWNjG2wTtsH4/qvIjz8h/ewilwL79sR8VdTWaGD+HDuSl
 VcpyFsIkapWHD+7kGNRK23Sqsf354g/4Vvx5TTC8gxDtDTHwqnbbN8HYzDemDCb9ddq73TWNfU
 nmdFbliqv4E5995I48qiCz29
X-SBRS: 5.1
X-MesageID: 53073338
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Fh3PN6KXqp8i0gJZFE+RJpIlxSXFcZb7ZxGr2PjKsXjdYENS1TcGm
 GAcCzvUO/vcMWr2fIh1O43j9htT6pOHmt8wGgNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140UM6x7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB22z9tv9
 9tduKaAEyEjffHynMIwFDRxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XvocHh2xr1qiiG96Df
 uknZSRmTy/7TABTG00vFpk6lfm30yyXnzpw9wvO+PtfD3Lo5BdqzLHnPd7Re9qLbcZYhECVo
 iTB5WuRKhUbMsGPjDmI6HShgsfRki7hHoEfDru18rhtmlL77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVXRe1vXqFtR40QMdLHqsx7wTl4qjb+QGCHUAfUyVMLtchsaceTzsw1
 0TPmMj1Hztxq76EYXWH/7yQoHW5Pi19EIMZTXZaF01fuYCl+dxtyEKUJjp+LEKrpuKlEi/Pz
 SCHlhhkob9Q0fAP8Yj80HmS1lpAuaP1oh4JChT/Bzz+t1kiOd/5OORE+nCAsq0Rd9/xok2p+
 SFewpnAtrhm4YSlyXTVKNjhCo1F8Bps3Nf0uldpA5Bp3DCk4XfLkWt4sWwmeRsB3irpf1bUj
 K7vVeF5v8Q70JiCN/Yfj2eN5yMCl/SIKDgdfqqIBueim7AoHON9wM2LWXN8Iki3yBR8+U3AB
 XtrWZn1VitLYUiW5BG3W/0cwdcW+8zK/kuKHcqT503+idK2PSfJIZ9YYArmRr1ot8us/VSKm
 +uzwuPXkn2zpsWlOXKJmWPSRHhXRUUG6Wfe8JAOLb/ffVM9QQnMyZb5mNscRmCspIwM/s/g9
 XChQE5Ijl35gHzMMwKRbX5/LrjoWP5CQbgTZETA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:PauX/q6C/SVmTWJBawPXwMbXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NyZLWrbUQWTXeRfxLqn7zr8GzDvss5xvJ
 0QF5SW0eeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.85,292,1624334400"; 
   d="scan'208";a="53073338"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fc0LxzpHkMOEA6wIlUcuxiamtt8XpwZCbSHELpUl2dqbTUBvTx/zHJrGaiEJ3eec/yqd2f1qjSeNohejfsTWxxXWUhxQx18QGOuYhBFNB4+tRRJTfN2wiH7bRPwWt/viYfCmSoei2wsTv0vrtCJZStfsmEiYwUJDbVeYYR+zvMC+47uv6VFe731SOocy4gcYOu01aTDDCHzvl1pgJL9rzvYq6B6Kyr3ealakMnKrPNc2L7yA1CoaEIF1qdmaqkn4w/ISu+N9x7+1z57/egrZ9pI52cSSVU6HZbanxR9wBKsliGCCUsDyovy5kmlboPEWeSgah17c8TMdyTpAGfK86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vJODM7L9NIrwaWiYPjspGce8Y9XQfJBgNDO92ziqp/g=;
 b=GWAaCu2ErDvoA5Zgp8sZagsze47GWnOlokNouUsI4AVgUtmmKvqNx/3aSGGmEu7eOqj+F/rXMIjMNtV9zKQ6hvVcsXVXzb32bsN+QrevtQo9yjHlqOKhQYI61poRPRKZBaaJBBNJIsRaoYX1UlaeuCmWU2YYi90jhMxuUBFXSkZsmeRyXj4+NDT43OIwPk8pL8uVpMyr8V1RwpCwjWqiBMBIWXIeKu4nEF4aEkj21Ay2G4rPH2zuIHA2YlXwPKMXjoPXaRZZuFBt+P4P9lbvtW4VRWoHtRkwTucGGHR/Y4DJLL9FxBPvunH5FIM/4t0Msuv2dlUxqJxDRb10pBNyiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJODM7L9NIrwaWiYPjspGce8Y9XQfJBgNDO92ziqp/g=;
 b=pyhAnFZ8TtyAE6C2KZVzMOosBMqd1JJ9HnKdVIpyDpSFLMZ+snItRLcJR4/S0A3H4cSc6+eP/jhUsDg6lMOMLizyFJReTtZhhCyZfiSdAW7Cqn+/7QT9fpnRANOvhSS5K650/ZuUrhC0BF4i1vOILcI5D5IlHfyohgxsAQI+77w=
Date: Tue, 14 Sep 2021 13:15:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/9] xen/x86: PVH Dom0 fixes and fallout adjustments
Message-ID: <YUCEQFpdc+3kUqQj@MacBook-Air-de-Roger.local>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
 <YUBeJLvWXukyGSFf@MacBook-Air-de-Roger.local>
 <050f71c8-227f-4f78-1ec5-394ba9fba9c1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <050f71c8-227f-4f78-1ec5-394ba9fba9c1@suse.com>
X-ClientProxiedBy: LO4P123CA0093.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b524273-2c64-47a8-5434-08d97770eec4
X-MS-TrafficTypeDiagnostic: DM5PR03MB2922:
X-Microsoft-Antispam-PRVS: <DM5PR03MB29229691A65D6FCCD1DDAE098FDA9@DM5PR03MB2922.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eveKJ6ioOjnnX1y/OE4RGiWMHM/f763rHyXHi+cEmawMKbDrWQt09Lokh8eoSzmcFnBDuxEitcQH2nMfJYvfthZ3C7RSB/W4dDv5FLDQSmnc9EWjPdbB+RLz/AtQFAStiq7ZJa1lt1a+RNKC89nGjilTxc6W3lrxDeCLDR7uKqXsgTmGkkgegmrG3MEC6py2X25u8gBcZqYIicAYUQBo3Ggng8peMaE2sHdZzge5nixEr1DscEn3IEVJvX7l8DvBlkJsi4eDdGoK2cO+FKMpWwdNK4Ygpy9CC+fvyxKzwaATFuy0JhrKJ27YUpcKnCfAFxjIk6fRYjfpn5ymMEOjqdzXtkrJyqR6F3DsacPg5+3cXL4HPbQIYzRFyJnfd91zlFxaKt3yRXrrZ15hpbQYyPSNqQ3RQQhVcN/5uBiFBQjnRpIw+R2a+57Tr7LX72YTBFrf//9dhI1DkIM5UFEMOnInUd2658qT/LtgAEygHKz7G8n7ejEziu8uyuajMvdluxlDe2SJ6dx5y7/vvXoMB+XEw+6BZ6eaS9YLSyBeG9poonkLQotkjNEDxUEA+xEH8NituEdYbtQ8BunMHjvqTk1Ngmay7N0NjATcBixzfy8AuGP5QnBdmfDLUy5kPimJBC/MPwmU3uzArzMe2SOVVbKmhP7FN50cLLBZNVLNecgWSh3ctRD/zmtVJgqEg1IETfKFqJQnhRFiYW7DTmyamzQ1OPJPkbS1anJIk2AIFwCsc95Jo7uqvAjG2NQcaGscohAoNsC0MGqsdcwcXBNT3wtbXwBUAPZyKcig0apDnV4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(2906002)(6666004)(86362001)(6496006)(5660300002)(85182001)(6916009)(4326008)(83380400001)(8936002)(966005)(6486002)(66556008)(478600001)(316002)(9686003)(66946007)(54906003)(8676002)(66476007)(186003)(956004)(38100700002)(53546011)(26005)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amlYNU5lL1BDZ2s1QmJubFJzUGhxaFVMdmVFZCtrUmtiODc4QWFxcndiU2Mv?=
 =?utf-8?B?Q0Z2dWFHQXQzZjRuZG5ER3Vyb29yVU4yT1NOc2tnUjNRZnhVWTJrejViTVo5?=
 =?utf-8?B?cFY3ekVJcUlXWVhuM1hucGxsbkk5T29iOXpwS0l1VVhnU29JYkFKVDlVQzl1?=
 =?utf-8?B?L2I3RFBqeThISU5Jc2NRR1FjaDA5R0ZPTlNPQkxiSDRqYThZM0VmU01ZcFBF?=
 =?utf-8?B?clFaSTVudVFIUEp3ZFRCQU43YVZkZEhFeWxkVnBSVERkMy9XcG9CT0NpTEFB?=
 =?utf-8?B?bk1hMkFkeDUwaDBseWxXMm1OSzkrNndLWE44Ykg5bDZsU05lMUZybUUwdGpk?=
 =?utf-8?B?eWxVNGtvN08rZHAvRzR3c01tRTI1SlZvU3llMXZvS1V1OU9RaythNHAwR2xD?=
 =?utf-8?B?cG1jelpmaDFVNDZkMVJZbTB6WGtJMXhCUWh4a1pkZSt1NGJHb1cvQ290WDla?=
 =?utf-8?B?VlgxSDBubG5FMiswOVcrZWV6allvSkhTY2VIRlR5bVdsUmUxdGtqcXZpR0E5?=
 =?utf-8?B?ZERCUnZKSi9FZjdHZFRvUFQwTHBlOGY5bTNYVUVuZEgyZXUrNWZQRmNQNDFR?=
 =?utf-8?B?ZS83S05vQmZ5YkhQYWNYK1JkcnlyWVNYUzRpdlhWcjVZcnVQa3JnRTY1aHd5?=
 =?utf-8?B?VmdxMDVaRzNOMXpOQWNNQy9lcGlEU0ZLMDhDTU1uSy9xcnEzL3dqZVhHcFk0?=
 =?utf-8?B?WEFPRCsycGhHc1BjSm1HNVFFd294L1luOW9udm10WHZETmZQSEFIVUUwc0lZ?=
 =?utf-8?B?MEZMbWd1cmE0d2J6RUhtd2lkRzdRd290bitpbDVBQnBiVHFMUXIxTkovbElq?=
 =?utf-8?B?ZlpWam5QY01LcFY2dUZJVDA4R3ZoYWRzUkFnakZwcEdVbW9KTVpvUVZmRG9Y?=
 =?utf-8?B?bm8xQ3o3TjJwWlV1SEtHQTA0Y0Fnbk02L0RyQ21vSDRXZW5qc0IrdUZoamtl?=
 =?utf-8?B?QnM0dVZZYXp3RVlYTTF4cVZmYm5ITm9JNytzTlB4VFMzNkdYa1lYUW1rQ0NQ?=
 =?utf-8?B?NkoyTUI3djZMSzlSTjhTdjlPQ0pvbzlPbUZQUXc0YkNYT1JNT3NTQ29WQVhp?=
 =?utf-8?B?dld1UC9XU3k3TTM0S3lQZ2tYRHNVaFVwTUd4YXhML3BWZXZmaGVOc3VuNTJD?=
 =?utf-8?B?NUYrR0JWZEZHNjZ4R2RwWmxuTTFiVmQ2L3ZzdFpmRHJsUHlScVVuV3lRaVJC?=
 =?utf-8?B?MnRzZXdnVzZ5NzBSNVlFdkJaMnpNS2Zpbk5HNXN6cFhVMWN2ZXd0bmRJMTVF?=
 =?utf-8?B?YkpySlZNTjhpbUlJMm1kdS9HZEZWdkFxTzVPSlFKVzRWTG1qNGg1MFJPMkxI?=
 =?utf-8?B?M25RQzZpNi9QTWFvdzNUQXQyVmpEaFp0MzJRd0pEejN4Y3R4aTNEOU5Ob25o?=
 =?utf-8?B?L3FSSEhKMW1GaE1ObzBPcjNuYStaNGhSWWdiUktHVmNkUXE5SkFZdzdsS0RS?=
 =?utf-8?B?cENTbitLRXVmdlFwc2FDbzB5NXEwYVowWlNFQVgydllZckpRaURmdmIrNFRS?=
 =?utf-8?B?RkZucGNsQTUrUk90Sm81T0FtODhJeG82c0craEFUVCtqSXBKR0FEeFJiRXAv?=
 =?utf-8?B?bDF1bnBJaUczZkhzN3E3eGl5VDBDdUZhUFBGcXlVbGdINGhEeUhHRGpLZmF5?=
 =?utf-8?B?bDhXSmpqNmtTMHcvbVhtalMva1hFdWVXQ0VnV3cvVElSOXBMYW9xWERjK1ZX?=
 =?utf-8?B?ZzdLTUhVUG9CZmxQNHg4c0ZjbUZnM1crM3ludndWbnJTSTRrOER3NlFZYWJF?=
 =?utf-8?Q?S+H4njhYesT/b+H0L1DeCnn+j/bgU1GAk9Fe/Y2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b524273-2c64-47a8-5434-08d97770eec4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 11:15:17.6970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buX4q2KgBa+ck5wZZv/i7p959I2i8O+Ne6iDNA7jBjmOG9yB+4WRWHBpxjJZBzDMBdLic0GddyhZRG5X79AS4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2922
X-OriginatorOrg: citrix.com

On Tue, Sep 14, 2021 at 11:03:23AM +0200, Jan Beulich wrote:
> On 14.09.2021 10:32, Roger Pau Monné wrote:
> > On Tue, Sep 07, 2021 at 12:04:34PM +0200, Jan Beulich wrote:
> >> In order to try to debug hypervisor side breakage from XSA-378 I found
> >> myself urged to finally give PVH Dom0 a try. Sadly things didn't work
> >> quite as expected. In the course of investigating these issues I actually
> >> spotted one piece of PV Dom0 breakage as well, a fix for which is also
> >> included here.
> >>
> >> There are two immediate remaining issues (also mentioned in affected
> >> patches):
> >>
> >> 1) It is not clear to me how PCI device reporting is to work. PV Dom0
> >>    reports devices as they're discovered, including ones the hypervisor
> >>    may not have been able to discover itself (ones on segments other
> >>    than 0 or hotplugged ones). The respective hypercall, however, is
> >>    inaccessible to PVH Dom0. Depending on the answer to this, either
> >>    the hypervisor will need changing (to permit the call) or patch 2
> >>    here will need further refinement.
> > 
> > I would rather prefer if we could limit the hypercall usage to only
> > report hotplugged segments to Xen. Then Xen would have to scan the
> > segment when reported and add any devices found.
> > 
> > Such hypercall must be used before dom0 tries to access any device, as
> > otherwise the BARs won't be mapped in the second stage translation and
> > the traps for the MCFG area won't be setup either.
> 
> This might work if hotplugging would only ever be of segments, and not
> of individual devices. Yet the latter is, I think, a common case (as
> far as hotplugging itself is "common").

Right, I agree to use hypercalls to report either hotplugged segments
or devices. However I would like to avoid mandating usage of the
hypercall for non-hotplug stuff, as then OSes not having hotplug
support don't really need to care about making use of those
hypercalls.

> Also don't forget about SR-IOV VFs - they would typically not be there
> when booting. They would materialize when the PF driver initializes
> the device. This is, I think, something that can be dealt with by
> intercepting writes to the SR-IOV capability.

My plan was to indeed trap SR-IOV capability accesses, see:

https://lore.kernel.org/xen-devel/20180717094830.54806-1-roger.pau@citrix.com/

I just don't have time ATM to continue this work.

> But I wonder whether
> there might be other cases where devices become "visible" only while
> the Dom0 kernel is already running.

I would consider those kind of hotplug devices, and hence would
require the use of the hypercall in order to notify Xen about them.

> >> 2) Dom0, unlike in the PV case, cannot access the screen (to use as a
> >>    console) when in a non-default mode (i.e. not 80x25 text), as the
> >>    necessary information (in particular about VESA-bases LFB modes) is
> >>    not communicated. On the hypervisor side this looks like deliberate
> >>    behavior, but it is unclear to me what the intentions were towards
> >>    an alternative model. (X may be able to access the screen depending
> >>    on whether it has a suitable driver besides the presently unusable
> >>    /dev/fb<N> based one.)
> > 
> > I had to admit most of my boxes are headless servers, albeit I have
> > one NUC I can use to test gfx stuff, so I don't really use gfx output
> > with Xen.
> > 
> > As I understand such information is fetched from the BIOS and passed
> > into Xen, which should then hand it over to the dom0 kernel?
> 
> That's how PV Dom0 learns of the information, yes. See
> fill_console_start_info(). (I'm in the process of eliminating the
> need for some of the "fetch from BIOS" in Xen right now, but that's
> not going to get us as far as being able to delete that code, no
> matter how much in particular Andrew would like that to happen.)
> 
> > I guess the only way for Linux dom0 kernel to fetch that information
> > would be to emulate the BIOS or drop into realmode and issue the BIOS
> > calls?
> 
> Native Linux gets this information passed from the boot loader, I think
> (except in the EFI case, as per below).
> 
> > Is that an issue on UEFI also, or there dom0 can fetch the framebuffer
> > info using the PV EFI interface?
> 
> There it's EFI boot services functions which can be invoked before
> leaving boot services (in the native case). Aiui the PVH entry point
> lives logically past any EFI boot services interaction, and hence
> using them is not an option (if there was EFI firmware present in Dom0
> in the first place, which I consider difficult all by itself - this
> can't be the physical system's firmware, but I also don't see where
> virtual firmware would be taken from).
> 
> There is no PV EFI interface to obtain video information. With the
> needed information getting passed via start_info, PV has no need for
> such, and I would be hesitant to add a fundamentally redundant
> interface for PVH. The more that the information needed isn't EFI-
> specific at all.

I think our only option is to expand the HVM start info information to
convey that data from Xen into dom0.

Thanks, Roger.

