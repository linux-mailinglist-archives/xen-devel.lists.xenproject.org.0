Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF526619C71
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 17:02:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437743.692196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqz96-00043T-Dz; Fri, 04 Nov 2022 16:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437743.692196; Fri, 04 Nov 2022 16:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqz96-000401-Ag; Fri, 04 Nov 2022 16:02:16 +0000
Received: by outflank-mailman (input) for mailman id 437743;
 Fri, 04 Nov 2022 16:02:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hilw=3E=citrix.com=prvs=300b5b1ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oqz95-0003zv-Nt
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 16:02:15 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ac31687-5c5a-11ed-8fd1-01056ac49cbb;
 Fri, 04 Nov 2022 17:02:13 +0100 (CET)
Received: from mail-bn1nam07lp2045.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Nov 2022 12:01:53 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB5193.namprd03.prod.outlook.com (2603:10b6:5:241::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 16:01:49 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 16:01:49 +0000
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
X-Inumbo-ID: 0ac31687-5c5a-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667577733;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VkbPIL7eqP3CS0NPZl9NVAct9MCdv4M0mLZsnmutxS4=;
  b=UnjbaN0xhid1+aMmlbeD8ohmBytCxzG7iy6rJVj1VdujAFl9RVMLJ2n+
   nGM17jfUvGwB6CUdBnUS51skxDKy0iWHG5Ne19Kg0s5DWlXcddkOIydyJ
   GVH7C9YkxG8iyJ1tAB1Bv6Z48qi2V9wzlA2x5Y7VaKm7doL3ytlZ/ROF/
   E=;
X-IronPort-RemoteIP: 104.47.51.45
X-IronPort-MID: 84615033
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9AUErKm+gBcIEZYoAX/FKdvo5gx9J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKXmmGP/3bMWamL4tya4uxoUIG7ZaByNRiGgU9qiFgFiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5AOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fElOisKSy+nu9i/2LilZtVqoNYnK/C+aevzulk4pd3YJdAPZMiZBo/svJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVU3jOWF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efwX2iBdpJT9VU8NZ2oR7N2VwDSyRPFkmcuOnnqEWPdfN2f
 hl8Fi0G6PJaGFaQZsn0Uxy9r3iFvTYTXtNRF6sx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9aX+b7KbSkjq0NgAcN2pEbigBJSMa5/HzrYd1iQjAJv5hGqOoitz+GRnr3
 iuH6iM5gt07j9MNkaOy/lnFgjeljpnPUgMxoA7QWwqN7Q5nZYjje42h73Da6+pNKMCSSVzpg
 ZQfs82X7eRLB5fUkiWIGLoJBOvxu6vDNyDAi1lyGZVn7y6q53OoYYFX5nd5OVttNcEHPzTuZ
 Sc/pD9s2XOaB1PyBYcfXm57I517pUQ8PbwJjszpU+c=
IronPort-HdrOrdr: A9a23:aqN4F6MTA3Ov38BcT1P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 Dsr/au4FGbCAcqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPwf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0amSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7tvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wI9HdwGOtx5Dt
 //Q9RVfYF1P7ErhJ1GdZY8qOuMexvwqEH3QRSvCGWiMp07EFTwjLOyyIkJxYiRCe41Jd0J6d
 78bG8=
X-IronPort-AV: E=Sophos;i="5.96,137,1665460800"; 
   d="scan'208";a="84615033"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqqPRBp2zxx4MQwVEbh/g4Qq7Vaa1vQOS8XZjCvHPbTWl5xZT0Dbzq+10aMpM+9FdMaT90+ERbzcG5I5OT79q+1R/1ma0+kBDj3bXJ3H4PDQ5RGJHnQ/JdQMGv9NlySWexzzlLO9z96QwOjjDgSo6ZOivAjaTSiswpYe8vGG+lvOx6U0aDeWrapAUTLNy8ch7rd482t/5FkPugBHoxlG6EL7KgK6XG8Tl1861jiAqXBLBgxyf+GO93dAFva+XOapi0ALRUhICXjhedr+pq+5ytcAZa66Sw9x5RcjEO6biEP+WUEmMWrM2uoWVLfRQCEykbmFG6qQpjllJh/zT4H4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdADsRAL26iqXpbjPknC6YkRukOhKl7sqTPpsiKisxg=;
 b=CVu2WNdnLhTIUAWuQAYY48Hp5yHUo49KdW1T2exNaM4Xq+f/yTTyiHTsUlMPbEEga3PdtvEnJDzW+WW9Zt/p7LyyZYuvbBDR5Xl20SWoYy7lrwynw/LlwMW4XwFad61K3Gk6pJk1+vTeQdGKF7V4/5R63q/TAzGUR81lW1IFn87UcYqAlKt5CeW4PTkUTuFIFoTrR99pd0WTv36wMhiKHLJZrU59sofEKRXBOqgeoZ+ZvARKib39p9+UPBGVTUfOOB5VwZLGyujG+TLwuRwKTO6f0Z0uKOuXIeg3kVVBL+6JDUychw0Hu1W3XRwvG74Fp8oxKCsKSFq2yjVwh9zgQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdADsRAL26iqXpbjPknC6YkRukOhKl7sqTPpsiKisxg=;
 b=LmDgRW48fco6hF97Umedjy1BGWq0aALigNPqA/bPCQKVpbaFo5a/v8rHeKo4ociiNJEix/cOBrdZIfnOc96DZIRvo7LmdN/q0XGtK6VSELTcGTdHFSvTAUMGjelzBBB3RqfpQqbYasjz6RwWt8NLweAOciw2dxjzEUFPsl8iV2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 4 Nov 2022 17:01:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <xadimgnik@gmail.com>
Cc: xen-devel@lists.xenproject.org, Henry.Wang@arm.com,
	Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH for-4.17 2/2] hvm/apic: repurpose the reporting of the
 APIC assist options
