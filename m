Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E6B35C45A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 12:49:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108949.207918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVu8B-00087e-Gd; Mon, 12 Apr 2021 10:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108949.207918; Mon, 12 Apr 2021 10:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVu8B-00087H-Bq; Mon, 12 Apr 2021 10:49:23 +0000
Received: by outflank-mailman (input) for mailman id 108949;
 Mon, 12 Apr 2021 10:49:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L7uB=JJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lVu89-000878-UY
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 10:49:21 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d4cc9b1-a9cc-4bb4-a738-3fd3124f9a31;
 Mon, 12 Apr 2021 10:49:19 +0000 (UTC)
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
X-Inumbo-ID: 4d4cc9b1-a9cc-4bb4-a738-3fd3124f9a31
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618224559;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xsfYMNiNmShVY9r2Hl9Lxybvzxiu/AifYoCyWl6go6Y=;
  b=L9dSwZOd1LX/UrbPM23CFO5Y5SB6XJq2/Ykxdgr2zLuzztMEdNjUIgrs
   SEOL+fPwG03UjQQ5VplXU//G0g1l3xL8blxek2vNBGGv4Pa2MUmknOSQ1
   boHbUgGZ1vxSahOp6zMEUlY1ovqE5PJoMaxMOh8mUv+PVBFmbPOpY3Xnf
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zN8H6dDvEiU7vg337qsTaH3kjb66YyvvHNi7N/j9d2XzB7L8SDpLx9ASC6/nPksFZgPznfBPY4
 2PtJA3/K6PndmNin5cpwrJtelNCe2m9h8r69X/5YyTzvVvPMMbGbUkvak0ScO2/kCILQw8kDVn
 YgABKEv5g5AUQ1OcQxhxfT4v2slHdcE73lEbF4ecBWj1TbyovqaKLAtDVeP5N26jJA/aKZB1rG
 WMErs034UHHDmTLGAEV5Ku0/byXui5p/Zm2sLHZpNbv3EdGnpuZWfiPFzZPnWtFM8rdYeJPm/O
 0SA=
X-SBRS: 5.1
X-MesageID: 41507725
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:U+ViSqBp/YJ7TqblHegctMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPufVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VHdMgXE3Kpm2a
 9kGpISNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0NcShBQchbnmBEIyycFVB7QxQDKJoiDZ
 yH5tdGoT3IQwVsUu2QAH4ZU+/f4+DRnJX9bhIcQzIh4g+CjTSngYSKbiSw9BEYTj9J3PMe4X
 HI+jaJnZmLntOa7lvn12HV54lLg9eJ8LV+LeGFl8R9EESPti+Gf4JkMofy2QwdgObq01oylc
 mJnhFIBbUO11r0XkWY5STgwBPh1jFG0Q6T9Xa9jWH4qcL0ABIWYvAx/L5xSRfS50o+sNwU6s
 sitAj4xvknfy/opyjz68PFUBtnjCOP0AIfuNUekmBFVs8mYKJRxLZvjX99KosKHy7x9ekcYY
 9TJfzbjcwmFW+yXjTyu2lix8GURXIjHhuKaVhqgL3q7xFm2F9+1EcW38oZgzMp8488UYBN46
 D+Pr1vj6wmdL5bUYtNQMM6BeenAG3ERhzBdEqUPFTcDakCf1bAsYT+7rkZ7PyjEaZ4g6caqd
 Dkahd1pGQyc0XhBYmlx5tQ6C3AR227QHDE1txez4IRgMy9eJPbdQm4DHw+mcqppPsSRufBXe
 yoBZ5QC/j/aUPzBIdy2RHkUZU6EwhebOQl/vIAH36eqMPCLYPn8sbBduzIGbbrGTE4HkzlBH
 8uWyXyOdVg4kinVmSQummSZ1rdPmjEub5gGqnT+OYejKIXMJdXjwQTgVOlouGHQAcy95AeTQ
 9bGvfKg6m7rW658SLj9GNyICdQCU5T/fHFW3NOrgkaDlPsfd84ypGiUFEX+EHCCg50TsvQHg
 IajU9w47iLI5uZwj1nLN67LGSAjT82qGiRR5kR3o2PjP2VNK8QP9IDYuhcBA/LHxt6lUJBs2
 FYcjIJQUfZC3fJkqWqjJsdAcnFbNliiAKXIcpZwEiv9nm0lIUKfD82TjSuWcmYjUIFXDxPnG
 B89KcZnf69gzq1EHA+h+45KVVIT2ySDNt9fUO4TbQRvoquVBB7TG+MizDfrx0oYGLl+38fgX
 HbITSOdevGBUdcvX5kwr/nmWkEBVm1TgZVUDRXoId9HWPJtjJI3eiHarGa/kGRZlEBq9ttew
 3tUH83GEdD1tq33BmalHK+Dn0g3IwpJfGYJq8kaavv1nSkL5ComakKE+RPxotsMMnjv4YwIK
 SiUj7QCAm9J/Ii2gSTqHpgBTJ9r2M8l+j0nDLi92q10RcEcIzvCWUjY4teBd6S72LpHanVlL
 p4iM84puu2PCHabMWcxaTecj5ELVfyrAeNPpUVgKERmZh3kr15W6T/e3/v8lps2R0lNsf6lE
 8EWs1Akfj8E74qW/ZXQj5T+1oiqc+GI0QquDHnG+NWRyBZs1bre/eyp4fSobUhAke9tBL9FF
 mW/Spa5erEVUK4pMknIpN1BWRdc04n7nt+uMuEao3LEQ2vHtsztmaSAzuYcLVHTrKCFqhVhh
 Fm48uQl+vSUybjwgjfsX9aJa1JmlzXDP+aMUapGeRS9ca9NknJqqy24NSrhDOycACFUS0j9M
 R4XH1VSN9ChDkkhJA21Sb3apWfmDNbr3JupRd9llDs3YC65nz8Bk8uC3yBvqlr
