Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198993BA299
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 17:12:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149178.275785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzKpI-0004uP-Lq; Fri, 02 Jul 2021 15:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149178.275785; Fri, 02 Jul 2021 15:11:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzKpI-0004rW-I1; Fri, 02 Jul 2021 15:11:32 +0000
Received: by outflank-mailman (input) for mailman id 149178;
 Fri, 02 Jul 2021 15:11:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wENR=L2=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1lzKpG-0004rA-87
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 15:11:30 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c64f449a-db47-11eb-83b6-12813bfff9fa;
 Fri, 02 Jul 2021 15:11:28 +0000 (UTC)
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
X-Inumbo-ID: c64f449a-db47-11eb-83b6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625238689;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JI+dDqQPttl8nzl/yOMoLNzy4H96SN8XpCcjUNK2YwM=;
  b=RySVpkIf6bfxpGj0Koa4Z/y321q7H6TI8wGRMLVce22Yr75LF7A05wLq
   vTV4BNz3T77ly+My8gMGC2qDeIDiX029CsZqitwMSN/ZY0RbC6h2Bskr1
   eBeAPjkb8nq/qI0OpKt7oKoSCdiIfWKc4iqbduWzMfzTK/QZ5VCaSZrRa
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7/nf6TXk7FrQch/Gw677QhGLfCPjL7mDCrOnJtasPrGpclEp2TAuvuJPe7OHw4OtaiXzM0ObuO
 4QXB+M1hc7QZJ+RMtV7VzBWitP1ne2CFHRRFN7RW7hEOsH+CLbH2yxbbmtcVknU8azrkXzL1As
 upGF02rXXDMey4k2U8nmekaBwEA5eU3H0d6yzuGLBLVex80NAr9gN42itnqPWuQCRadw1yCKBv
 vowcNkhvgWXb4gB1lWEls6CAHHcydP2MmgjOnm4YWKecW376wtJiIgavg6IKSp9+ADaljkQz8w
 CHw=
X-SBRS: 5.1
X-MesageID: 47465486
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IlFjX62MGfcf3nVHnik3BQqjBA4kLtp133Aq2lEZdPU1SL3nqy
 nKppomPHDP+VUssR0b6K290Yi7MBbhHNtOkPIs1NSZLXbbUQmTXfhfBOLZqlWLexEWtNQtrZ
 uIGJIOauEYeGIK6/oSjjPIb+rJsLO8m5xBq43lvhNQpdwGUc5dBzMSMHftLqUJLjM2dKbQMv
 enl7l6T0nLQxkqR/X+LXEfRODIu9DC0KnMRFo6HAI89QWCyRyv86DzCBWVxX4lPw+mtt0ZgB
 z4e32S3NTSjxnIoCWspVP73tB4nt39xsArPq2xY7AuW0/RY32TFeNcsmK5zUUInN0=
X-IronPort-AV: E=Sophos;i="5.83,317,1616472000"; 
   d="scan'208";a="47465486"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhx6vNeM4jkOXXPw7dkciqz6Ot6hen26hr5zASHvgaz+oNV1cUB75FcJviSpYDuLRUK8rp83H6RDDhLKP2KTHWoo1WOBbIvtRWLlbfhWMtNhV2ZJnsK0+Z4haD1Z15gsob3//Af9qiofUhkV4DGKu+SBRQ7Vdtj5b3Pxbx6GjpaVph+ZqaH++BCAh1jMokb18yrbSkN6Pe6U9Ye4iFOioeZZnfL6bi+DybxZo1F11r01zG4oTWDz8syqjV3sNbElA1UIlIVbxBE97cDE4WSS8rxoW2H5kzznfH2+CWcRalRNrb/WVAuhBAq5UqwUtmxNQGKTpXPL5NlsCiPbx3aQ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wp9CG1bfiQgdmUIW+LcgwupYphZ5zCiU5UJbXg//STM=;
 b=IimciG5FkO+18HUQe/WG6ssRs5/lO1AEUEXC/bEYU1GkLdDMo2oW0hQ/4GG9vYlyYzHvhwwQoiC5dZlejcQ87YjEdTDGSQ4OqvXkBALeYbizVdsfExLuXL2Y8q68IyGQ5aYu9GH2KsgH8kAfXwucCD7X8PqbXuHosDoy4uiOWX35KSOhaFsRMr8I+EyMaYAHUkfitv2C+0M6dBTiCPsR9D4lKGlouLm6ytt6Y8Puzqk8Gm8m9Zjal5vBWK1DHZFutX7vT0bFZreL28e/bj3WsJ5X5IFMT7HCvyZt5zdaztPg9hxrtTu5n6sOPwOQJIfI0dZSq3YiXkv2CyfPmdxhKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wp9CG1bfiQgdmUIW+LcgwupYphZ5zCiU5UJbXg//STM=;
 b=fqs5gS4dK7WaREEA0sXhi29dMGJYaxAAh3VAeekT25x5KAW/h78gicDUhZQzr6C99EEEhkkgA9zCr/mpzwHbLR9KeMFFK6/ivTVsfyT5lCMnJ8nanBvuO6CocoNf2k0VCl2dBgYod89QVGA2Ic0EI5H8lCB1JG36h8dXHY0pJSA=