Message-ID: <Y2U3Zf/nCv3PlTxa@Air-de-Roger>
References: <20221104142235.36556-1-roger.pau@citrix.com>
 <20221104142235.36556-3-roger.pau@citrix.com>
 <2a3c5141-516d-a5e4-392b-e7fe54f3781c@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a3c5141-516d-a5e4-392b-e7fe54f3781c@xen.org>
X-ClientProxiedBy: LO4P265CA0231.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB5193:EE_
X-MS-Office365-Filtering-Correlation-Id: 76af45c9-0f4f-452c-f105-08dabe7de19a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	967L2XouYHcjU9bsqvgPGbjWKyo8vRoNLNDWRSvIc6TCt+a/2JDlLblzIDWC6MDKcwdSsFC1pdZE572HVsPafjQgJAmfMPYh3Zh4jbjSFyWfv5WgsaAYDgaN0Sw3FDUiT3x5vkinCMXFtsVFlmw0gKzwkzTXwJXiWRraolL+LI4umGYOh8wkMhcduxNKECZ8njQfN1GphK5mS21ESVBEYdCqcZ1Do2WuPdMuKNHlYfLJQ75jVx47uoVK41g7m/BD+C//3ujA5hEATf7XpOwrxzBKmzo30K8Ko7Otva2bIL2hKsGTjqH31mR4gkxsFi0v966gLgj/WI5kg9PoYTBTiRZYACdWCkWAPrKNCfve1DN287L88PYPrGi09U+J10zFg5hbTHAsOivUmZvlnetF76AiiyICRJge7oNqS7DwxgRNr7uOWyHx2e52wzI0JD1lbQybsplAt2eOTTqcc/JebHsbjcGS9aIGAloekjaGZAQ0br8zb7p4V7jn0jp/2faoHoSajZU9Z2iDV6PbgXuAsJDse4ZMq7SOOuOtuJBsBRu5uEgoI82+xKBfyHCCe9DbwnRZ/QbKVII0C64THOcm60E/K/f+jCi5nzSzYBkPwtwtjqClJms11Owegu8MrGOWwoeU93NjpIYex/ty5U4yfND3n8SaAsctqq44K474sv9VlXyMdKPamr/ErcWVtaqtTm9P2pT8909eJTTKbqT/ZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199015)(6506007)(316002)(9686003)(86362001)(8936002)(83380400001)(5660300002)(186003)(85182001)(2906002)(66556008)(66946007)(53546011)(66476007)(8676002)(41300700001)(6512007)(26005)(4326008)(33716001)(478600001)(6486002)(6666004)(38100700002)(6916009)(82960400001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzBnRk16dlN5Vm9mU3h4U3NieUttYkZpZlJ6QnJuM01HdndPQ0FDRzJLSkhy?=
 =?utf-8?B?NWtTNUY4eVhFZndwNVNoMzZBaHcwYm1nWFhHeW1BU1Y3S0hWNnlkbXdLYS92?=
 =?utf-8?B?dVBEV1YxdkdycGNEeTlBcVNLdjRGZGJ1aSszTDRiU0srNGN1SVFpQXUwdHRp?=
 =?utf-8?B?KzZPanQrYUFnZXlja3ZlK3J2MlR0K1ArYzg3RFc3L0szUkZVVDluT1dya2hx?=
 =?utf-8?B?L20rNm1JMTBOQlp5NHNxTEE3NXM5UEJhbWJnMTUzcEFTMzVjK3NCVzU1b0ZS?=
 =?utf-8?B?RFR0WTh3RWV0Lys3MEhuMGdEMGlrM1VvTEFlNWlvZ2tuUXlVSXdRbTliU2lH?=
 =?utf-8?B?c3FOTDlnbG5qZ0VOV0NlRjlCd0phdkZabWY4SC80L3R4V09NSlowR1JhdU4w?=
 =?utf-8?B?ejYwQlc5SDJDM3NDNXVPWEhDZ0xCa21vZlE2aGJKMWQ4WEVDOUlPZzJESk5p?=
 =?utf-8?B?SkY4Tk8rNFhOT3NLR05VYkRtY1VxeUZTZWt3N25uQWExZnRpL01VU3I4R3l3?=
 =?utf-8?B?QUhsR1VOTVdMYWZtVGpTc014c3J1WUVOdCt6eks5enVUbnJXN3NWamo5SEhG?=
 =?utf-8?B?WFBXenlvR2hyTWgzYkljWm5pTytPbXlLeUpJdHR2ZDdLS2ZBbUJKQ0RMNC9G?=
 =?utf-8?B?WkgvQlN6OU0rTG4vdG90MHJ5TjA2YWZwTWlnbkptVUpUYnFnU1padzdnVHls?=
 =?utf-8?B?cWw0dXAvTmFzS2J2b1FVNVF5TGQyd3FaTXhGZVpQUGsyOWl6RlU1OWd5K2lC?=
 =?utf-8?B?Q1c2OXVRcU5tRmozSVhicG1sODFQVlp5MHlNTTV2S2s2ZmhNQ0l0Vm1QbW5C?=
 =?utf-8?B?UFRScXJpRklBRWNEMHA2Z3J1b1hqMEFQQ2M1Wmx6aVdXQVUwVnFDMklEazVv?=
 =?utf-8?B?elNuWlFoV3ZEZTJsRm03dzJMYkJLSk9STW51WlV5Zm1SUTgzbjRWblFhblY4?=
 =?utf-8?B?V0paazhIaWxaaVVpaUpJNEpTWWVEZDd3bW1TQW5VejZiMFZJMSt3YWNUMFFY?=
 =?utf-8?B?SUh4QmNTUThRNjZjc1BsTVFqQml4WTNzVlNoNFRGaXhVNkN4ZHdLT05VYXNU?=
 =?utf-8?B?dXdSTVZNKytmS0wzQU53U1ZYcjRsWWhvRkJabDdWQ1BuY21EcG5PaEp2VjNa?=
 =?utf-8?B?ZTlRUXgyMVppWmZoQWtpSUExVXNSUG5oQjRZZ1ZPSVdMODNuQ3YyeTZESXpk?=
 =?utf-8?B?VWpBVlZnT0plWEJlSDFpRU1iZ0p5YVowYmRDTGRrbllnYlROZE1lZzFQNUtJ?=
 =?utf-8?B?bnpiem1UM0V2NnNoYS9jZHVVNWFwQVdFdmhkSlgvUzd6bWlybFpTTHVobUFL?=
 =?utf-8?B?MmdNYjFYZkJTY3lQRSswYWlWNFRLbUNVbUJkS2wxVXd4TFdIb1J1TkNHZHZh?=
 =?utf-8?B?bGxLM1Q3S1ZYdUZRTEpSRXRST2RCTlpENWpHOU9pS1B5S013R2xQLzlKTVIz?=
 =?utf-8?B?cDdKTlR4R0RDYlBYanNKbzhRZDFBVDVSTTB6NlVsWkFuZi8vWm16NjVBOGRp?=
 =?utf-8?B?RHlCWGl5andrSXE5b0RMOWoxRW93bU10UHNuK1FXdjBRZFhDdTJSbHlvR21X?=
 =?utf-8?B?Skt5WWxYTzRJZlBHRDY2V2xnUlpUT1l5ZmlNRkpUaWMzWWI3bmxIQWVPYXhu?=
 =?utf-8?B?U1NOTlNXQlY3dkVpaURGRkMxV3N2bUtDMzdLQTFieWc4SGhad1dQcTREbjk5?=
 =?utf-8?B?ZEVUdmVpNUxtTVV2ajQ5dFlBK2VkeGZXUWRETGtGTm1Hak5yY0t0MmRzMlRM?=
 =?utf-8?B?bDZId0hqRXNLQzFDQVpJYk8xc293bFFPdVVYdE4yTzQyaGFEbVA4NVNaSk1T?=
 =?utf-8?B?N0RDRGsxT1JUbk12QUUxSTQ0NVlzWjBNaE1BaGVHVWpxSWpLSzR3N1JyRW11?=
 =?utf-8?B?eTVHMnBSOTRoN09VbHc2WkhhZVlQcmNPN2o0R1ZhVWpHUmRaeFQzV3QrZUhH?=
 =?utf-8?B?R1B3akNNL0NFWXJWdUpTenc2eVBJM1hWWDNCY3pvZG1wVFZ2TWtGRVBYMUFW?=
 =?utf-8?B?RUtHOFZlbGJ0U2hwZjJuUStSMzN4Vy9YdDMrVSs3UktDYjNOcHZWbEdDeEpi?=
 =?utf-8?B?UVdxa1FsY3lYQS9jY0NacWh0WjJXQjFCTU1lc21NU0ZwSUVnMkZyR2RXWlFl?=
 =?utf-8?Q?j/n6X3JZYKlXPaijNbO2B7HDK?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76af45c9-0f4f-452c-f105-08dabe7de19a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 16:01:49.4219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uATGNShFgOivSRXDxCUkaTgedvDlf8Fyt5O3p95FiU5N/sTEuF4z9xuce5Nc2l3icKc6PKGSTy48LQDAPGw10Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5193