X-IronPort-AV: E=Sophos;i="5.82,216,1613451600"; 
   d="scan'208";a="41507725"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIXdzICvgVyGblKvCympIQMbONN3uKnEvQei5qANv6S1+hlJaNvdE0un22agFItBvpSWQSA+GI6EieWfoTpO3Gqpp403f0RpZniQhthaXtvj6Zh0F7cpwNleLqKNvp68qX6YxdILGJL6W5L+knZ5Uk37BskyxSRDsueMoj3hymorJ5MBnASzU6HYoFFqUWRCrBeJLQT9pR47ng6W716sw6jUxAX0Nc7v15G2UsokwELzFi+q0rwj1SimDJfIZrUld53L14mXs//+EdMUKRVsTaGtkpJaOCjQTt9N4WvE99l2eB1s73UodSyMMkW/oSS2RXPPQdFtrDRnXBhk5E8qVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLwZwoXCHPPOndlESmbZP7fgbNGe+Ph3PjQ1pv/pdRo=;
 b=Kl5VrPR6euAnqHBl+gY9RY0mZ+1IFRI5oE6nX7in/BpgaGvYR37ozTeN3ZB/c3wwlgXMYyGIRguTIA2Eb0DygmtVm4c/avqZWXUpFWrFK3fUveSWqNMtBKUc9hKP69zeoqGTQDp5WhBMBBAmj9GfORkj5y3PVun8+02AlEzVVazBXAi0xMJKyFciwEUf4ZY8mWuP8nZDnmvEegcSv7FSCl28YR1NEEIZ5ne6MH6WqqAH0tFjKFLfsdxRlZaPjBehWiCQEsNiiJhebl3sQWxLkyr5nx76+fQu01fd6F2/xHXn97WtM9s8oDT/4P1kDpU8WFxsHJBOQGChE9SvFwtaSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLwZwoXCHPPOndlESmbZP7fgbNGe+Ph3PjQ1pv/pdRo=;
 b=rTMgIcr42fvpBIx5mJ9KzoXGYp3AtQhfx0uvpiTzRq6onMRGRpnjFVMe3f8FSZX0f8S5UR0Rdps834q5fct34sFQZ5FmDcCJJFfFY9rOlseKfoyE1rrzH0JfsMAIGYl+E5ZjEVJVGRsd4aw0h2JtK/nnfNG1BKr+bigRyca0HjY=