Subject: Re: [PATCH v20210701 04/40] tools: use integer division in
 convert-legacy-stream
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-5-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4db50fa9-638f-97e1-1b1c-e044cf4714d7@citrix.com>
Date: Fri, 2 Jul 2021 16:10:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701095635.15648-5-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0069.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::33) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4ee487f-3d75-4cc0-a2f8-08d93d6b9a4d
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6224:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6224F9881D3B777CA26E436FBA1F9@SJ0PR03MB6224.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:196;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3UHYVmzWYpq75pAXO68zFgujrEweUH/lM/Pkpk4Q/4GbmJ8dorcJjzmgQk00ow/pVemdwF46pmhp58nt3k3PxybXPBXKiknmW1XNHy/Hvwk0sMBxUUyDFkI4AJA3sOBvwC4xDRCY8geqBcB+magweORg3fqtnlC7dtFzuR4IYgczGc0ETtr1JKjg7ikkKhwMEl9FwrHZ2Epv6e9FlBWTFNLpL/9Hurs4ejeLrdVTGGAV/jx2rM9bofv3Uq5P4Y5XX3nTFq/dMCvCzA34VrtgW/CAR2jF56FQzQNGDwR0/aXvC2sO7pBApFqlu5aaaZle4JLvpUk5OTklxjNjBSrIFT4WZs5Q4Z8NTXL5BldxUcz6ypiYkK2En6ehT4hab4F2vA6sCrtcu7FvN1PFoYYMTq/NH4eZ0/poexNnWuOfxInf+mAfOHU+oD3hapB05iCZq0Glhc4TqzSPeMTAHY7sKnUE7v6yND3jwBIy6zh2zJGzUsZWpw7M6l1uwuNxQnGNrMKuZ3W9PRs7hsxuM15acfVpe4rc1FYFNYhH05IXKFSTkNwlbLLpvfYJHybmA8haeoacM88p8LzPr8P9Q+Z52PbyTdgfxb51FH+KMSpVAAoFSoXFWhrBJ0aWkid93w6XPQ9/XmjarM2tQ7LI5itveBemn0szxrwCJZx9HXXYaTqa1ciUhGSBcypQ+Rth8sZrMhVHezzMI63QfEtBrrhnQq2N/iDk2w0bNO1A8RBI5Ydt5ihbKfuFF12k8MH8r3FN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(16526019)(5660300002)(53546011)(186003)(86362001)(31686004)(2906002)(6486002)(4744005)(31696002)(66476007)(54906003)(478600001)(26005)(16576012)(956004)(2616005)(66946007)(6666004)(36756003)(66556008)(8936002)(38100700002)(316002)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUFYYlZhVVFPS1hxdjdWM3BHL2dYTGx6NnJSYXJka3hDbFlNZWZ4WkRUb0lJ?=
 =?utf-8?B?bEpjR3hTbEJTdjVlQjFWQlEzZEQ5Vm5lQzR0Uk5XdzFTQjg0dUdncmo1M0lU?=
 =?utf-8?B?NFEzczd0RmxqUlNaQjhseHFKd0RxT1l4SVBaSTAzdEtXdFNFRTV1TkZnQ1Zv?=
 =?utf-8?B?bHh6MWdQdnRoVy90YkFGbDZFSGpFK3VqTzBBSVBjODVSajAwdms0bnExTDUz?=
 =?utf-8?B?UGd4emNtY0NteE9zQW9JeGRLZ0dvSU9lS3owWjUyUnpqQnpFSlpUYWxyQ1pG?=
 =?utf-8?B?cnBiMjVMb2dEeGJXWldidldPQVhlRTFpSTgxVE5GMUVuY3hYdk9zTzlVb21h?=
 =?utf-8?B?ZWtrR2pYcVc5SnM0cm1mWmhrdXpYK0JLclRMcTNJNmRacVArTGdidXBvczlr?=
 =?utf-8?B?NVBHRno5Wm9vSmVCT3gyeW5qQjZXcXhGS1M4OHpwK3JmQ0pRSUc0K1dMUkMz?=
 =?utf-8?B?SEJMd1FHWmFHRWFFQTF4bzFMamxFOEM0c2U0THJWMElXVFdrYUNJK1AyWnhs?=
 =?utf-8?B?WFdtajNhdXhkR0Z2ZVQ4ZzF5cG44TUVmRDR0MXVwTFhST1J0UXl0TkZpQ2hJ?=
 =?utf-8?B?VzNvSnZDb2ZZaElyRk9kRURjQjlaem0zaXVGSGlRQjRlelNxc0lXK1dCdXNW?=
 =?utf-8?B?eG9PenRjTittOGlPd3diSkFwZksrYXBEeVJmOXd5cWR5ZkcwalNUMFhsSGxq?=
 =?utf-8?B?d3NUaVRzb2NCclF0TmNzaW51dzBBZDNqSmFoK1o0R1MrdCtSOGJTamY2U3F5?=
 =?utf-8?B?V2RXa2FHNHpHODFGWGVKMlo1dXYrUEV6cnpVcnArTzJOL0tJZTNoZVQ1Znpo?=
 =?utf-8?B?eTByRFNWNUJOVHI3cTJpK1ZrODBETDZWU2RraWd6T1g4aktxV2xBRlhaU2pz?=
 =?utf-8?B?LzQ0Vy8yUzhtYWtjYTA4R0VYblBvQTl6TFI5aFF0djI5WGJmOTgwMXM2RmxT?=
 =?utf-8?B?c2VEaVVsQ3Uvbnl0MUMxRzhvNFM5NkpuYnk5YWlaZlRJWkswc0JITFJJcjVB?=
 =?utf-8?B?U0d1dWVlNlp4SFV4VDh3MkllWUZGVFRGSG4zMjhJZ244S0p4S3NlUVhqb0pR?=
 =?utf-8?B?QUhQOHBDR0hBTW10Snc0dnlmd3RPN2tLU0p2OW5ZTFphQjdhNjZVdXkwanVH?=
 =?utf-8?B?MUlYbERpT1g5dzlVdEV3T3JSV0RhSHVFUi9xSmlIWklGWkJPdDNnb3VaNWJh?=
 =?utf-8?B?b0syNzZERnBKNFBmZVZwK0JLZDhhT2ViT1BMK0FmM1AzWXloSjJuVit4M3pG?=
 =?utf-8?B?UWFXTENHRXgrakdXNUZ6WkdPWHcwN3hROWM4MTF6anFwdXQvZjNUOWR3bmtr?=
 =?utf-8?B?TWppVHNMdUNQblZoL0RXbmVGdDdIb1ZiK2hKaGtDMDU3REMrRmY3Vk5YNnNk?=
 =?utf-8?B?SDFlVWVoSWY2VTg1MloyUW9vaTVURHg5d28zM25QYmZDQ1FVSmk3Z3krL3VQ?=
 =?utf-8?B?SWhyajAyMDFMMlRYWkxHc1pQcGxjY0t1WW1hTVpsS1pOTjhpMklxRzlyUE5N?=
 =?utf-8?B?L2wyeHpnalJYOVhEclVWODE2WlpPOGJ5bnBOeDk5MElLR2htSGU2bEhkeWkx?=
 =?utf-8?B?VzlMS3NrQ2FCdTFtTHNrU1M5b0txRUVXMVRsckJDaWFDb0JBTExlUStMc0NY?=
 =?utf-8?B?WjJVTzJKcExGbVM5QXNvS1JTTmZKVWJuMTZONFhmY3FGOUZWNFQ3Z0tSMW9x?=
 =?utf-8?B?cUtMZGZjNXNyWjh3WnpmN1lSTVBrSFIzZWd0UzkweHdFUlJXWFU3NURXQjVF?=
 =?utf-8?Q?LaoCvaM/we8G9kCG4utSVujkJI7FIcTSvUt1Wop?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ee487f-3d75-4cc0-a2f8-08d93d6b9a4d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 15:11:01.5116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZ/DKHpqeGYQAf5Q/sOGFelI3QKBQ9+hGJLsM9QqRk7NyHQ0tN76fdZYQR5EFYeBZIXp/l313O4AD5GD9iG/HvnpwZk2iUh4Pj37kcKTSm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6224
X-OriginatorOrg: citrix.com

On 01/07/2021 10:55, Olaf Hering wrote:
> A single slash gives a float, a double slash gives an int.
>
>     bitmap = unpack_exact("Q" * ((max_id/64) + 1))
> TypeError: can't multiply sequence by non-int of type 'float'
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

