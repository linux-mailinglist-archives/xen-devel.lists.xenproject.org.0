Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E03378C94C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 18:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592399.925119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb1D4-0007Xg-Vw; Tue, 29 Aug 2023 16:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592399.925119; Tue, 29 Aug 2023 16:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb1D4-0007Ux-Sn; Tue, 29 Aug 2023 16:04:54 +0000
Received: by outflank-mailman (input) for mailman id 592399;
 Tue, 29 Aug 2023 16:04:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wiqx=EO=citrix.com=prvs=598c0cf4a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qb1D3-0007Ur-1g
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 16:04:53 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7a96c18-4685-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 18:04:50 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Aug 2023 12:04:47 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5842.namprd03.prod.outlook.com (2603:10b6:303:91::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 16:04:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 16:04:43 +0000
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
X-Inumbo-ID: c7a96c18-4685-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693325090;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=U8OhKgzd0GN73TQp6NZ0t3yDeBqpjNjPG1IiQZpFZzc=;
  b=ChVFyLIOvdkU5R1jL19ShPIV3U7bm5irju4eaQpKlV58djnJsUfFiZDP
   hHC1p6tbbsZjw9WcNZqqFHgic3yj0eJZszel5MbPW3ieKNn7/wenKEm9A
   C8NBVi1GywAIVto+wflvKYxWskN3IXcZVkJ3s6aBGjt3zdmLtddJCVNl+
   Q=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 121428993
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:342/P6pP1sdVwrlS9y+8j9DgoK5eBmI1ZBIvgKrLsJaIsI4StFCzt
 garIBnQM/7ZYGD9c9gna4mx8RwP6sfVz9NqTVdr+yhjFH4RpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GlwUmAWP6gR5weOzShNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABc9RAqP1+Xv+b7lYdYwoOo7cMv5N6pK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYSEEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrKc22g3Clzd75Bs+CmSiute11Q2EYfUCM
 0Iq0RYUs/J13Rn+JjX6d1jiyJKehTYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 n2jks7tBDdvmKaIUn/b/bCRxRutPQAFIGlEYjULJTbp+PHmqYA3yx7KENBqFffvisWvQG+hh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7DJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:qGVi7qqdfoG08/ikChB3Xi4aV5ogeYIsimQD101hICG9E/bzqy
 nKpp8mPHDP+VUssQ4b6LW90cW7LE80jKQU3WBzB8bBYOCFggqVxehZhOPfKlvbdBEWndQy6U
 4PScRD4dTLfDxHsfo=
X-Talos-CUID: 9a23:SloqcGxJXunp587UIgvSBgUzKuo/fi3alU7cfWSHVUBHUOGXW1S5rfY=
X-Talos-MUID: 9a23:iI6gcQs5oE4r+ol0Mc2n2w57L+lkvOeUMmdQiZs4kPW+K3Y3EmLI
X-IronPort-AV: E=Sophos;i="6.02,210,1688443200"; 
   d="scan'208";a="121428993"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEVtDgpm7q0McIA7ybGNOXf60qUSiZ6I8+FZ76Aysfx6fCPqSxlxTokr6hPG6psHXRcGFI/K1QLwsxmcfsHEqTOlZry6a5MM8pAZgFT1t7F16Pg/irXssR1Kmu5ci7oWTVbYfvGWfRtsptLwv9yULXlUvSTlUntqP/cznHpI+hRKmBkTTJnzw+MpQgN1BqF/6bLLY0gNVX6InLeUijhwXRr/Nh9Poca1MNqiA2wmyON5RegodmGzdmtOyijieWD8zheDAbB4x8BwwOl7XRUVCurpnw8VMtgRV/Fq/JanUdRTnpsczXE38ebmmRxMptLvf4i4ha/t0mHI8GCIOOEovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpkxSsDflCvni48u497ZQHKPzo0C+h1dWnGMwWyBlog=;
 b=HNIpXFGqGitRnLqybvDn7GaPiLsFSKXBLUs8JDbis7eU8lJ9MAA2RI5ty+XeElhiWz7n/LBguVKifBEKe5bqzE+DHZ3WuM28LE1IbtaDO3Hj8MBpPNFPsTVXRaQoSYL+2dqnBdo5R/nqvQQItlnBG23lL0BGlJ9M8sOfRkMKgatCnUGbhMlaPRRwzsrXMD6dPXQzsbuGbbvuCwSBeyE9e55k4eQsyCc243L0RYbY/xD0ESg/R88wSBlFAWsz3hAy4glM0a7dJXplY9cdQ7JTamLpAg6ynlT0BCvXD+tadZnLtuxKtgMuGXFfXJHZ7TjGqO6/Svrg1+cKeA3QxQZqew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpkxSsDflCvni48u497ZQHKPzo0C+h1dWnGMwWyBlog=;
 b=aK3RlaX3O42x03/QsLdOBRNkhTgDdn4X57FEm0ngqxy2JgmVGMfd10TMRmT7fuHTe2GuW1b6tPnZ3za+XmDtXmrjespR9as6omrOYHjjfUSC7zUeGG+zfO453gS+9VS2KP7E6u9Q0Cy9SQhqaDTIA9A6f+c9MJJS+rnuQezLexg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <64af115c-e3df-d6ff-65fd-8eece19d31de@citrix.com>
Date: Tue, 29 Aug 2023 17:04:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/APIC: Remove esr_disable
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20230829154621.3565971-1-andrew.cooper3@citrix.com>
 <ZO4WODGDiXRj3mrX@MacBook-Air-de-Roger.local>
In-Reply-To: <ZO4WODGDiXRj3mrX@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0245.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO1PR03MB5842:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a02c3f-d97e-4e7d-2494-08dba8a9a88e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aliT3PfVaLOghHiTxd6KES6ra1LPt3IAycuyv1Frk69e7IjwcMU518I74fb1r45njUYgYTW9o4hVoAze1VelCS5UV4Y0OgDPCW0kzC/BVNwVl5pdn9HIxJUNugGXl5rhjFGjk3/ALbHkioic102aDnI9eWoBHHtuQ84eP0QqoKJ0tbM0dNwgzKlwTgM0cKoydsb6h0SClNxO9tgud7vRPkVFwsW5SCApF9sltGUhRJopr2qeStXDLSadVR1HTiUsJ8g0LPeQiIWIc++oE2IKHcOrSotehjtyCqbH5ALOs0fVEXEEwkP9/7VQDM7LUu+THPKKpXN2revvHkLonYfBNAA2/miClR3v9VqZTJqpXU3zbs+fIAMZBAXBrvVWkyqCEkiDyBG5qCL0E3FP3j+Bw6yCuf9/Ufr/JV15x79Qtkj9JKftosL434qHjrFHUUL28BbVJv7H1S3WtFk5RvXrDUaWMSy/LVOcupz7cOZXvbTtEhmEa5Aj+dZ1xSK37sVY3nfI4a4x3wDYrtEvZfhEnYBVRLSCWVVsQkMDXEOYR/NbY+ukwjSgnDui2CA8sr57CBToD0fc/2+sP4lqgLpJCDwETBlDgk9Uq6mFv2qnYEyDmnvFo5+kBeOgx9i3vARbgpU3KOnPCUHoX6oUBL3fzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(346002)(136003)(376002)(1800799009)(186009)(451199024)(6506007)(6512007)(6666004)(6486002)(83380400001)(53546011)(478600001)(26005)(2906002)(2616005)(54906003)(6636002)(37006003)(66476007)(66556008)(66946007)(8676002)(6862004)(316002)(5660300002)(8936002)(4326008)(41300700001)(86362001)(36756003)(82960400001)(38100700002)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmZFUS92NGxrVEoyQWwwcmRFMkpHanlWMTZpYmRiYkZQUnFjVTEwQkhCNzFF?=
 =?utf-8?B?MVdlckRmQ3JCRlBtNmozb2h2SnRkWWpYVUl6NE5HdEN4RW8ybXI4TjlYakg0?=
 =?utf-8?B?R2tid3ZlSFJRUGVWWTIvYTc3dFFDSlNtcCtzODNrNHFjaEpibVEvVm5mZFIx?=
 =?utf-8?B?dCtkUUUzbGdVd3lLUTJDcDVSOCtMVkJNMG03c29EeVZ4UDVXTjRDdWwzN0FF?=
 =?utf-8?B?WUNiZXlONWpWTHFEU052OFRFNnNuYVNCbjMvZStYWnlhV0lhSGcwbm9LcEF1?=
 =?utf-8?B?bmpEdTRseGtNSzRjVGE1cUREZ2FraDJXb2N2STQwSzd3azZZMXJuQUZ5b3Ry?=
 =?utf-8?B?YTB5eHZIM3F0V2FpRHFmeWkraEdZaGljNWd4RDAxajNRU3k2dnRXNlNGV2ww?=
 =?utf-8?B?TDRWYzN5dVdBdTJCL2tPdFhoczExQzM5eTVja2RxOElXYWkvUE1VVTN6SnZ2?=
 =?utf-8?B?L1RGQklEZnpURkxqbGsvd1Y3SHk1dFlKdnY1bHhWS0xsQ05qdGc0akx1bmFt?=
 =?utf-8?B?aEc4U3VvazZoRC9qc25hb29LWXlFK2lRN1MwYWtISGI5NG5XRXEvM01PMnJD?=
 =?utf-8?B?cmtpbXZFSXJRNEF6UmEzdSs1RElUejdSeUVaYkt0MFZvbXF3MnMxdlY0YVRy?=
 =?utf-8?B?YmxFWTlteU5ZSUhEWnlSVEhrR0U4Q0ZNQlJJdzl4WFlPRmZpNjFIWEEzWndi?=
 =?utf-8?B?RjdnQ0VGOHQyUGQzVmY0bE5oc0FJb3c4dUxJc1VIam5Ob2VPSkp5ZCtHSFlI?=
 =?utf-8?B?bDlORHpqTTNETllFNmxna2NMc29DV0JwbzVwcVZaVmRMeFRhTHNaOFV2VHVq?=
 =?utf-8?B?YndEajMzcHgxUWtudVc4TXJvTTlMSGJDajMvb0tRQUxCcVVQcllWeUFkb2VY?=
 =?utf-8?B?SjhwZHEzZEJ0V1c1b2krSkpqT1R0aTBZWU1ISm5NN1BMRjBmWnI5d0lvNU1Z?=
 =?utf-8?B?VFdmMkI5RFJXRWx0ZXVYbmliWWtERGkvZjJQbGE4dzVNb2RRc1FIQk5TcitX?=
 =?utf-8?B?WlZUQ3FaQVJieFpyR25SK2h3ZXVmU0RJMHlCZkw3WEdsbW5ySEsvYjNHV1ZJ?=
 =?utf-8?B?Z0NKaEJOQ1ZvQlQrWjZOelNVVjZ6M1l3UDdPOHF3RGRwb2xKY3dVdS92NDJl?=
 =?utf-8?B?bnBwOWlPSkdrbHN1eWwybDVQcG1VNUczTm9MMW1rYllPUHRYb3RVOUQ4ODdv?=
 =?utf-8?B?N1dKSWJMdzc4L0J0QVYrQUZlbDlSdXdjYmJpNGk0N2dwZ3YxU0lLaGMrbTlY?=
 =?utf-8?B?eFVYU0FGTVdmMU95YjI5RVFsUzNrZG5WUi84dGVqOHEvYTJyekI1NGV1dG5t?=
 =?utf-8?B?UEpaMGxhaFc3WG1hTlp5WFhMK3Q0Yjd6RTZ5QUJsZEJqN1NLT0ZJajk2MUdp?=
 =?utf-8?B?eUJoazhYL2FyMWxFVmFIWVVzUGkyMXZvQlVMTmMycGgybGhwK293WUxhc04w?=
 =?utf-8?B?M2dNaVdkbUd5bzEvelJuOUllTWFGL1BQbUlaOWtlZFFMK1BvQVVUVXZIaEtO?=
 =?utf-8?B?bmI3eUFta2J6dGk2SVpYSXZEVUo3MGQxVHNqQ2dCNUZGcEV2MmxadXp1eDZz?=
 =?utf-8?B?UmNadGEwb21LTUFyQ0xwM1dMQkh6aUhwWm5rVHFzdFlsYVg2cUg1cnlRRlYw?=
 =?utf-8?B?K05qRGtZQTR3cU9VL1JzaThmeTRWVHRNOG9BYXBzNllmQ2VYM1hnUXdEc2Zo?=
 =?utf-8?B?c0poYXZUcmZDaGhkdkdhSDJ2RGpIZ2N3MTJ6cnJCNnpvMCt4SjJ0cjRXWWNB?=
 =?utf-8?B?WmxzaTN1anBkQVpGRXU1QmRoais0RnpjVzhPdDBTb1N0YmUxZXZRZ2RPb3Zh?=
 =?utf-8?B?OW1IOVZHeFJQUURhUlJuSytlYi9RVC8zb0NpR3c4NHE1L0FDcmZzVVVIWHVG?=
 =?utf-8?B?Y3MwVSt0ellUanpLbE5ESThXVXhrS1puNzVLMjVLOC9zT21oTzE1RVVFWitz?=
 =?utf-8?B?ZnhZWXVHcmZNVzVoUWdMbENESHlpMzFaYUQrS2ZOUmJJN2J0OTIxaGw1OUdm?=
 =?utf-8?B?K3VZMWluQmsvMUVJSHdJQURVODJOTDQ0UVdlbGNiWGNyRmlvLzd6T0ZjbXBy?=
 =?utf-8?B?ZSt5N0dGL1BHTmNITXhFU1NqTURIakhwMEkyWXRRT0o1SjltRitoTXdhNjFh?=
 =?utf-8?B?U1B3UXI0ODZ2UDRKeXYxUlFmSlhVaTdqaEwrellxUTBBTFQyM1dIbWFKVmUz?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	i6WsJX5zSMt75hX+zUoKa7b404UVOCZR8BX7kOrn74ZVQOT7ft0hGCmJIRcxcGELejTCl02pvqZti+nOL962zSDduqqe4X+sBKnq0kjfrddNnLhWMdtDFZAHVboqhbrBHb5SC6WOvowZbxgr86Lvjor2ft/+Y8vGVBENRwfUiT0OolODMCGKH/pEUEp1YbbH8QU9dbS180elboVcfovQkgjiwCsWsp61n2n9GMMAfQho21dwZFlZznmRPnlmrGzqztrERbpG0iZEALQc3HltTmjw46Oo0cvXS7+tf/0Y3duvhNXbRIGwalVoGk6y0Bdy14FPbv5B5q7/mq0uQUMTk6rQzQzYldDZowIm+pMOAw643QCqpkR3A3LWNn4MVbsP402MH/+OhGlgnwCMnFdZkJYTMMlpNKrq61rl8CMLjsNAOWIEr+1huEKZJRLq0RopfVk79TdVsfaN8reKLp61njfX+k1bcAAUIIwb9mGI/8Ltj8Bmwhcfzhng9XoPO8yhPkqL2Tx7EXGK/CIBaSaoWVQLDR2JY2jcPrgOlccR+3bKrhW37eFccP77qVhnywjp8a4dWL9E3XD7TgSrJRIbh+dTVpK7BRwEdXFQvHSplEJvbFz8Lg8HqevZGWByT0gTqvMwvyJK5TCCF0DSKvcFL8e7Xdey0tHLStTmVef72OSWjYFBcFuTr7T2sEM05nquJiYNlFfI+bXVaj7KJthpgw8MEuL/HmpiuJ2eUHMZjr/uEtppVm+bmEC4w8bOoOwCrrwdg58GfJKAhj1VhCVDXMQqgyzVVn775Ua9lIihRTUlBDtWkRs8gtHNM3WJEmE2
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a02c3f-d97e-4e7d-2494-08dba8a9a88e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 16:04:43.6718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1+2ZW0BwaYMKPK3BU7hsVy1Iml6tRAWLiCwnPMA8JLwuHUcS51XZxGsHqWFcFix4gQAUAatKmHBWOwXGGob668sIr3Mn1GieOXBiCPcP6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5842

On 29/08/2023 5:00 pm, Roger Pau Monné wrote:
> On Tue, Aug 29, 2023 at 04:46:21PM +0100, Andrew Cooper wrote:
>> It is unconditionally 0 in Xen, and was deleted in Linux somewhere between 2.5
>> and 2.6.
>>
>> Remove it in Xen too.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> I got bored waiting for `git log` to tell where it was disabled in Linux...
>> ---
>>  xen/arch/x86/apic.c                           | 50 ++++++-------------
>>  .../x86/include/asm/mach-generic/mach_apic.h  |  3 --
>>  2 files changed, 16 insertions(+), 37 deletions(-)
>>
>> diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
>> index 41879230ec90..5c6935ba42db 100644
>> --- a/xen/arch/x86/apic.c
>> +++ b/xen/arch/x86/apic.c
>> @@ -496,14 +496,6 @@ void setup_local_APIC(bool bsp)
>>      unsigned long oldvalue, value, maxlvt;
>>      int i, j;
>>  
>> -    /* Pound the ESR really hard over the head with a big hammer - mbligh */
>> -    if (esr_disable) {
>> -        apic_write(APIC_ESR, 0);
>> -        apic_write(APIC_ESR, 0);
>> -        apic_write(APIC_ESR, 0);
>> -        apic_write(APIC_ESR, 0);
>> -    }
>> -
>>      BUILD_BUG_ON((SPURIOUS_APIC_VECTOR & 0x0f) != 0x0f);
>>  
>>      /*
>> @@ -628,33 +620,23 @@ void setup_local_APIC(bool bsp)
>>          value = APIC_DM_NMI | APIC_LVT_MASKED;
>>      apic_write(APIC_LVT1, value);
>>  
>> -    if (!esr_disable) {
>> -        maxlvt = get_maxlvt();
>> -        if (maxlvt > 3)     /* Due to the Pentium erratum 3AP. */
>> -            apic_write(APIC_ESR, 0);
>> -        oldvalue = apic_read(APIC_ESR);
>> +    maxlvt = get_maxlvt();
>> +    if (maxlvt > 3)     /* Due to the Pentium erratum 3AP. */
>> +        apic_write(APIC_ESR, 0);
>> +    oldvalue = apic_read(APIC_ESR);
>>  
>> -        value = ERROR_APIC_VECTOR;      // enables sending errors
>> -        apic_write(APIC_LVTERR, value);
>> -        /*
>> -         * spec says clear errors after enabling vector.
>> -         */
>> -        if (maxlvt > 3)
>> -            apic_write(APIC_ESR, 0);
>> -        value = apic_read(APIC_ESR);
>> -        if (value != oldvalue)
>> -            apic_printk(APIC_VERBOSE, "ESR value before enabling "
>> -                        "vector: %#lx  after: %#lx\n",
>> -                        oldvalue, value);
>> -    } else {
>> -        /*
>> -         * Something untraceble is creating bad interrupts on
>> -         * secondary quads ... for the moment, just leave the
>> -         * ESR disabled - we can't do anything useful with the
>> -         * errors anyway - mbligh
>> -         */
>> -        printk("Leaving ESR disabled.\n");
>> -    }
>> +    value = ERROR_APIC_VECTOR;      // enables sending errors
>> +    apic_write(APIC_LVTERR, value);
>> +    /*
>> +     * spec says clear errors after enabling vector.
> Is it worth making this a one-line comment while adjusting padding?

Yeah ok.

>
> Regardless:
>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

~Andrew