Date: Mon, 12 Apr 2021 12:49:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <rahul.singh@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Message-ID: <YHQlptvoC06rqNhQ@Air-de-Roger>
References: <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
X-ClientProxiedBy: MR2P264CA0118.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6442ea70-8ea7-4f6c-623c-08d8fda09e20
X-MS-TrafficTypeDiagnostic: DM6PR03MB3577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB35777C4DA3E62626638097508F709@DM6PR03MB3577.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ixe/774MWG6lIGzec3xdPy2l695ktcHajWgaTuZTtjmYDiSnE8AUO6xpbNSFx/5FP9Uajd6YvIbu+Um1+67kgJMUdk8CHlNCLw+xeZq5qBjzJPhUH7mRJH8jHvBIy+cI0XpNlG8mJnK3vWqSUNcOohrSoXtIRzNe1759/4jR9S6KqGlnaUfdThBnND+v+JxO40z59jQnx1cV9jdPxf758xOHNQACYtmI7hrPi+UxQYC0pvlok061IHslI3oIoGkoz05ERunjma3D3A0HVlXdR7AZ9C2Oe0DnJ0hJ/BmH7w61pz5fTocHNVGF3AuybAFv66cvZrQ226xcb9Tzu8+QGmXEQtNgL/RFFMGVNG1Wi16Gl5uUD3RLtIl6QhT1gr1gH1rANB3lCGtqfqnspNXziW0LaJsvbfNEtG6fZo2cGAuxeunRvGfCSQZdVPZMA01Aa8VzyjqvpUbIC7h8wo87fW0JB7MshDl7SzZGwsXHa1J587fSRdnJ/wHp6Wo63AOHgkSWykGeGSp4IfF6TyQYlw4dSnCIPcAzCrEhcqsL9NZaFdC394bU6Ndu8x2vOKQ7/5fo6yq4LltIeS0ZIb3TuVbJtFnzbrWipdN6R2mnqeX5MEeZpjfGDGFVc4ofN1PlRvZTD38eU0+jvMb+bds3jYoezkPqt68Gen6KW+66Fw/ejhiD9B1z6IyN1RCz/6gbXFCRzxOST09rRWTnZ2uOugb5TWcm1EE7p78vFaFIT4s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(66476007)(8936002)(86362001)(2906002)(66556008)(66946007)(85182001)(478600001)(38100700002)(30864003)(6486002)(5660300002)(16526019)(4326008)(7416002)(54906003)(316002)(6496006)(6916009)(8676002)(186003)(6666004)(26005)(9686003)(83380400001)(33716001)(956004)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dklremhVbFJ4bUl4UVI4b0trNml0SkRwclJuWW9qUzZxYkpGVHVIMUc1VUlq?=
 =?utf-8?B?dkF1cmVWbWZkdnNYQTRIcEtnc2ExbW9UZkp6OEg5VVZZamVJK2V6SkxmcWJL?=
 =?utf-8?B?Uk1VaWY0V1FzUGROdnlmYVhTbU5VV21wSHo0dmFFT0t4dkxISVRvQUMrdTRr?=
 =?utf-8?B?UlhPQ0pyWVJyYk9Kang2dU9TamYvZmJIZ0REUEl2YnpLbXpKc0hsdUNxSC9L?=
 =?utf-8?B?QjdJd0dQNk9UeHNyNll0eDNxazM4OStYRDV2OUxRZG5VcFZJaVpJdkZHQVBx?=
 =?utf-8?B?cmRMYW5XT0NMNzY2QTIzRmg3czF5cjg2MTQxUiswWWkySVNOUHVMMVFFcHFC?=
 =?utf-8?B?Yk1hNkNWcU0vdzFPK0lRZFFxMHpXc05nQUNyblhuVk56SVdLT2xsZU04V2p1?=
 =?utf-8?B?SEtiQkszM0hMWXFzbjIwZENpNnRQRm9pT3lQVE1zMFlCQUxHWGowd29UZ3Q4?=
 =?utf-8?B?aXJwV0VBZHVwRFZLRXZGY1VVMDBxZjhreHVOUDdkUGlUVHBneGRoTy93L1dt?=
 =?utf-8?B?R2tsN1N0OXlqOFNIY0lidUJNZXlCRUd4eUMvVGZ4Q0FuOThLUmh2OXNkSisr?=
 =?utf-8?B?R1RQVkVTWmFpeFhKYzFVODBudXhmUTBtL0lGR3lZeGRGRVNCU3A4amt0V1dx?=
 =?utf-8?B?blNPWTRBNkl1UkJNcFRheGRvUGI1N2w3R01SNXJNYnYwZ2k2SGZoZXp6RWlj?=
 =?utf-8?B?L3VPMmpQT1k1S1M4aXV4OFVSUmlRVkhEYllJMk1PUVVWZWFyVkxNZmN0UXMy?=
 =?utf-8?B?VTNYeFJRS2tSS3ZoR2ZnaUkzQTdmdHY4MmJqTUpiTy9uek82b1JxRWk4SldG?=
 =?utf-8?B?UXU4ZUpjNEUzTWtXeXlObk1uZUN0N051WTV1dFhQNVNyM3VXeDhrU2VkK2hB?=
 =?utf-8?B?M2pQbUpBc25Bd2pFM3o0eE9ETENaKzhONEU3b3dxS0RJREpxRjdCSndka3A1?=
 =?utf-8?B?OTgxQjlHWTl4WnFubWtzaXp3L1NpOEpXWkJmWm15bHhTbmxTSDRlRzI2bFg5?=
 =?utf-8?B?UXpYdk5aRWlqVk1Kby9vN1JXSUdsVmw1RGlEdE5xRE1BUGZQUHNjaDc0Y1VR?=
 =?utf-8?B?SWQ0L1hQeWF2U21LdGNHaE5rV2VWKzQ1cnBhd05zN1h6cnBkcVE5T1pvWklN?=
 =?utf-8?B?djM5elcxa1drY3dBVlJHRDJSNjFZVUlydmFDYVFZOHQ0S1J4akNiWElOVGQ2?=
 =?utf-8?B?ZUMrOG9RckJvT1MwSGE5SlJqZC9oNlMyQjBsdEwvUUdKRElWVW9TQTJyOEtI?=
 =?utf-8?B?UTJHQWVUcHhibDdYOVpJQnErYTVYcEd1VlYzZUtMbEl1ZWV2NmlaaEE2WUZJ?=
 =?utf-8?B?Y0ZwNGRyZlZITkdEaG4vK05IdGs0dzh3ZHNTem56L2pXck9kTGhMUWxDY1Mz?=
 =?utf-8?B?ZUZaUmR2QUw0cEQwMjJhUGE2WU9sQlNxb3NHaDlUM2I3bVZucWpsdFlRdWUx?=
 =?utf-8?B?aHNkWVJWajBOM2d6SWtmMjVCaHBoemgvVGNBaTVhTVE0TGdTQmtCbGhFbCtT?=
 =?utf-8?B?UmordE1WYmhaTmV4bFdJZnhYT1IzNEE0MjVCN0dTUGMybGNwanQ0dldQbHVO?=
 =?utf-8?B?RzhrTWY0WUhFbE8yM20vbEsrSS9TL1ZHUUM1cEpwbTRXUWxoZ0dUeWlSWWNO?=
 =?utf-8?B?aThuZ2pMOWkvYXE2RHJPc1JnUzBQcmVlajkrK0VGL1AyeHBFMXBveTJWSEhj?=
 =?utf-8?B?QzRGbE1GOGJkWEljaXl3YWc2a0laanJFZXc3cWtTUzh4Y21xR01EZTBHZGM4?=
 =?utf-8?Q?DZfd/xkVFsbtkRrEuUWihH63BMrF6/xOTeZNy6q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6442ea70-8ea7-4f6c-623c-08d8fda09e20
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 10:49:16.3796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34bVAkM8yBJMtX2SEL2BZjODTvPAA2EhncXm1iCvpRbW40nf2XHDbEOqcv64sreMl2bM81XdOMJee+GTxkst0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3577
X-OriginatorOrg: citrix.com

