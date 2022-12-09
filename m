Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F881648A51
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 22:48:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458267.716168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3lEE-0005Jx-FO; Fri, 09 Dec 2022 21:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458267.716168; Fri, 09 Dec 2022 21:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3lEE-0005Gx-Bg; Fri, 09 Dec 2022 21:48:22 +0000
Received: by outflank-mailman (input) for mailman id 458267;
 Fri, 09 Dec 2022 21:48:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/vX0=4H=citrix.com=prvs=3351f26b0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p3lED-0005Gr-6w
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 21:48:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 310bf3a4-780b-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 22:48:19 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Dec 2022 16:48:12 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5802.namprd03.prod.outlook.com (2603:10b6:806:f9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.18; Fri, 9 Dec
 2022 21:48:06 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 21:48:06 +0000
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
X-Inumbo-ID: 310bf3a4-780b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670622499;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rUgU4yRuYSoG/+a4ZiHw46MHbVaRO4LNmBcBeohLDL8=;
  b=Lw5sT5FtNejBXoxgFLh4TJIkkjvEVHHk/nnku36SfTdyXu140/f3HlsM
   OIrGxudbWIYF/mLvmMsWIS5TxoHItGkJof5fu15A+zwPJ5wsMAXOGXIcQ
   4F9z29Zb7HNS2C9q+C3sI7YIMJ+JGkyY6ZR6EWLKTAUdJImG4y5K2yTpP
   8=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 90127988
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lZQzs63JtN60bP2dmvbD5fFwkn2cJEfYwER7XKvMYLTBsI5bpzQGz
 DROXzzVOqyONjagKIt/PITk9U4FscSAxoUxTQBlpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wZmNKgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfWDpHq
 6IAGR00cxmtv7iG7KC/FLNpr5F2RCXrFNt3VnBI6xj8VK9ja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6Kkl0ZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKjAdhNRe3onhJsqAytl145LgU7aV6Eg+PikUixAdRNe
 3VBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkAowXQqYCYFSU4P5YnlqYRq1xbXFI89Qeiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAszA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:TFfrSaA0cTaFkmvlHej1sseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuaKdkrNhR4tKOzOW91dATbsSoLcKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUeF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlil9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4sow3TX+0SVjbZaKvm/VQMO0aaSAZER4Z
 /xSiIbToFOArXqDziISFXWqlHdOX0VmgLfIBej8AfeSIrCNXMH4oN69PxkmlGy0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59as5Xxa/ptVFZ9l/1owKpuKuZIIAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkdoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWtKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEniefvFmHKc7hiwlbF/NLggFkPsulqSRkoeMNIbDIGmEVE0kldemrrEWHtDbMs
 zDTa5rPw==
X-IronPort-AV: E=Sophos;i="5.96,232,1665460800"; 
   d="scan'208";a="90127988"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xh57pbHMfKKBIfHUacuhiO8JG23sXv2KZCOWyGL+LGobddmM8KyOEvEkCjY4wwNGihEZix/b/y6GO+TeUjSKvaKF5zFHbcmCUHlzFiKjT79ikgDHLbXrA/ULDJPCMg1WRvAdeCzKlPwl0KjIWqkwITaTA29l1pi5xymBcrYcOku9C2tQK9o/QCvt+rwK2LIk0lotj+JBH7OS9t3kXFzXlF/VVoTOsGdfAKfSSr4SL1sI+ji/bDxaHQdy7m/eqBq3fBJFtH+pf4ZbrlyRds5Fy+E/5+XRwj37TgonubT/qrrWjvxlCDmUIp8fhzxy5jjrWVoYH6va9gwLxzuPEtAEpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUgU4yRuYSoG/+a4ZiHw46MHbVaRO4LNmBcBeohLDL8=;
 b=Vv/ezyjf1lhNvQ0Qy3Zh0xw6FYkee5mTHQS+6CoC+EZQq5dgz3ZcA1Ik/Zt2DPmxeIK7QILqHNyygmKmDcuJsjXLTT35asTGVj0chIrRunOR4jppPe40RLt5I655Zb9WZg76ZIhAUbOFXljfE2esmwaCMhkifM4K9SsXcSOo2dCLLKreehYFqXFO40TT6t9FD+h4ByC0WLgWlmP2CzkqqAMaacXFlYklQNRpbe806AcUbOMqNZ/bf08MBWD32PD6moCIoTL9ziVf9/YjJCpGbAQLpy4bUiMt/EDbZws6SBEcAn3SK3B8cuSlEVFYvEbm8B2dT97LJ+SXXBZoyJaTIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUgU4yRuYSoG/+a4ZiHw46MHbVaRO4LNmBcBeohLDL8=;
 b=xBSEZ9GnyXItyEzwopdJqAnbui2wXvPCk08vxtVUBHks7EC6jzuwycGpGUp3D6xhyG/PAWXrkCknmnis99Pf1ixSWGQumBiNHs8WyyJRolfotCEN0A7f+jlZTDVNnuGdGY8uPMUtEBqq3CegszSWsVNhe729DtpomVQnKf5yB4s=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 3/5] x86/mm: PGC_shadowed_pt is used by shadow code only
