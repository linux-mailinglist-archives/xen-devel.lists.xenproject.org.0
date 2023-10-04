Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E901D7B7FE1
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 14:54:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612539.952477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo1NY-0008MA-G5; Wed, 04 Oct 2023 12:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612539.952477; Wed, 04 Oct 2023 12:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo1NY-0008Jb-CZ; Wed, 04 Oct 2023 12:53:28 +0000
Received: by outflank-mailman (input) for mailman id 612539;
 Wed, 04 Oct 2023 12:53:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O8y1=FS=citrix.com=prvs=634504905=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qo1NW-0008Au-MA
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 12:53:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd8691c6-62b4-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 14:53:20 +0200 (CEST)
Received: from mail-dm3nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2023 08:53:17 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB4953.namprd03.prod.outlook.com (2603:10b6:5:1e9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 4 Oct
 2023 12:53:15 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 12:53:14 +0000
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
X-Inumbo-ID: fd8691c6-62b4-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696424000;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=iHQwA4H2oDjw9pw4BUUTg4CMwdnOcE6wy/yyvYgqJFc=;
  b=Ip9K/sGXp6VjHxBJHn2BhKJHU0CqUVi7rSYBQxNy90TvvSAud50aJ2/+
   WSjWY9BYasR5WvxbaeY6TsDL8V5i6nHGidqv/UzfgXoM/oYRasLsMi6xw
   MsFYEm1kZ9WZB8iIn47w/acsJixMsvlhOiaNkWeDjee/GK/uYbHkEmLZi
   c=;
X-CSE-ConnectionGUID: Of9q1stpRLCuaob8hXJVBg==
X-CSE-MsgGUID: dKZckvYnQOO+i9sUqgrucw==
X-IronPort-RemoteIP: 104.47.56.44
X-IronPort-MID: 125025258
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:+10uaqkjh+6prLE4o/3sjO7o5gwWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJODzrXPP7bNmf2ed1/a9vk9E4DsMPXzdNnSAJr+yk8EiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqkT5AOGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dsWeSlUdQybvcad3bu8QLlstuYdBsa+aevzulk4pd3YJdAPZMiZBonvvppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVI3jOSF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWx36jAt9ISe3QGvhCjH6hzW8NORsvcnz4oKiit1exQc9UN
 BlBksYphe1onKCxdfH/Qhm5rXisrhMaHd1KHIUS5QGAz+nE7gCxAzUcCDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65vX/FCvs2
 TmMoG47jq8KkM8Q/6yh+BbMhDfEjqbOSgk59wDGRFWP5wlyZJOmT4Gw4F2d5vFFRK6eSlSCp
 3ECl9Kp8PEVDZqNmSqOR80ABLisof2CNVXhbUVHGpAg83Gh/iWldIUIujVmfh81boADZCPjZ
 1LVtUVJ/phPMXC2bKhxJYWsF8AtyqumHtPgPhzJUudzjlFKXFfv1ElTiYS4hggBTGBEfXkDB
 Kqm
IronPort-HdrOrdr: A9a23:8eupC61aVdCcZhaT3mIQZwqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-Talos-CUID: 9a23:Fuaf0mwhZINkmnzT4E8oBgUzFJE8K2bB1E30CFKxDmw5SI23d3WfrfY=
X-Talos-MUID: 9a23:wMi5XgpeMe4107a4LyAezz1BBsxr/ZWoMWcq0pRXoPSdOjZtMCjI2Q==
X-IronPort-AV: E=Sophos;i="6.03,200,1694750400"; 
   d="scan'208";a="125025258"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjYWF9QaUZ53VIC5J1pV/RGA4bTwlp/7IeHAxUEoV8DQ2wzRMVN7PJUdqV3Hmvq+viFbUZ0v3gCP0PUb4DYoAllBsF9+saQaYv6awmhiWVM60iMqQ7o1zkdgLHx1jt6lDbK0G3WLJ/f3tqKc9cJAjmgd4kdGrqKC2YyUTkGKbW/uRGZRNhyJZ2H6ke78FVSwkrDQvaiOeRuY3e9MfLZtMtWcshfs3AjdeodrE8W03Ee4yr9fX9CW6oRPWGVyq4CLqPnajLcObqXYcK2QkExVpyoSsL4W0JOYVxGCynmoMdMybX06vW9F5Rb5gadjgMvqmRNlKlopWu9iMP02UM9KIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gak1ELPomXjZMaS5d7LVvNtq3KPQknErhH0eO81ZY4M=;
 b=PPKsUI22B1f5zZq2jH6SlPDpxHO2/l7yaf3m4UMUeKWcJJU0CF4QQKBvc8QS0zi/upWHnEHvcISrP72inmIPEGyanYwUHakomPebCbyb+XbgKxGFSeKeaOWvbC1FGjl4PTHlumpOHAwsYnbPQ4QRmTsMFqkvqh/MDm6JqV8rV9tfMhE0q9bMySl2J3wCMHIftQvzecUAZW/vqtsAqZD6I1mcSYc+kxwWl2FB4bGpX/EYTFKnPRrcBWK8BFDvLSbW+UdAs8RXWKsKywIJgiLsPTsgwuWdlvt5EgSXfJXxMmK9jVZ+pHEgAvuCFlColVvyXj2Q1Fjb/t0N/695iiqaBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gak1ELPomXjZMaS5d7LVvNtq3KPQknErhH0eO81ZY4M=;
 b=QioDgT+/j3Gce9akjVryaV+7Zuf4lj+WJYNdCCuE0fmfsBPTwgScXj2PwA5L8AVBx8p5nrJovmOXOaiaKwv7MZVrE7VjjB7rduFZKabnR+dYWpYuInRx1xGm/Ww5TatJZmsO+jQqYpQA7XMB8BLqmapsDzRdS3C7m7VscX/YewI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Oct 2023 14:53:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
Message-ID: <ZR1gM19i6-vBaXh7@MacBookPdeRoger>
References: <ZRY7Ls3p6M6pakMq@mattapan.m5p.com>
 <ZRvQNKyYpLDVTs0i@MacBookPdeRoger>
 <ZRxpC7ukhiYvzz5m@mattapan.m5p.com>
 <ZR0erl_OSkNgIQjx@MacBookPdeRoger>
 <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org>
X-ClientProxiedBy: LO4P123CA0103.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB4953:EE_
X-MS-Office365-Filtering-Correlation-Id: f52b5ce5-b014-42b4-9016-08dbc4d8df37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OVE8BY0y3w3gdz5GSMkLF/NvEVdNXC1Xiwh7NNDmu8+uQX31CbMa5l5h80jHxaW1T6Qwd8zp94ch9UEncz1OKP+g8LFn5UqGc61u9Ump/xEQbo7K7pIZAD3x3uM7DW5kUOjbS2IdlqtvGIt+rhTaPWt+QiEyzrPmCkJVwFkf+aiWl0hnGQSAoQ6lU4zc7yf57X0jhTDNz5o7XFfoFWC6RLXFySAPzZtRwZWy7ar6CggygM3ByoVi2XWFl3glrwrrj7eHM84JEj4gb3U/UhAJWl6NK736W6ZPF8sCU+DTyb/GvvVerE6IfkPInP0Jlay4BNFWtzIFJeahg8p0CjTnCrCDltC99bztZX2uzyA/PF6oVhJsEAVLv/FZRAimIrTzsSe5WpWEBlAQ83uiLZe0Lkm8gm7QciNqSXICopOi539+ylNJRbQdlXTTb9c+tbhxce0xuN9rg3OgGhTi659Qqv0wx1Pk73I1ZlrwLPeiU93dpnTIKbjC3Tflwi93jtqT4oBNQRXu/OK+QWPXX8wNMoF2ry8/7kkc2hAOwetCjn9wBw8BcFpO46+zwUxEptfD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6506007)(6666004)(478600001)(53546011)(6486002)(6512007)(38100700002)(86362001)(82960400001)(66556008)(33716001)(83380400001)(9686003)(26005)(2906002)(85182001)(66476007)(54906003)(66946007)(6916009)(5660300002)(41300700001)(8676002)(316002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clFReEMvVTJyN2ZUalR3Y2lQRXJJUEdIcjBCTHZQN05CTUUycmNsNWNyZE9E?=
 =?utf-8?B?WDAwaE5LSldNYWdWSDhoRmR2ZmJQaWdDaW03azFRZko3UUdJZHExSzYrdjNG?=
 =?utf-8?B?T3I5cEg1NlZqcUhrTkMrUWJQNWFreC9rSGhiVkNIbkVFWWFBUFEwbHBtbXBR?=
 =?utf-8?B?V09DbFR4bC9tbXpOUzlVeXJ5S0ErVTRuZ09UNGRBeDhVYkVsZ0cvaDRJdGxX?=
 =?utf-8?B?bEVTV1ZURHVqb3NIRXE4YlprbHM1QklzcGdSUGhlbnBxVG5jUjNaZkVMRzV5?=
 =?utf-8?B?MUVzSVdEai9QT29XeENtNkl6aXFDM3MrSm12dTUvc25zZmR4Sm4zYkNDWkRC?=
 =?utf-8?B?QVNLQ3owcWlUb21EeUY0OTF4ZkNOdkgyaUp1ZWg5WlZaSUgvK28vMUNtQWRj?=
 =?utf-8?B?TGFtaTI1MHpqM0lFYnN5MEdXY0VDY2x1b2RmVWk2R1Jjcm5EQ1I1aXBreG1s?=
 =?utf-8?B?ME1xU2R1dVNUM2d3NWM1Y2JnUUlEdTV4WGxKbmVXajZ6czZzVGczRWJDcFN2?=
 =?utf-8?B?dDY0L3QzNGdDOXdBOVZ4MDRvT3pOY2NHQWpEQVpFWXFBd0U2aFdxSmRLbzJa?=
 =?utf-8?B?ejlUeGlRTTdRV0M3UVVReDF2amI0b3Q3c20yYWkzdVYzNUpYbGMrZ0hMVG5x?=
 =?utf-8?B?V2dnbXU2czkwSmNLNXlBak1hdlFFMDc0d3QvcC9jY2JxT2YyWlh1cnN2VkJ3?=
 =?utf-8?B?UmIrcytJM3VTV0hOYmoyNldod0hMaDVrWFNiTG1ZRitVL3ViMEdhSHV6S1pU?=
 =?utf-8?B?U3gyc0xKM1psS3hjTmpNbHJnUXh0Qkp6RlNTaG45ZHZJeVdhY21meHc1ZXNV?=
 =?utf-8?B?a1VSaXIyOGdpTWhIcjZHTDlSL28vUmRuL2tiZTZ5d2VEVGdyZStiNVNCaS9u?=
 =?utf-8?B?UVJXZWFpU0YxTER6ZUs2dmhGOGlYdzNicnVqQnRFWUhiWXRYNVlydHM3K0Fu?=
 =?utf-8?B?NytyMEl4VTE1NHl2RnJ2dnExUytUMG1GdDRyMHJEVWZvSGhTODB1YlQwd2gw?=
 =?utf-8?B?V010S05mamlGUytRYVlvbFlPTWkrMmpaQjg1VTFicFZWL204YU9ORzlhbXJP?=
 =?utf-8?B?OWgyZTNTcG1IQ1RGN0I0L2U5RXlXajlqZ1VyVFNZSVdVbHd2bVlLR2VaWHNS?=
 =?utf-8?B?MlpmalNJUU5QQXlTY1dmZ2FHN3BRYjltNmU4V29NTmRuVU5MTXcwM2RRbU1n?=
 =?utf-8?B?MlB5TXBwcXI2NDdvNy9oUUtDWWhYWjRUbjNLeDFHTzBkcm1XVkdTYzRaT2xs?=
 =?utf-8?B?TzArNEk4aXZ0MU9WeVh3QVh1Y21PS09jYjdETDBUcmVRbU1PWGtmdDRYdzNR?=
 =?utf-8?B?T2RtY1l2UDhEWFczTXlXd3FIT2RVdEhUbUtWaGlaNi91blFvemZ3ZjlBVzli?=
 =?utf-8?B?NitjWE1teVBOKzlweFZrNDJlbEdsUTQ3LzlwZHlUMkZHREtlMEZ3RS9hME4v?=
 =?utf-8?B?OEFVTnB0MHRkalpjYWdUR0ZteXlKY2RNb0ozK3BSOGtXbkpES3N6a3pmTUlP?=
 =?utf-8?B?RDhiYWVXMnIraGEvRjZ3UVRrNHhnWnA3R2QvVFM4UTBpY1lFa21zcFVWSzd3?=
 =?utf-8?B?MFNVUFRqZTQ1MGFFQXRsK280dy9XVm5CR3F5TUJ0b1hUbU5pMVRNS3ZUc3Rj?=
 =?utf-8?B?OTA0V0EzMFplK29tR1M0TlpQN1pqYllBSzZmMjJSdHdLUDdtemQ1WnJrNlJ0?=
 =?utf-8?B?UElEY0NWUVZxVjNSVy9RV0YzK1hTaFJmZnIzcTJOVVpKMVZnOHhWdHVKamti?=
 =?utf-8?B?N1Z3Ym93ZkhBSXBpbDhXdmJlS3J6Q1lkUEVLTW44M0NQQ2hoZDFzZXQ2Mzli?=
 =?utf-8?B?SWp4RDY5ZEhUR2puOG5OUm1YQzlTMjM0aUZKek5IcHh6ZG5GQk5CS2pScTEv?=
 =?utf-8?B?czUvWHdxZGdWbXV6d1JHVUVwZGxGRmdGZk8wUjhEL3poemxjOUE0UG5LcFRj?=
 =?utf-8?B?eExSOU9RMklxekpLUEdYRUFwVzJnWmJJeFY2L29mcHZHS0d0aGRjamRqaXJk?=
 =?utf-8?B?ZEljclNURUp6dG9kRlV5YmhHNVVwekZpd1NNU3lQSDJlSXFkanBDTFIvMTdB?=
 =?utf-8?B?RGwwWVBZR3Q5Tnk4WEZVVUtZM3NIV1c4K0FHckJyRGRDWThTd09PUlNIVW1m?=
 =?utf-8?Q?umuBRUID25TULV48NLXviZgX/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VVxp/fxycHnT0dZU3zutA8W1PG5uWLbyIcmM9+5UD3be2fFk8tM9LhJTBzYjkIvkc8C9b7NEDOrVh33Q7hXtPFytIwToNF06LEA8GKEjnJFT67UrIsVjqx+FXPTcb8ktVwevyga6QhH1FKtZ1l9yBH7kU2Q0otfHhlcBrbJetICwz0qlHTz3cjPviUG9iW9r5hawvd3OvWXJFqvAsINMlmyuh5TzwSrJJ0a178X0dP/EKVfpqD15SiEzynHAC8nzJtvksnLg0DCpepWi1xZNCpKdRMXtEEnGCA/B40L8dlsFxq98FS2bNVqOkJfwFAcYxYtCLKMreoBPZ4PbUEDyUORHMkwpHm199UsvIb3rHRI2B9jG9dJ44S1z8PrCy7ktucUQT2iS3bvXr7VUjcs5QFeDNElbo/RW7syYxhdkR0ukvbPkswJ2nXAfFVOfnXZRmy4eWmmy/PB4ivVoyCZ2aRq4MmlBeeWamzH6jC5M7AgFcFNQ1t9+HVm3dfK3qkjupzbStHrVSql3RhEKdK1Nnn1wLMim+rzaa6km3GGgR+XwwKFAApl37pQBvAjP16ZpyP2cJncGFZg9tOiyJekr7rswjiaKaKNL7Dgbpv9z+RaK1Pld3xTiGKSeaCPhPpeQQ4H/WsOTs+c/u44VmgAc1NmNVd1Ygls2LhjjEXXjPakIjSHXJwws6w0eh6HEInZ9eClqz8Ps93bbLMcrQjH/1DMDitX/LTr7S9kXpXYhqBOy2qIUXmNgO0gnUFDKgDCCYRf3zVcF8skUTv+LgSJLaauxXFtF5tQCcVPJQ1qxZ8feVSF027lbxnLWiCX3oWX9phckZUm6D+RLE3FTCPZcyQ7fBpScN7gLm70HGoqOWP0bxfXAILSLKMFYhEz/Z608Q+1Z4CMtBBTM6b5ItvuKQA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f52b5ce5-b014-42b4-9016-08dbc4d8df37
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 12:53:14.4704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PuS6Cg/lPJE/uwdf0Am93bX9izWjTkKvzOy9zA9pPBCbhlUoRJQgebK6LAXTN2EzwLpfd5GPV0RFsuz8T+aiPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4953

On Wed, Oct 04, 2023 at 11:55:05AM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 04/10/2023 09:13, Roger Pau Monné wrote:
> > On Tue, Oct 03, 2023 at 12:18:35PM -0700, Elliott Mitchell wrote:
> > > On Tue, Oct 03, 2023 at 10:26:28AM +0200, Roger Pau Monné wrote:
> > > > On Thu, Sep 28, 2023 at 07:49:18PM -0700, Elliott Mitchell wrote:
> > > > > I'm trying to get FreeBSD/ARM operational on Xen/ARM.  Current issue is
> > > > > the changes with the handling of the shared information page appear to
> > > > > have broken things for me.
> > > > > 
> > > > > With a pre-4.17 build of Xen/ARM things worked fine.  Yet with a build
> > > > > of the 4.17 release, mapping the shared information page doesn't work.
> > > > 
> > > > This is due to 71320946d5edf AFAICT.
> > > 
> > > Yes.  While the -EBUSY line may be the one triggering, I'm unsure why.
> > > This seems a fairly reasonable change, so I had no intention of asking
> > > for a revert (which likely would have been rejected).  There is also a
> > > real possibility the -EBUSY comes from elsewhere.  Could also be
> > > 71320946d5edf caused a bug elsewhere to be exposed.
> > 
> > A good way to know would be to attempt to revert 71320946d5edf and see
> > if that fixes your issue.
> > 
> > Alternatively you can try (or similar):
> > 
> > diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> > index 6ccffeaea57d..105ef3faecfd 100644
> > --- a/xen/arch/arm/mm.c
> > +++ b/xen/arch/arm/mm.c
> > @@ -1424,6 +1424,8 @@ int xenmem_add_to_physmap_one(
> >                   page_set_xenheap_gfn(mfn_to_page(mfn), gfn);
> >           }
> >           else
> > +        {
> > +            printk("%u already mapped\n", space);
> >               /*
> >                * Mandate the caller to first unmap the page before mapping it
> >                * again. This is to prevent Xen creating an unwanted hole in
> > @@ -1432,6 +1434,7 @@ int xenmem_add_to_physmap_one(
> >                * to unmap it afterwards.
> >                */
> >               rc = -EBUSY;
> > +        }
> >           p2m_write_unlock(p2m);
> >       }
> > 
> > > > > I'm using Tianocore as the first stage loader.  This continues to work
> > > > > fine.  The build is using tag "edk2-stable202211", commit fff6d81270.
> > > > > While Tianocore does map the shared information page, my reading of their
> > > > > source is that it properly unmaps the page and therefore shouldn't cause
> > > > > trouble.
> > > > > 
> > > > > Notes on the actual call is gpfn was 0x0000000000040072.  This is outside
> > > > > the recommended address range, but my understanding is this is supposed
> > > > > to be okay.
> > > > > 
> > > > > The return code is -16, which is EBUSY.
> > > > > 
> > > > > Ideas?
> > > > 
> > > > I think the issue is that you are mapping the shared info page over a
> > > > guest RAM page, and in order to do that you would fist need to create
> > > > a hole and then map the shared info page.  IOW: the issue is not with
> > > > edk2 not having unmapped the page, but with FreeBSD trying to map the
> > > > shared_info over a RAM page instead of a hole in the p2m.  x86
> > > > behavior is different here, and does allow mapping the shared_info
> > > > page over a RAM gfn (by first removing the backing RAM page on the
> > > > gfn).
> > > 
> > > An interesting thought.  I thought I'd tried this, but since I didn't see
> > > such in my experiments list.  What I had tried was removing all the pages
> > > in the suggested mapping range.  Yet this failed.
> > 
> > Yeah, I went too fast and didn't read the code correctly, it is not
> > checking that the provided gfn is already populated, but whether the
> > mfn intended to be mapped is already mapped at a different location.
> > 
> > > Since this seemed reasonable, I've now tried and found it fails.  The
> > > XENMEM_remove_from_physmap call returns 0.
> > 
> > XENMEM_remove_from_physmap returning 0 is fine, but it seems to me
> > like edk2 hasn't unmapped the shared_info page.  The OS has no idea
> > at which position the shared_info page is currently mapped, and hence
> > can't do anything to attempt to unmap it in order to cover up for
> > buggy firmware.
> > 
> > edk2 should be the entity to issue the XENMEM_remove_from_physmap
> > against the gfn where it has the shared_info page mapped.  Likely
> > needs to be done as part of ExitBootServices() method.
> > 
> > FWIW, 71320946d5edf is an ABI change, and as desirable as such
> > behavior might be, a new hypercall should have introduced that had the
> > behavior that the change intended to retrofit into
> > XENMEM_add_to_physmap.
> I can see how you think this is an ABI change but the previous behavior was
> incorrect. Before this patch, on Arm, we would allow the shared page to be
> mapped twice. As we don't know where the firmware had mapped it this could
> result to random corruption.
> 
> Now, we could surely decide to remove the page as x86 did. But this could
> leave a hole in the RAM. As the OS would not know where the hole is, this
> could lead to page fault randomly during runtime.

I would say it's the job of the firmware to notify the OS where the
hole is, by modifying the memory map handled to the OS.  Or else
mapping the shared_info page in an unpopulated p2m hole.

When using UEFI there's RAM that will always be in-use by the
firmware, as runtime services cannot be shut down, and hence the
firmware must already have a way to remove/reserve such region(s) on
the memory map.

> Neither of the two behaviors help the users. In fact, I think they only make
> the experience worse because you don't know when the issue will happen.
> 
> AFAICT, there is no way for an HVM guestto know which GFN was inuse. So in
> all the cases, I can't think of a way for the OS to workaround properly
> buggy firmware. Therefore, returning -EBUSY is the safest we can do for our
> users and I don't view it as a ABI change (someone rely on the previous
> behavior is bound to failure).

I fully agree the current behavior might not be the best one, but I do
consider this part of the ABI, specially as booting guests using edk2
has now stopped working after this change.

Introducing a different hypercall, or even using
XENMAPSPACE_shared_info with idx = 1 to signal the usage of the new
behavior should be used instead.

This would also allow unifying the behavior between x86 and Arm.

Thanks, Roger.