On Fri, Apr 09, 2021 at 05:00:41PM +0100, Rahul Singh wrote:
> MSI related code in the "passthrough/pci.c” file is not useful for ARM
> when MSI interrupts are injected via GICv3 ITS.
> 
> Therefore introducing the new flag CONFIG_PCI_MSI_INTERCEPT to gate the
> MSI code for ARM in common code. Also move the arch-specific code to an
> arch-specific directory and implement the stub version for the unused
> code for ARM to avoid compilation error when HAS_PCI is enabled for ARM.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes since v1:
>  - Rename CONFIG_HAS_PCI_MSI to CONFIG_PCI_MSI_INTERCEPT
>  - Implement stub version of the unused function for ARM.
>  - Move unneeded function to x86 file.     
> ---
>  xen/arch/x86/msi.c            | 64 +++++++++++++++++++++++++++++++++++
>  xen/drivers/passthrough/pci.c | 51 +++++++---------------------
>  xen/drivers/pci/Kconfig       |  4 +++
>  xen/drivers/vpci/Makefile     |  3 +-
>  xen/drivers/vpci/header.c     | 19 +++--------
>  xen/drivers/vpci/msix.c       | 25 ++++++++++++++
>  xen/drivers/vpci/vpci.c       |  3 +-
>  xen/include/asm-arm/msi.h     | 44 ++++++++++++++++++++++++
>  xen/include/asm-x86/msi.h     |  4 +++
>  xen/include/xen/pci.h         | 11 +++---
>  xen/include/xen/vpci.h        | 24 ++++++++++++-
>  xen/xsm/flask/hooks.c         |  8 ++---
>  12 files changed, 195 insertions(+), 65 deletions(-)
>  create mode 100644 xen/include/asm-arm/msi.h
> 
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index 5febc0ea4b..a6356f4a63 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -1411,6 +1411,70 @@ void __init early_msi_init(void)
>          return;
>  }
>  
> +int alloc_pci_msi(struct pci_dev *pdev)