Thread-Topic: [PATCH 3/5] x86/mm: PGC_shadowed_pt is used by shadow code only
Thread-Index: AQHZCXpM2cQpccRTS0mqJcKyQ1lQz65mHOGA
Date: Fri, 9 Dec 2022 21:48:06 +0000
Message-ID: <e15917f0-b675-86ca-45b0-73c33dbe0356@citrix.com>
References: <41a370eb-09b3-6e0f-7fb1-2d6e33d25021@suse.com>
 <512cfa7e-00b8-6efa-89d1-c850ade61231@suse.com>
In-Reply-To: <512cfa7e-00b8-6efa-89d1-c850ade61231@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA2PR03MB5802:EE_
x-ms-office365-filtering-correlation-id: 1a0fa4cb-266d-4e36-ef2c-08dada2f0e4b
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 y5tgGUZ/URcyYlEoOxSjcdCQDA4fkP5K3pxsq1YCME7ulFGrAVDlQHgMN6JhWB7sky4qpPlFMWs57z7r7nRZcRWm7iK87oVSucrqWV24ykGuiWCpvins2lN/S+LH7SwH7x4oKP04ebCszWUOuxIJP4Oroa5VozuydmpJ28z82ukIetrGcxIEHEE2vuEUiYS4rmhTSxNCNgOLa5bwaEp5tyDutiPL34OdqZ/jIrhX6W7NbTuqXdf2gWri87Ta8sc2/pkeNtDvP8DU4Q7YKzg/zz9+omFwOr0rIFNrF7T5gLLIuaGZz6REKdiTaU19dNfsLnkJqHCyIqV4l2EVebdi/LTN96C76BL0hXKnfYpE8PkjmjPF+mvLZgXcHqyCvQ17vjHVVbFqf0XL4E8Hs8CC74SbQouXoltLil1d2bXtTDNZc9Rvl//4aZZFmGyKvCVlLK/6pijyyOPi+hBqM4VQlSWRiMxQo3WP0XSBaETunCVnD84I/poAcMEZPZNNo+iz4C1IozYkBMumeTRVQY2tOfNwKcguafZa9Vn5H+In98FEz8855uI6eRhBEIfKzv1KyILRgWNamvgaNVChj+CZIOaLPYljL/tgYLFZXqQnPKawhGGdsGoO8k7r+I3SMaAt+ScBtUz+HTQBODHwHoS/OShs45FY5/LvKjaSQG4ctKsukjBz2Zh+nt2Ozu8PW3jTRtiGeBhi/ZkCMiS8NGnw40RubUYjmbHPKhSqhT9VfbbWoCklrcrD2ntW9lb+lLk3W/qJ2rnNuis+cdjIKmEyfw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199015)(316002)(31686004)(54906003)(110136005)(71200400001)(36756003)(91956017)(76116006)(6506007)(122000001)(8936002)(5660300002)(38070700005)(53546011)(8676002)(66946007)(4326008)(64756008)(66556008)(66446008)(478600001)(66476007)(6486002)(2616005)(41300700001)(107886003)(6512007)(2906002)(4744005)(186003)(26005)(82960400001)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZkQwRnNtUHNLMFF4aW1DSURra3Z2cDlJdENrTkQvOVVVTGkzYVdVWndpVHB0?=
 =?utf-8?B?NEtGd0ZzbzU3NjhHaEVDYnU2QjBsNmRodU0zMWJ2QlRRZVJVTlhHUlpmU3Br?=
 =?utf-8?B?ZUNkbkRzaVBkK28xYkZieGZubTJ1NTJwQm12WVhhTzNTRWNpYVJkUHhBSyt5?=
 =?utf-8?B?cm01TXJVT2JySXVPejBKelJneUwzL3g0WVh0b1dINll4WmFJUDZoN0NkSjVW?=
 =?utf-8?B?TTJZVUVTU01ZcndMYlEwMTVyZ1p4Qk5CM0g1VzhmZitQbktGR1lQMUFNemls?=
 =?utf-8?B?NkMzemJkZUcxUHBTOHVONTVYMFN1NUVvNWxvZ0lPVzd5OUhock9sRTFwdWRK?=
 =?utf-8?B?NDdFYmlxS3ZpZTdiRVRQQldZMXliZVV3akZ5SkJ2eTRZU2ZZYkNtRHFsUG1C?=
 =?utf-8?B?ZXVpZ29Qbk9Ub2lsN2F0dHNpWFQ2bGo1Z09VcllTZlpTSGZoUE1HYW9mZ0lH?=
 =?utf-8?B?RHhMa2cvMWhvd000RDlYT3JXTmlWOVptcURsZWxyTU5scnZHeXhQR2ZDR3Bn?=
 =?utf-8?B?SlBzeEZ1aE1Tckl5OTUzc2hCUDkvREdROHVWMWt5QjhtTXdyWkZNaGwwRDEw?=
 =?utf-8?B?TnA2VFo1ZnNpY0RON2hNNm1SYnR0WVQ5VTl1SXBJOWwvNnVPejBaL3ZhQ2FP?=
 =?utf-8?B?aXFPcy9sWkxqU0ZaNEhaeHdEN3FXQ3hwYnVaT2J6UlNuNFRVTUFQdlpoSE1W?=
 =?utf-8?B?WE0vQTZZeVplOW0yS2pSWjdDQ1RUeHhyQ2cxUnF2ZDNFWXhmM01XTXB5Znlz?=
 =?utf-8?B?ZkJ0ZlYwVTk0MW1MckNQckJOaVdPczAvSzZqQ05uMGlTY3ZuMGhYU3pnd3dx?=
 =?utf-8?B?VW5UYjRCSVRvdThISFNEMzVjRzBHd3d0Q3pzVmtBbmJmT2VPejFJQjVWVnpX?=
 =?utf-8?B?b3BOTURrTHVpVjJ3NWRUQXNZVjJiaVplRi9XeUlPNFFmV2NrdzNabEFWRWZU?=
 =?utf-8?B?VUYwZFpxMDVOOFhDQWZjR2lEdVhoWTgwU0RZZjZyOWcvNGJSRnQvNU5qVGkx?=
 =?utf-8?B?cmRGMnAxZjVHV084QVpWN2JIaHpPN1JFdDJLTFgwVDFDN1MvUS9vem5ZbGE4?=
 =?utf-8?B?Y0NQVmZFTHJSd2FjUTRpRDAyd055R0ZxSU1PYzdWaVplb1cwUG9wSUtVN3lt?=
 =?utf-8?B?ZHlSRHFrNzdaZk82VjgvWGVOM25zRFBZODF6UWdjdTlvNHpaZ2lBMDlGL3Rt?=
 =?utf-8?B?RXUvUFVKNWFvT3k5MEtaWVhYQnhMN1hKbVk3MS9KY2J0Y0dCNTd3WlVMMjNW?=
 =?utf-8?B?eC9kb2l3bFJYODFpbmVteFBkYzhCUnRWMlE4ekp1dExGYkhHYmEwRFBUR3RZ?=
 =?utf-8?B?UTRYd2pueGNPMk9LQ21VM2x2b01keXdOMnNjc2RNVXdnVXZVb014aCtSV1VK?=
 =?utf-8?B?alJIeG9sUUJURHFlMnpCejVnazZWODlSa1ljNGFudjl6V1l3UWp0OG9SRnZR?=
 =?utf-8?B?NDlqMXdRN0RHS1d0Uk9MdWNQbkU0TmtOS05maFZ3SFhsWFVJUnZLMlRsUzNO?=
 =?utf-8?B?bWQwZ3JJaUNzN25jUXJkWk4yemI5RDJOK2lVK1QwWGs5YmF1SG1NWFdHTVhk?=
 =?utf-8?B?dkJodmkreFIwaHJLT25zNG9abVBFT3NLdlMwbUsxL2ZlUVhNTTVFTHcyZUp2?=
 =?utf-8?B?ZXVsaWZIbStQaU5Vcnc0dWNtWGxINEFLMXdyd29aOU5EaU10UlpjUkw5cW5n?=
 =?utf-8?B?ZmxubVVhdm15WmRLVk52bjA2TFhsU1ZDZ2lZRytJaGt2aUhIbVJQN2xhY1JY?=
 =?utf-8?B?Z3dkNldjOXkwT2lPUmQrUVBkR1hzQW5qTlZJY1NTNjBlU1dlRU9jSlAxS3VX?=
 =?utf-8?B?SDNnR0c1UTlxNHhDRVVqK2RRbDVOendVbWVPVTRBN01DdjlJODdZN1Vablo3?=
 =?utf-8?B?MEZCNUNHeTdES1ZGUHdSSEx0NXNQNDZZMzg5R01sNGcxOGFBNGRESVhwQnRE?=
 =?utf-8?B?SU1YSm9pTzgrdGNWVllUVk1kek1PNXRNd2Npc2lja2NhREU4UDQ4Tk1tbVJZ?=
 =?utf-8?B?VEJOMzBmYTIzeElCYkFxeVBEb3hYc3dhRmpiZy9uVFpmWmZBVjYwU0JDczdN?=
 =?utf-8?B?bjEwYlp4M2dnMW5OQ2l1WkdObHB3YlZ5NXVBT3J5TmVkYXNoWVo1WVd4NzA1?=
 =?utf-8?Q?yln6lLMf751MuNfIYdfd3/ddv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6DA08268C9F004A827752C43FE99432@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0fa4cb-266d-4e36-ef2c-08dada2f0e4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 21:48:06.4053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1uLkJIm4oWeCYPTWdUoWpiFfChMyN887xGd46VP4l0J5ga8gynSawlDidSvRdKtDYKLx+yMA5Q6I9Rala3HP0WDwmodmP3mvgnAz9pk2Cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5802