On Fri, Nov 04, 2022 at 03:55:54PM +0000, Paul Durrant wrote:
> On 04/11/2022 14:22, Roger Pau Monne wrote:
> > The current reporting of the hardware assisted APIC options is done by
> > checking "virtualize APIC accesses" which is not very helpful, as that
> > feature doesn't avoid a vmexit, instead it does provide some help in
> > order to detect APIC MMIO accesses in vmexit processing.
> > 
> > Repurpose the current reporting of xAPIC assistance to instead report
> > such feature as present when there's support for "TPR shadow" and
> > "APIC register virtualization" because in that case some xAPIC MMIO
> > register accesses are handled directly by the hardware, without
> > requiring a vmexit.
> > 
> > For symetry also change assisted x2APIC reporting to require
> > "virtualize x2APIC mode" and "APIC register virtualization", dropping
> > the option to also be reported when "virtual interrupt delivery" is
> > available.  Presence of the "virtual interrupt delivery" feature will
> > be reported using a different option.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I find the logic in vmx_vlapic_msr_changed() hard to follow, but I
> > don't want to rewrite the function logic at this point.
> > ---
> >   xen/arch/x86/hvm/viridian/viridian.c |  2 +-
> >   xen/arch/x86/hvm/vmx/vmcs.c          |  8 ++++----
> >   xen/arch/x86/hvm/vmx/vmx.c           | 25 ++++++++++++++++++-------
> >   xen/arch/x86/traps.c                 |  4 +---
> >   4 files changed, 24 insertions(+), 15 deletions(-)
> > 
> > diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
> > index c4fa0a8b32..bafd8e90de 100644
> > --- a/xen/arch/x86/hvm/viridian/viridian.c
> > +++ b/xen/arch/x86/hvm/viridian/viridian.c
> > @@ -201,7 +201,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
> >            * Suggest x2APIC mode by default, unless xAPIC registers are hardware
> >            * virtualized and x2APIC ones aren't.
> >            */
> > -        if ( !cpu_has_vmx_apic_reg_virt || cpu_has_vmx_virtualize_x2apic_mode )
> > +        if ( !has_assisted_xapic(d) || has_assisted_x2apic(d) )
> 
> So, not sure why this is separated from patch 1 but stated this way it seems
> counterintuitive. We only want to use the viridian MSRs if they are going to
> be more efficient.. which I think is only in the case where we have neither
> an x2apic not an assisted xapic (hence we would trap for MMIO).

I've read the MS HTLFS and I guess I got confused, the section about
this CPUID bit states:

"Bit 3: Recommend using MSRs for accessing APIC registers EOI, ICR and
TPR rather than their memory-mapped"

So I've (wrongly) understood that MSRs for accessing APIC registers
was meant to be a recommendation to use x2APIC mode in order to access
those registers.  Didn't realize Viridian had a way to expose certain
APIC registers using MSRs when the APIC is in xAPIC mode.

I withdraw patch 1 and adjust patch 2 accordingly then.

Thanks, Roger.