I would rather name it pci_msi_init...

> +{
> +    unsigned int pos;
> +
> +    INIT_LIST_HEAD(&pdev->msi_list);
> +
> +    pos = pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
> +                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSI);
> +    if ( pos )
> +    {
> +        uint16_t ctrl = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
> +
> +        pdev->msi_maxvec = multi_msi_capable(ctrl);
> +    }
> +
> +    pos = pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
> +                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSIX);
> +    if ( pos )
> +    {
> +        struct arch_msix *msix = xzalloc(struct arch_msix);
> +        uint16_t ctrl;
> +
> +        if ( !msix )
> +            return -ENOMEM;
> +
> +        spin_lock_init(&msix->table_lock);
> +
> +        ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
> +        msix->nr_entries = msix_table_size(ctrl);
> +
> +        pdev->msix = msix;
> +    }
> +
> +    return 0;
> +}
> +
> +void free_pci_msi(struct pci_dev *pdev)

...and pci_msi_free.

> +{
> +    xfree(pdev->msix);
> +}
> +
> +int pci_assign_msix_init(struct domain *d, struct pci_dev *pdev)

This kind of a confusing name - what about pci_msix_assign?

> +{
> +    int rc;
> +
> +    if ( pdev->msix )
> +    {
> +        rc = pci_reset_msix_state(pdev);
> +        if ( rc )
> +            return rc;
> +        msixtbl_init(d);
> +    }
> +
> +    return 0;
> +}
> +
> +void dump_pci_msi(struct pci_dev *pdev)
> +{
> +    struct msi_desc *msi;
> +
> +    list_for_each_entry ( msi, &pdev->msi_list, list )
> +        printk("%d ", msi->irq);
> +}

I wonder, those those function really want to be in a x86 specific
file? There's nothing x86 specific about them AFAICT.

