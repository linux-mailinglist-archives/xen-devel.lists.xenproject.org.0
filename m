Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6F85EC5AB
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 16:14:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412627.656004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBLo-0007wZ-5P; Tue, 27 Sep 2022 14:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412627.656004; Tue, 27 Sep 2022 14:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBLo-0007uW-0m; Tue, 27 Sep 2022 14:14:20 +0000
Received: by outflank-mailman (input) for mailman id 412627;
 Tue, 27 Sep 2022 14:14:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEHl=Z6=citrix.com=prvs=262470e07=roger.pau@srs-se1.protection.inumbo.net>)
 id 1odBLl-0007ty-VP
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 14:14:18 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9d6a0f4-3e6e-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 16:14:15 +0200 (CEST)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 10:14:11 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DS7PR03MB5575.namprd03.prod.outlook.com (2603:10b6:5:2cd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Tue, 27 Sep
 2022 14:14:10 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 14:14:09 +0000
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
X-Inumbo-ID: a9d6a0f4-3e6e-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664288055;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=IZcz498bLrjIMkDpiCPfRH/sPYvb3fCCDuZ8DjGofhY=;
  b=Zf3v92hBHLeQ/Iay4tZNz+eJ8RzP88dt/ewaKRFfEpY9gwX+c8GMLOTn
   ccQvQ93IE4GLvDtRx1R6HUvM2M9NgXfoGtVjf2CVFiyB7YMb+k5gNMzTP
   rKvdPszURAr1hZ2DqG/zPsVyazJBGIZ5ii5xwC1zeRDdjt36XbrBOqar6
   0=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 81869574
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7R6BuKo0wihAWGPvbtAZVPnr0LNeBmLhZBIvgKrLsJaIsI4StFCzt
 garIBnVbKyCNGLzedp1OYvloxgEvJeHmt5jSgdqqXwxRigTpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+55wehBtC5gZkPaER4weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mx
 +ImNyAKbBS6ps2/z+3iadhlucUkI5y+VG8fkikIITDxK98DGMmGaIKToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Okkooj+CF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efxHOlCd9NSNVU8NZxm03CwzZMCyELXEuQndyWphW4C+5Qf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaESoIKW4PYwcUQA1D5MPsyKkolQ7GRNtnFK+zj/X2FCv2z
 jTMqzIx750NisoM27S+7ErwiTumrZjUTSY4/gzSGGmi62tRboO/e5ah71Sd6P9aNZuYVXGIp
 n1CkM+bhN3iFrmInS2JBe4KRbeg4q/cNCWG2AE3WZ486z6q5nivO5hK5y1zL1toNcBCfiL1Z
 EjUukVa45o70GaWUJKbqrmZU6wCpZUM3/y8PhwIRrKiuqRMSTI=
IronPort-HdrOrdr: A9a23:0LfQZ6rCkZGb8F8+0pqX9rEaV5vOL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 xdmstFeaHN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMD2CAJsQizuRZDzrcHGfE2J9dOAE/d
 enl716jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr14jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKsu/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdd11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtdqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bWjHAbgcYa
 ZT5fznlbhrmQvwVQGZgoAv+q3mYp0LJGbLfqBY0fblkwS/nxhCvjglLYIk7zQ9HakGOuh5Dt
 T/Q9tVfY51P7ErhIJGdZI8qJiMexjwaCOJFl6uCnLaM4xCE07xivfMkcUIDaeRCdQ18Kc=
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="81869574"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAUHeCSq2M5lb/75KjH4KyQRwEcLvsyEIAZoNNfBGVG5bID023tgScZENYuck60eu0YgNoubh6ufiBETAQoDXTUpEzdXGF2G/kwGrF+Ah1n5nk2wxS+G1dOfH+cS7mG6M+Gl84GeL6ht0d0zjFMeVhKDi0GVDPlBvHSqxQvQrLCFosBVMaB6fCPRKRB83Zx4IYLPsN2oQHFJe3htWI0eOix1MonYrMaBi0IxL/DkDSRkOEyzTAmLcNUKt88jHRp3yi1DdoMGr4s+nJ7F0EoekrBJhGMuTF+4LbhRtSPebAlbERSMdBzzuq4VML0PAdJa3iiyQ56CMa/0VDbIzcrWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhFclLHlJ8aO6Adc36BHxpSHTDhTgU5ZmcsHGfWLQmo=;
 b=hgL3ePMzhDkpZs1i30CNlA1P50oE8wPO5Kz5lxp7Ijvc+KxGgBWFc+Rl01VdhAUmgY9OmAa6h9vwLEhUViGYjnLVUZ27i65huzut7w4VpxVf6S786i079FO5XgDmCdjY6nfjcNfY5qiTeYusuortP6kW71h/5FkD6DSk8MilayrRljstdzHZ9RUG9VqTp93dSA1Hn5DBXvBOnwwL+/4xOBPIMYwTlZMRH26O9NcIk5QfplkVpX22ODZzTXEQK2MXEaFrqmBq5s8BWRJ1wMTsrfyFkc375IGFrQ6bloBjZCrwkmfo8nvvvPkrNlwBTjod2yKNyH9EhMfnW9Iv4//unQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhFclLHlJ8aO6Adc36BHxpSHTDhTgU5ZmcsHGfWLQmo=;
 b=QrH6anRyRwdC2xcboQsBMIX+SNTQIrdVNQ7yO5Nz7A8+KGyfcPd4H9Ft2T74w6Rcgd8lT+Y24JuHHhWRd0ka9w7CrsPGel65AB2OB0HWp29dgoAjseIDUOUzaASiUuQ65EvyDEjP6RY4nGCL0KF9vEMc8KTbzoDhs5KOIDGRUYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 27 Sep 2022 16:14:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH] zap linking-only option from EMBEDDED_EXTRA_CFLAGS