T24gMDYvMTIvMjAyMiAxMzo1NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEJ5IGRlZmluaW5nIHRo
ZSBjb25zdGFudCB0byB6ZXJvIHdoZW4gIVNIQURPV19QQUdJTkcgd2UgZ2l2ZSBjb21waWxlcnMN
Cj4gdGhlIGNoYW5jZSB0byBlbGltaW5hdGUgYSBsaXR0bGUgbW9yZSBkZWFkIGNvZGUgZWxzZXdo
ZXJlIGluIHRoZSB0cmVlLg0KPiBQbHVzLCBhcyBhIG1pbm9yIGJlbmVmaXQsIHRoZSBnZW5lcmFs
IHJlZmVyZW5jZSBjb3VudCBjYW4gYmUgb25lIGJpdA0KPiB3aWRlci4gKFRvIHNpbXBsaWZ5IHRo
aW5ncywgaGF2ZSBQR0Nfc2hhZG93ZWRfcHQgY2hhbmdlIHBsYWNlcyB3aXRoDQo+IFBHQ19leHRy
YS4pDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
Cg0KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoN
CkNvdmVyaXR5IGlzIGdvaW5nIHRvIGNvbXBsYWluIHNvbWUgbW9yZS7CoCBJJ3ZlIHN0aWxsIG5v
dCBmaWd1cmVkIG91dCBhDQp3YXkgdG8gZ2V0IGl0IHRvIGlnbm9yZSAiQU5EIHdpdGggc29tZXRo
aW5nIHRoYXQncw0KY29tcGlsZS10aW1lLWNvbmRpdGlvbmFsbHktMCIsIGJ1dCB3ZSBoYXZlIHRo
aXMgcGF0dGVybiBlbHNld2hlcmUuDQoNCn5BbmRyZXcNCg==