Would it make sense to create a separate msi-intercept.c file with
those that gets included when CONFIG_PCI_MSI_INTERCEPT?

>  static void dump_msi(unsigned char key)
>  {
>      unsigned int irq;
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 705137f8be..1b473502a1 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -314,6 +314,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>  {
>      struct pci_dev *pdev;
>      unsigned int pos;
> +    int rc;
>  
>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>          if ( pdev->bus == bus && pdev->devfn == devfn )
> @@ -327,35 +328,12 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      *((u8*) &pdev->bus) = bus;
>      *((u8*) &pdev->devfn) = devfn;
>      pdev->domain = NULL;
> -    INIT_LIST_HEAD(&pdev->msi_list);
> -
> -    pos = pci_find_cap_offset(pseg->nr, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
> -                              PCI_CAP_ID_MSI);
> -    if ( pos )
> -    {
> -        uint16_t ctrl = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
> -
> -        pdev->msi_maxvec = multi_msi_capable(ctrl);
> -    }
>  
> -    pos = pci_find_cap_offset(pseg->nr, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
> -                              PCI_CAP_ID_MSIX);
> -    if ( pos )
> +    rc = alloc_pci_msi(pdev);
> +    if ( rc )
>      {
> -        struct arch_msix *msix = xzalloc(struct arch_msix);
> -        uint16_t ctrl;
> -
> -        if ( !msix )
> -        {
> -            xfree(pdev);
> -            return NULL;
> -        }
> -        spin_lock_init(&msix->table_lock);
> -
> -        ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
> -        msix->nr_entries = msix_table_size(ctrl);
> -
> -        pdev->msix = msix;
> +        xfree(pdev);
> +        return NULL;
>      }
>  
>      list_add(&pdev->alldevs_list, &pseg->alldevs_list);
> @@ -449,7 +427,7 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
>      }
>  
>      list_del(&pdev->alldevs_list);
> -    xfree(pdev->msix);
> +    free_pci_msi(pdev);
>      xfree(pdev);
>  }
>  
> @@ -1271,7 +1249,6 @@ bool_t pcie_aer_get_firmware_first(const struct pci_dev *pdev)
>  static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
>  {
>      struct pci_dev *pdev;
> -    struct msi_desc *msi;
>  
>      printk("==== segment %04x ====\n", pseg->nr);
>  
> @@ -1280,8 +1257,7 @@ static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
>          printk("%pp - %pd - node %-3d - MSIs < ",
>                 &pdev->sbdf, pdev->domain,
>                 (pdev->node != NUMA_NO_NODE) ? pdev->node : -1);
> -        list_for_each_entry ( msi, &pdev->msi_list, list )
> -               printk("%d ", msi->irq);
> +        dump_pci_msi(pdev);
>          printk(">\n");
>      }
>  
> @@ -1303,12 +1279,15 @@ static int __init setup_dump_pcidevs(void)
>  }
>  __initcall(setup_dump_pcidevs);
>  
> +
> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>  int iommu_update_ire_from_msi(
>      struct msi_desc *msi_desc, struct msi_msg *msg)
>  {
>      return iommu_intremap
>             ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
>  }
> +#endif

This is not exactly related to MSI intercepts, the IOMMU interrupt
remapping table will also be used for interrupt entries for devices
being used by Xen directly, where no intercept is required.

And then you also want to gate the hook from iommu_ops itself with
CONFIG_PCI_MSI_INTERCEPT, if we want to got this route.