Message-ID: <YzMFLffjWLzz4nW6@MacBook-Air-de-Roger.local>
References: <d640d386-8b6d-5e1c-4dd5-b5d928ab8b2b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d640d386-8b6d-5e1c-4dd5-b5d928ab8b2b@suse.com>
X-ClientProxiedBy: BN9PR03CA0899.namprd03.prod.outlook.com
 (2603:10b6:408:13c::34) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DS7PR03MB5575:EE_
X-MS-Office365-Filtering-Correlation-Id: 484719ee-17ce-4ff6-fd4e-08daa0928b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	20TH5So/YPlf3XXay1Kvj6CpBnLfOnhguK30SzE264tMM1frOTs5ZFWwbLiG5zZ4lSlpGOhkNZyJlRt9bAqfwge+WtX9sz5imDqF3nQ1pTZVYGjJpexkTH1OxW+1mmdVHFbKV3wJF4wiVBESkGqIdFvHGIWkIG+N25CcABC2R2zbLMVXnZjBgbDsl5dNYXfjGinykAdoWmo8GXpXxd/AEzcIsREO/tqQbR4m6vYmIQ6ydr7jodT6fghDERP6NCMYdAuBhwdtb9Lerk0QFiTXmFNOnMP+XtPnwDbN1mIPM4sXL9UDESoL84wNCMZERoAKZGl4uc42MvHsvG3cVtBmh4Lt0MKUACCEL7c3f8QRXgDTvUmsTlCc2OJcNumO+j4eoquK+0jai9t6KXLrXyylWfmzTVIQ/iCUIcN7OGNYlFcwc8ZoSH3JyDdS5QiKF9JBYGVwGBnFC2+lBRNS5QumOi1pbnINUtAAFltZwZqTu2qnMXtS7cOV9+s3oOAbZIBoSeXD5XAok/304pceOFHmXXBZUiIVbFF7zpH+d6JdcM11gC1ZHmhDsWhXlGkpGHvQUf0g8NdSxZ/wqufExEML6/dt4KRd7Z0orlryRa9zSaNgWcZCuGSyoHnupllnS1chIxLq1yRE7Xoxq53ABYVPbVgOWM30fEwaogb5hW8TFcEUZMJIN1kM0K4HDLuKjX7fw4Dj6ZwPsT4xymXGn1oMLfi5BThrXkRHLec1oa7Zy56ayn0fOXuoZTWXYJqEcXvG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(451199015)(6486002)(478600001)(6666004)(107886003)(5660300002)(9686003)(6512007)(8936002)(26005)(86362001)(316002)(6506007)(82960400001)(6916009)(186003)(85182001)(54906003)(66946007)(66476007)(4326008)(38100700002)(66556008)(41300700001)(2906002)(8676002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1VUWDdhdCtjaTVSREFKMVkyUCs1N3VkZlJpaGhOSkJHa1ZBakVoOTFTYVFQ?=
 =?utf-8?B?WlF1c1NLTkM0Vnp4ZVFLRFhtcWZOMVp1WXpVeG1yeVQzTXhabS9EbStuWWZX?=
 =?utf-8?B?ZzNGZ1dMbDVvNUdMK1ZsTWFIY0dXeXBhWGU4Vng1U0NYSFZjSXFyc2dWMmh0?=
 =?utf-8?B?SDlNbU52V2RIeW9vK1lNaXFIMnZHK3lyRFRoS3FMWHZ5enJCOGxYYWtHRDho?=
 =?utf-8?B?WjdENFdiQjhwL05aQzM0ZFZqL0ppb1dlaDdERkp3bkswbHJJZ0UrYXA0WXRh?=
 =?utf-8?B?SndYZWhQeFVERnpUQlFRZUVIUTdEdEJBRWNkYWhtK0VKMlJSQzcvVnJ3eDJ5?=
 =?utf-8?B?M2hXeGgwK0RiRGJpUklaQTFGVkZvVmcrTkhQaEZxVEp2anVWUXp3cXlMa3NU?=
 =?utf-8?B?WUN1TGEwL0hjRU9qRWhrQis0SG9aTS9RN0FlMzJWQlphTW53NTJFa2IyVjVJ?=
 =?utf-8?B?c1lHREJ0UHB0UnJNRC9Gd2t2VFhReWtCZXRneHEyWGhvWVZ2WVh3elZ6bVdJ?=
 =?utf-8?B?aWZZc2RNNGg2cWMyZ01tS2NwQ0hiUzk0TFUyN2FwcDJRMU1Ncy9WbmRTZThX?=
 =?utf-8?B?Y1NJM2k1RVJveDlWQVFJWWJzS1N4RUtlZXB0ZTU2cGEyUVkraG5JTkZhV0dH?=
 =?utf-8?B?bDUyeTR3VlVFZEpZOVJ3TVVpTG1HMG1EWTY4UUxGQm5BSU1XcTRNZk4yOUNJ?=
 =?utf-8?B?di9ndkVuMkw0S0d2MmdUTTRYOVo1M0ZLYzh4RzU3YnZVckV2ZHYwN2pnYXd6?=
 =?utf-8?B?dW51NE9qSG5UdE1tc1FUQkNmQUxVWFNPS3JBVTJPeE03ck1SUlQwRGRQM0Rw?=
 =?utf-8?B?NzFPcjE0MWJzWlVYcXpnZ3I0ZjZhSjB5MlhrY0tqZzg1aVAybHdOU2RhYnRH?=
 =?utf-8?B?a0todlhSSnhJSEJaSmY3Q3BobkFpdU85eVBKN2hqVFlrYzlWcFUrS2JDK2cw?=
 =?utf-8?B?ZG1vUjFlbUNvMmUreTh1bUlKSGxnamJGS2tmdVE2VUprYnUyaEp4YWJGTWFT?=
 =?utf-8?B?MFpja3Q5eFJLeDUvNFlGaWVwTmw5eGx6bnZIWWhMMk9US0tSTE5JU2U3TkN3?=
 =?utf-8?B?SmcybDhqSXMydXpYZ1JXaFNlZnBjTUwwa0xXblRGeTYzcHhSSnE0SjFjUVZv?=
 =?utf-8?B?ekhSM3FaaHpEaC9TUjZtaWN5bUYrRi9uTEFwM2JHTzM0TTJLS2NPdnovSG9C?=
 =?utf-8?B?R0Y4UnkwSXhUUzVGZlBrMDZDSkVodkN4bDVCVnZxNFVXaTNiUTFPUkhvOC9n?=
 =?utf-8?B?UlRtL2hpalRNdzgzN2RHbUI2MGdMRUpRMVFVbUJlRXVOR0JORDB4MGx4dUFw?=
 =?utf-8?B?c25oS0FySEV1K0FqakJVZDRkMHI3NGR4N0MzbVpRcGxNWEpxcXNtcUVBUWhy?=
 =?utf-8?B?RUFkU2ljbUZuSUlzRFd5aU1oTjVIOGdUMi9KM3UwUWJrVElBSnlqRmVISTIz?=
 =?utf-8?B?UnVVTU9RR01mTmY4VUN6bUR3T1RrY2dTQks0V0w2Y2NVdndqemFZTzdZcEJ2?=
 =?utf-8?B?NDZaMFNHUGZlR2NheFJmTmtHSURtOHpia1BwbWhyRmtNSXhCNUpHUi9jL05i?=
 =?utf-8?B?d0hRakNnM3BibU8wYW1aODArRmY0Wjd2bjVIYkp6RlR1MmRKZHNucVYrMk01?=
 =?utf-8?B?Ujk3VHdwWlhuYmxtYnI5R2g1eXBGc1pTSDFJMVRGak5UU0h2ZGR3cGw4cW9H?=
 =?utf-8?B?eUJEbWFhU2l1QmRRTExwTGxvVGUwRU9Cai9JZHlnaUloUFo5aS9UcWlMOVd2?=
 =?utf-8?B?WHRnbXNxWWp2TDVDSVhjbjNmMWJlM0FrWnFpcGNpZy8raW1rb29LQ0ZFRUFr?=
 =?utf-8?B?ZnVGbS90OWxIU0lHNFI5eVZIaUQzRFdqa0RPOG16bHhianE3MHlscm9QaFpm?=
 =?utf-8?B?L0JCY3p2Qm1pdFdiMHBiVHR0STM0T2o1Rm93Qk9hMzBuNjIvTnVwZ2ZuaE5s?=
 =?utf-8?B?ay8xbkVpWlc5RkowejBpMEdTVWtnNHd2eWM5WTdHWkNINlIyTGtTOHovTlVm?=
 =?utf-8?B?UXBDTWtGRDZPcmh1Y2Fob1ZMZzdDN0NJODRnRkpCM0pUYWE0ZkJHdCtoTU1M?=
 =?utf-8?B?eWt6K3craDMrbnkwYVk3U1ZRSFB6Q0tlMlJYU05FQmxvdmNBNHkrU3ZjZmF3?=
 =?utf-8?Q?4PW+eGDSRkJMvLUZo1uxGtMo5?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 484719ee-17ce-4ff6-fd4e-08daa0928b91
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 14:14:09.8161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nc5xwjvCgmjlEcy7Mx6jidifhj97s507jCZ9/zcTxYLgYg2FK/ZVZUgGlR0Edm0v1U4dhcTgzJ6IBGmfnvuozQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5575

On Fri, Sep 09, 2022 at 09:22:52AM +0200, Jan Beulich wrote:
> While I was suspicious of the compiler issuing a diagnostic about an
> unused linking-only option when not doing any linking, I did check this
> with a couple of gcc versions only, but not with Clang. (Oddly enough at
> least older Clang versions complain about the use of '-nopie' now that
> we actually use '-no-pie'.) Filter out the problematic option in all
> cases where the variable is consumed for compilation only (which right
> now is everywhere).
> 
> Fixes: ecd6b9759919 ("Config.mk: correct PIE-related option(s) in EMBEDDED_EXTRA_CFLAGS")
> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Arguably with all users of EMBEDDED_EXTRA_CFLAGS using these just for
> compiling, the option could be omitted from that variable right away.
> But if any compile-and-link-in-one-go use appeared, there would be an
> issue.

Is it feasible to have compile-and-link-in-one-go in one use feasible
with what we consider embedded (firmware or kernel like binaries).  I
would expect those to always require a linker script and a separate
linking step.

> 
> --- a/tools/firmware/Rules.mk
> +++ b/tools/firmware/Rules.mk
> @@ -13,7 +13,7 @@ endif
>  
>  CFLAGS += -Werror
>  
> -$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> +$(call cc-options-add,CFLAGS,CC,$(filter-out -no-pie,$(EMBEDDED_EXTRA_CFLAGS)))
>  
>  $(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
>  
> --- a/tools/tests/x86_emulator/testcase.mk
> +++ b/tools/tests/x86_emulator/testcase.mk
> @@ -2,7 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
>  CFLAGS :=
>  include $(XEN_ROOT)/tools/Rules.mk
>  
> -$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> +$(call cc-options-add,CFLAGS,CC,$(filter-out -no-pie,$(EMBEDDED_EXTRA_CFLAGS)))

Is the x86 emulator harness correct in using EMBEDDED_EXTRA_CFLAGS?

TBH I'm not sure the naming and usage of the variable is very
helpful, maybe it would better be STANDALONE_EXTRA_CFLAGS, and drop
it's usage from the x86 emulator test harness, open code the needed
flags for that use-case.

Thanks, Roger.

>  
>  CFLAGS += -fno-builtin -g0 $($(TESTCASE)-cflags)
>  
> --- a/xen/arch/arm/arch.mk
> +++ b/xen/arch/arm/arch.mk
> @@ -1,7 +1,7 @@
>  ########################################
>  # arm-specific definitions
>  
> -$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> +$(call cc-options-add,CFLAGS,CC,$(filter-out -no-pie,$(EMBEDDED_EXTRA_CFLAGS)))
>  $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
>  
>  # Prevent floating-point variables from creeping into Xen.
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -10,7 +10,7 @@ CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFF
>  # Prevent floating-point variables from creeping into Xen.
>  CFLAGS += -msoft-float
>  
> -$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> +$(call cc-options-add,CFLAGS,CC,$(filter-out -no-pie,$(EMBEDDED_EXTRA_CFLAGS)))
>  $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
>  $(call as-option-add,CFLAGS,CC,"vmcall",-DHAVE_AS_VMX)
>  $(call as-option-add,CFLAGS,CC,"crc32 %eax$$(comma)%eax",-DHAVE_AS_SSE4_2)
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -12,7 +12,7 @@ endif
>  $(obj)/head.o: $(head-bin-objs:.o=.bin)
>  
>  CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
> -$(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> +$(call cc-options-add,CFLAGS_x86_32,CC,$(filter-out -no-pie,$(EMBEDDED_EXTRA_CFLAGS)))
>  CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
>  ifdef building_out_of_srctree
>  CFLAGS_x86_32 += -I$(objtree)/include