>  
>  static int iommu_add_device(struct pci_dev *pdev)
>  {
> @@ -1429,13 +1408,9 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>      ASSERT(pdev && (pdev->domain == hardware_domain ||
>                      pdev->domain == dom_io));
>  
> -    if ( pdev->msix )
> -    {
> -        rc = pci_reset_msix_state(pdev);
> -        if ( rc )
> -            goto done;
> -        msixtbl_init(d);
> -    }
> +    rc = pci_assign_msix_init(d, pdev);
> +    if ( rc )
> +        goto done;
>  
>      pdev->fault.count = 0;
>  
> diff --git a/xen/drivers/pci/Kconfig b/xen/drivers/pci/Kconfig
> index 7da03fa13b..7ab92bde6e 100644
> --- a/xen/drivers/pci/Kconfig
> +++ b/xen/drivers/pci/Kconfig
> @@ -1,3 +1,7 @@
>  
>  config HAS_PCI
>  	bool
> +
> +config PCI_MSI_INTERCEPT
> +	def_bool y
> +	depends on X86 && HAS_PCI
> diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
> index 55d1bdfda0..f91fa71a40 100644
> --- a/xen/drivers/vpci/Makefile
> +++ b/xen/drivers/vpci/Makefile
> @@ -1 +1,2 @@
> -obj-y += vpci.o header.o msi.o msix.o
> +obj-y += vpci.o header.o
> +obj-$(CONFIG_PCI_MSI_INTERCEPT) += msi.o msix.o
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ba9a036202..a7695a0e2a 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -206,7 +206,6 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      struct vpci_header *header = &pdev->vpci->header;
>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>      struct pci_dev *tmp, *dev = NULL;
> -    const struct vpci_msix *msix = pdev->vpci->msix;
>      unsigned int i;
>      int rc;
>  
> @@ -244,21 +243,11 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      }
>  
>      /* Remove any MSIX regions if present. */
> -    for ( i = 0; msix && i < ARRAY_SIZE(msix->tables); i++ )
> +    rc = remove_msix_regions(pdev,mem);

Coding style: missing space between parameters.

> +    if ( rc )
>      {
> -        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
> -        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
> -                                     vmsix_table_size(pdev->vpci, i) - 1);
> -
> -        rc = rangeset_remove_range(mem, start, end);
> -        if ( rc )
> -        {
> -            printk(XENLOG_G_WARNING
> -                   "Failed to remove MSIX table [%lx, %lx]: %d\n",
> -                   start, end, rc);
> -            rangeset_destroy(mem);
> -            return rc;
> -        }
> +        rangeset_destroy(mem);
> +        return rc;
>      }
>  
>      /*
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 846f1b8d70..ca0a9b5665 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -428,6 +428,31 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>      return 0;
>  }
>  
> +int remove_msix_regions(const struct pci_dev *pdev, struct rangeset *mem)

This needs to start with a vpci_ prefix, since it's a global function.
What about vpci_msix_remove_regions.

> +{
> +    const struct vpci_msix *msix = pdev->vpci->msix;
> +    unsigned int i;
> +    int rc;
> +
> +    for ( i = 0; msix && i < ARRAY_SIZE(msix->tables); i++ )
> +    {
> +        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
> +        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
> +                vmsix_table_size(pdev->vpci, i) - 1);
> +
> +        rc = rangeset_remove_range(mem, start, end);
> +        if ( rc )
> +        {
> +            printk(XENLOG_G_WARNING
> +                    "Failed to remove MSIX table [%lx, %lx]: %d\n",
> +                    start, end, rc);
> +            return rc;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  static int init_msix(struct pci_dev *pdev)
>  {
>      struct domain *d = pdev->domain;
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index cbd1bac7fc..ebe40b0538 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -48,8 +48,7 @@ void vpci_remove_device(struct pci_dev *pdev)
>          xfree(r);
>      }
>      spin_unlock(&pdev->vpci->lock);
> -    xfree(pdev->vpci->msix);
> -    xfree(pdev->vpci->msi);
> +    free_vpci_msi(pdev);
>      xfree(pdev->vpci);
>      pdev->vpci = NULL;
>  }
> diff --git a/xen/include/asm-arm/msi.h b/xen/include/asm-arm/msi.h
> new file mode 100644
> index 0000000000..c54193310e
> --- /dev/null
> +++ b/xen/include/asm-arm/msi.h
> @@ -0,0 +1,44 @@
> +/*
> + * Copyright (C) 2021 Arm Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __ASM_MSI_H_
> +#define __ASM_MSI_H_
> +
> +static inline int alloc_pci_msi(struct pci_dev *pdev)
> +{
> +    return 0;
> +}
> +
> +static inline int pci_assign_msix_init(struct domain *d, struct pci_dev *pdev)
> +{
> +    return 0;
> +}
> +
> +static inline void dump_pci_msi(struct pci_dev *pdev) {}
> +static inline void free_pci_msi(struct pci_dev *pdev) {}
> +static inline void pci_cleanup_msi(struct pci_dev *pdev) {}
> +
> +#endif /* __ASM_MSI_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

Should you instead have a non-arch specific file with those dummy
helpers that get used when !CONFIG_PCI_MSI_INTERCEPT?

> diff --git a/xen/include/asm-x86/msi.h b/xen/include/asm-x86/msi.h
> index e228b0f3f3..7ef0161b67 100644
> --- a/xen/include/asm-x86/msi.h
> +++ b/xen/include/asm-x86/msi.h
> @@ -252,5 +252,9 @@ void unmask_msi_irq(struct irq_desc *);
>  void guest_mask_msi_irq(struct irq_desc *, bool mask);
>  void ack_nonmaskable_msi_irq(struct irq_desc *);
>  void set_msi_affinity(struct irq_desc *, const cpumask_t *);
> +int alloc_pci_msi(struct pci_dev *pdev);
> +void free_pci_msi(struct pci_dev *pdev);
> +void dump_pci_msi(struct pci_dev *pdev);
> +int pci_assign_msix_init(struct domain *d, struct pci_dev *pdev);
>  
>  #endif /* __ASM_MSI_H */
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 8e3d4d9454..f5b57270be 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -79,10 +79,6 @@ struct pci_dev {
>      struct list_head alldevs_list;
>      struct list_head domain_list;
>  
> -    struct list_head msi_list;
> -
> -    struct arch_msix *msix;
> -
>      struct domain *domain;
>  
>      const union {
> @@ -94,7 +90,14 @@ struct pci_dev {
>          pci_sbdf_t sbdf;
>      };
>  
> +#ifdef CONFIG_PCI_MSI_INTERCEPT
> +    struct list_head msi_list;
> +
> +    struct arch_msix *msix;
> +
>      uint8_t msi_maxvec;
> +#endif
> +
>      uint8_t phantom_stride;
>  
>      nodeid_t node; /* NUMA node */
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 9f5b5d52e1..a6b12717b1 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -91,6 +91,7 @@ struct vpci {
>          /* FIXME: currently there's no support for SR-IOV. */
>      } header;
>  
> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>      /* MSI data. */
>      struct vpci_msi {
>        /* Address. */
> @@ -136,6 +137,7 @@ struct vpci {
>              struct vpci_arch_msix_entry arch;
>          } entries[];
>      } *msix;
> +#endif /* CONFIG_PCI_MSI_INTERCEPT */

Note that here you just remove two pointers from the struct, not that
I'm opposed to it, but it's not that much space that's saved anyway.
Ie: it might also be fine to just leave them as NULL unconditionally
on Arm.

>  #endif
>  };
>  
> @@ -148,6 +150,7 @@ struct vpci_vcpu {
>  };
>  
>  #ifdef __XEN__
> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>  void vpci_dump_msi(void);
>  
>  /* Make sure there's a hole in the p2m for the MSIX mmio areas. */
> @@ -174,7 +177,7 @@ int __must_check vpci_msix_arch_disable_entry(struct vpci_msix_entry *entry,
>                                                const struct pci_dev *pdev);
>  void vpci_msix_arch_init_entry(struct vpci_msix_entry *entry);
>  int vpci_msix_arch_print(const struct vpci_msix *msix);
> -
> +int remove_msix_regions(const struct pci_dev *pdev, struct rangeset *mem);
>  /*
>   * Helper functions to fetch MSIX related data. They are used by both the
>   * emulated MSIX code and the BAR handlers.
> @@ -208,6 +211,25 @@ static inline unsigned int vmsix_entry_nr(const struct vpci_msix *msix,
>  {
>      return entry - msix->entries;
>  }
> +
> +static inline void free_vpci_msi(const struct pci_dev *pdev)

vpci_msi_free please.

Thanks, Roger.

