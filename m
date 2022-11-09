Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A966230C3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 17:56:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441086.695364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osoMH-0005aV-5a; Wed, 09 Nov 2022 16:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441086.695364; Wed, 09 Nov 2022 16:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osoMH-0005XX-2I; Wed, 09 Nov 2022 16:55:25 +0000
Received: by outflank-mailman (input) for mailman id 441086;
 Wed, 09 Nov 2022 16:55:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opqx=3J=citrix.com=prvs=305fc5d8a=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osoMF-0005XR-Ei
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 16:55:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a5c8604-604f-11ed-8fd2-01056ac49cbb;
 Wed, 09 Nov 2022 17:55:20 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Nov 2022 11:55:12 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by SJ0PR03MB5710.namprd03.prod.outlook.com (2603:10b6:a03:2da::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 16:55:10 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 16:55:10 +0000
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
X-Inumbo-ID: 4a5c8604-604f-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668012920;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yR5paNWa+S9Aw2macB++WyQPB95hLTRGgA3wffIcHwk=;
  b=Fv1AKMXCIJAuk7wJrTzspdzXvUdqYdEKRlxQ1RKX9gFvhkqupvLafIPR
   /i0AamjhOepQV8qLoojOsQwIoU1M/kAslD//XVNYMVtvUvI33/jzksoYg
   E4flNr/ZnxbKQ6mHgTO/jhWdtqXpcbwUo9E9mh5UasgUqtbM4VRbCGY16
   A=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 87028958
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:e7HdzKq9V3eokdpFyPLKYE9E7HpeBmLbZBIvgKrLsJaIsI4StFCzt
 garIBmDaP6ON2HyfdFzYIq3pkhT75Hdx9UwHARvqHo2ESoS9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHzyhNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACFUc0qYosKN+6imYK5mv4MgduOxPapK7xmMzRmBZRonabbqZvyToPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYSFEjCJbZw9ckKwq
 27Y/mK/HhYAM9+3wjuZ6HO8wOTImEsXXapCS+Xipq830DV/wEQiKQEOBVqYnMWooXyeC88GA
 UMkxTQh+P1aGEuDC4OVsweDiF6JuAQNHeVZFeIS4RuIjKHT5m6xBHUATzNHQMwrsokxXzNC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt79D9rakpgxnIT9IlF7S65vXqHRngz
 jbMqzIx74j/luYO3qS/uFrB0zSlo8GQShZvv1uHGGW48gl+eYipIZSy7kTW5upBK4DfSUSdu
 H8DmI6V6+Vm4YyxqRFhid4lRNmBj8tp+hWF6bKzN/HNLwiQxkM=
IronPort-HdrOrdr: A9a23:5C2dOqBzWSSiC8rlHegPsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuKKdkrNhR4tKOzOW9FdATbsSp7cKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUaF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlml9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4gow3TX+0WVjbZaKvi/VQMO0aWSAZER4Z
 7xSiIbToZOArXqDyeISFXWqlDdOX0VmgLfIBej8AfeSIrCNXwH4oN69PxkWwqc5Ew6sN5m1q
 VXm2qfqppMFBvF2D/w/t7SSnhR5wOJSepLq59ts5Vza/poVFZql/1owGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlIhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OFDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowVLau3iefPFm8Kc7gSwlGl/NLAgF4vsul6RRq/n7WKfhNzGFRRQnj9agys9vcPHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.96,151,1665460800"; 
   d="scan'208";a="87028958"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKTlLx8q4w1b+mybl7U7t4qqBvv6LQkb9391w/OK28iZvasLz61bO8PAxlzNJcgDQ4B/C5OvUK2zzaNG8OJtE7N4SyO153tGH0njKclhA3F36Sr6e1kis/E8uoapfISAiVJKIM6aRm8i04bnJum0mrQyGls8E+bgqOWGJ1huzyqydJaG0FAjkzYYloJX39889BHfKMcSjrpS1m5gwaxL8VGRvN8qfOqJSyqPShcPgFIvs4XI42UKsGIbEX3KB2RBChthLMFkVagaTnH24QfHlgais/tvrDMK50YjTAGligZAycv2+c5WclSgsmct3mZ4uUE/FBpRmWKPtutdgsg3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yR5paNWa+S9Aw2macB++WyQPB95hLTRGgA3wffIcHwk=;
 b=jwF3A9HezemY1NShsgdSXCtST6C9iTcGINHq5s/7O6t2NUx/64zOM1dBfP/eLPiALClWVauELuztIKDFETtxl+uJxZbKgVm9SRXrnyVAc84yp0ujlpON8sFEvsyFI2Xe2kxbuyNhrLEnpzLag5m4eZJfTKK53zACuVa7dMWH+3qnDNdwzlo1XXMWLdZ5G8KrbEdx6+E29+qmZVqYNmokMyS4moKfWcauMEVnQfpJ6TkfTIx48CQK2x6IourAOCjcakm8eyT7yvq7oEQyfHQNh0nlemma51PCi4SxMVtCVg29nseM/6dkdBKBrpMRUqFBc+9gUn1WEarPpHglnKK2oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yR5paNWa+S9Aw2macB++WyQPB95hLTRGgA3wffIcHwk=;
 b=Hic5CUMJ7WC5kp2JKABNCh2Yb2sV6L2dhK7BTjKfIbBZxzfbbP/zHbObj+q0yphXePJ/6CY7TM4032QO5B5LjW0qNbuGvx1e/JeKSVuOc/DJaYUiAz6Zws4i1tiSMcHf+B8PeKK8qtsJ3IKDPxcbY1FAl8MFnwdVXhvUAoR6fjg=
From: Edwin Torok <edvin.torok@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Topic: [PATCH for-4.17 v3 07/15] CODING_STYLE(tools/ocaml): add 'make
 format' and remove tabs
Thread-Index: AQHY84fA+Ym2JRve3kKJcIO1APAKeK41MEgAgACx3ICAAML3gIAAI/qAgAAH3IA=
Date: Wed, 9 Nov 2022 16:55:10 +0000
Message-ID: <7A80AE7E-7D9C-491B-9109-ECA4C5C6B304@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <16f52592270e36670947fbcbe1e4d91f1daf9823.1667920496.git.edvin.torok@citrix.com>
 <4baa6580-a779-f1e4-b504-59895fa97309@xen.org>
 <AS8PR08MB79919C95C2B529B887D322CB923E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <0B9BA046-5FA5-42EC-9959-63F15B833E91@citrix.com>
 <8C257640-9021-4036-8E5F-A085D53CAA60@citrix.com>
In-Reply-To: <8C257640-9021-4036-8E5F-A085D53CAA60@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|SJ0PR03MB5710:EE_
x-ms-office365-filtering-correlation-id: 6711b545-7796-4039-6fc1-08dac27329de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 o6wWd2V5lS/Mr3YXptkHKE36X13hWhBsVFPgK59it1P3gBSMX0DeomAGVDqenQ2g0bKd4gtDhLBoOgh+E3ssixfRGIkbxpVb6p7Y/8/bTU9oaZ3LONzSmKHWXFsK1psCvgQj7yWSggS9hnVlnAQpEw1ZEyLzlnMNvJb/+NBXcAAN1LHsAp5do1lrJRbci8gK664MSWBNBhFuWNkqfekxDLG9ArSpRfOuAPwpRK/bTOLa79sHAhjOvXQiA+BqWNf/qvH0dNtxHEgOGFlgBcPMdb0gPx7bI3yYsTSTLU1nJ9G5EC7y4wU247bbVvnkVZXtPSGjP0KmW5m13uh0jGEzeMxuOU6c/gLP82wjN6PHRN7c2HXwYoFheiWlf+G+zc1roJok0nHnsXOAcAUqVhImXkniXjLlh9MTBFNOp6DtVUpX9vrxQvv7F99qPRv3xS/JP7eqgSLLzX/p0RpZGGjO2ba2QilhrFW2JWnYaUdyCgpTtwTkP+dWBQXkhtZniFb5KzqwGPQEYi7fordhv1cHKND6ZTi4y9mfDFvC9wjFglAPygQ4L8b2jHhsxlZGzK+Lhh7C8gaAhuFZmUPgXRf/kBtatio7FwhgiEXDtxtK5kUF0jFnp1iIs18fJTP+6EoQVuJhB+safuAYTxgRK9UojGhb9Z/N7iObubxQAal45eKoebFJ4pufaeev1miw9ZtBi2m8Ymqe68EIa4JzdvodMsczfMh1uiTODHbtXZmqgSsZ6YSYi5px024T44u0L5MtSRQGT9yYXKaOq8f5rurbiXwx1+uvtdPyJhlBHjvpWdNc3BOT8E9qh9pEcZlMUewu+ettGMU4jZnGmY4Frv4LOQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199015)(82960400001)(66446008)(64756008)(71200400001)(66476007)(478600001)(6486002)(38100700002)(966005)(76116006)(33656002)(66556008)(66946007)(91956017)(38070700005)(4326008)(41300700001)(6916009)(316002)(54906003)(8676002)(53546011)(86362001)(6506007)(6512007)(26005)(66574015)(186003)(83380400001)(2616005)(107886003)(122000001)(5660300002)(8936002)(36756003)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VmZ6RC9xWW5vNlJmSzdTR3N3SmFtVnlSM0xzU2tMRE5HOEk5THdpTyt0VWVN?=
 =?utf-8?B?SVF0WU1vaWo0SEtWRHB6VERYbXNXTjNTci9jcGh6UkpnaXZJOGtTd082LzFu?=
 =?utf-8?B?K2x3cmJwaDhjeS9TZDhTNGdLeVE2SUJPNGxZZ1R1dlNiMXVLS3Brb3BpWlBo?=
 =?utf-8?B?ME51dmRqTmtDOUVJN09GNWllVFVnczc4TXl6Q0l0N3FUOFNEMFowMmI5dCsw?=
 =?utf-8?B?Y2ZPRlNBdnBkbnNUNjMxdFUxdnV6S0hrc3F6ZHREb0N5ZlI1V0ZpWXkzVUNH?=
 =?utf-8?B?dzBJcThjVFdONGFIMUpLR1YwT1pvOTZNZ0RDQ29oc0ZCRE14cExrZHgzUmhu?=
 =?utf-8?B?eUJGMWxFNUVUU2JObjJuMmw0T0dBOUJkcnBIZEVyL3R1MGlDcnloTjBzaFZQ?=
 =?utf-8?B?OFBEZ3R0SU5mMjY3T2trSnhLTkhkK010aG1TRFV4UnA3NnlmdUJwNnVlb1ZQ?=
 =?utf-8?B?cENkbm5laUhNa05JTS9KeDVWRU8vZmEvQ05RR2JOMGdWWHpUSjV4N1dQOTlE?=
 =?utf-8?B?aW5jRjVhZEl2RFpQdTdNWWlvaldPcVBsd2FWSFdINEp0VzQvTzJGeDV2RGQ4?=
 =?utf-8?B?VjEvaVYzUE90RDBMbFpZTlk0aXJ3c1RpRVdWNXpiOVB6ZHlZN3NtVUoveW9m?=
 =?utf-8?B?cmhEWHFRR3hwbS9NV1NRdm9VK0pvWFR3Y3QrenpCQ1YwRit1RUEyaE4zd0Nx?=
 =?utf-8?B?c2UyWS9Kakw1WGZDTmttMWxQYS9UbEVRVll2c2R4R1JIYUVqUWRVYXRWTWx0?=
 =?utf-8?B?dHZzNHJoVERGTmxveDhsL3NJaHh3emc2dmJ4NTFWdUNXcFFRMVFIdjNIcnMv?=
 =?utf-8?B?UmIwLzFSM3RLV0JnWXZCUWozV0loTUZ3QzhNSG55dW1ZK0h3ZkV2NmV5T0hs?=
 =?utf-8?B?am0wZWhrRjh5UlhNMW1hVTlZWTIzNlYvd1ZQL3VmSHdWNkJKMGtJYzRjakY0?=
 =?utf-8?B?UlVoK29FV0NvQm0wcW5janBHMG44LzhZQzVNNXN6YjRJNjdISjFhRnovL2FZ?=
 =?utf-8?B?ekdjM0dJTmdNYVRmK1ZnUVlTY2w2QzhENWRWZkpKRnlnNkFnYnZtd2JDd080?=
 =?utf-8?B?SENSdkxURmNnUVhEaFlLbVJEMEIyZjZLZ3pMU2lQaFdrbG5TLy9LL1liWWFN?=
 =?utf-8?B?U1ZHTVA5NStXdTlSRkx5UVBFSXA3NDJQUFJjbWgxaU1nRUM0M3h4a2h5b0ow?=
 =?utf-8?B?bEZiWk14YTVtcXF5Q1IzV1ZGaGRYQkNaUHp6enpaVC9GbjhPTzV5Qjl1bTFv?=
 =?utf-8?B?V3k3K1YvN2t1aEc1OFcwdHVpdS81emtCL1JmYmRNRGZ6QjRpOVl6N3hmZzdC?=
 =?utf-8?B?amlTY2lJaUdFWFBNaEloVkR5eXYrVk1BaUljWHJBenYzSDd3RE4vU2dON1ZU?=
 =?utf-8?B?Ny9hbXJJVmVxcWhldGFrcFZjOTUvSzlnb3ovR09PN1RxbWN1NXNRWW9Ta2xU?=
 =?utf-8?B?bmZadlRnZGR1aE10Mmd0Sks3ME1NUVZsR0FQNmxKS3NqZWFjdU9TalNZSXYx?=
 =?utf-8?B?UFgxRDAxZ1ViMzBPRkY3SkV6ck9EUW5JeHpPdEVJVjdBRXVvSjF2azlvemt6?=
 =?utf-8?B?V1NUOWtEK1U1NEEyMnRrY2FZMk5XNkFleU53cGlFbkQyL1B6OThkeXZaaEY2?=
 =?utf-8?B?citOVjY1WHVoOFJjYlAvTExsY0NJa3l3L1ZtUG93Vk9OUC9OL2lFMEoxSTh5?=
 =?utf-8?B?Q2dVWHVVMGE4blVkMzJvZms3S1RuL2NkOUduNGtyNHNvTG1paVpFYW84WDh6?=
 =?utf-8?B?R0ViS1NuNjdSQk1GUERRQXNqNjd0b1h1MUZncjJwQ1U1OWw4SUpWNW9wOVhu?=
 =?utf-8?B?cDg2Nm12RXV5Z1I2bUhSSnhkdGt3dncwNFkrd3Axb0R0MEN1d2RCK2lUQWJk?=
 =?utf-8?B?WW9odzRlWHVtMUNNVzhteEJmNEc1NkJZaTlRalIvTEZrSS9TUFJiaVRlNHFD?=
 =?utf-8?B?aEg2UFpwVzlULzg1ZTJ5VWFRWWFtcEswK1hRczhBRjFqdmdlY2hLK0dScnhZ?=
 =?utf-8?B?SEZMMUdtTW5wTFdpTWNWNjBGZVFYWFZPL3hGaFB5UGlCekl0UWFvT1NxUTY2?=
 =?utf-8?B?cGNnQWJ0ZEtoYXo0SEZlOU1GeWdsMWwxZUkyQ3FGcmhnOExGZzB5R0tjYmFh?=
 =?utf-8?B?a3FjbWJNWXUwVWJSYTlNcmpjRzlCaXJrOXJBRTh5dXFQNUZtZ0E1ZzZ4N0tS?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <234E444792D9B84B9264D6B0627EC065@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6711b545-7796-4039-6fc1-08dac27329de
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 16:55:10.5505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YcXtCAELjwEbzCKAEh3FpT0ht+F/coiV6M58v4Zy5U3HFk43YlLHrNHR4YDjWzb2kAM9CkBebVGC1kEaegAiHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5710

DQoNCj4gT24gOSBOb3YgMjAyMiwgYXQgMTY6MjYsIEVkd2luIFTDtnLDtmsgPGVkdmluLnRvcm9r
QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gOSBOb3YgMjAyMiwgYXQgMTQ6
MTgsIEVkd2luIFRvcm9rIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPiB3cm90ZToNCj4+IA0KPj4g
DQo+PiANCj4+PiBPbiA5IE5vdiAyMDIyLCBhdCAwMjo0MCwgSGVucnkgV2FuZyA8SGVucnkuV2Fu
Z0Bhcm0uY29tPiB3cm90ZToNCj4+PiANCj4+PiBIaSBKdWxpZW4sDQo+Pj4gDQo+Pj4+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+Pj4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+DQo+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggZm9yLTQuMTcgdjMgMDcvMTVdIENPRElO
R19TVFlMRSh0b29scy9vY2FtbCk6IGFkZA0KPj4+PiAnbWFrZSBmb3JtYXQnIGFuZCByZW1vdmUg
dGFicw0KPj4+PiBXaGlsZSBJIHVuZGVyc3RhbmQgdGhlIGdvYWwgYW5kIHN1cHBvcnQsIHRoaXMg
c2VlbXMgdG8gYmUgYSBiaXQgdG9vIGxhdGUNCj4+Pj4gdG8gZG8gaXQgaW4gWGVuIDQuMTcgKHdl
IGFyZSBvbmx5IGEgY291cGxlIG9mIHdlZWtzIGF3YXkpLiBBdCB0aGlzIHN0YWdlDQo+Pj4+IG9m
IHRoZSByZWxlYXNlIHdlIHNob3VsZCBvbmx5IGRvIGJ1ZyBmaXguDQo+Pj4+IA0KPj4+PiBUaGlz
IGlzIGNsZWFybHkgb25seSBhIGNvbWVzbWV0aWMgY2hhbmdlIGFuZCB0aGVyZSBJIHdvdWxkIGFy
Z3VlIHRoaXMNCj4+Pj4gc2hvdWxkIGJlIGRlZmVycmVkIHRvIDQuMTguIFRoYXQgc2FpZCB0aGUg
bGFzdCBjYWxsIGlzIGZyb20gdGhlIFJNLg0KPj4+IA0KPj4+IEkgYWdyZWUgd2l0aCB5b3VyIHBv
aW50LiBJIHRoaW5rIG1heWJlIGRlZmVyIHRoZSBwYXRjaCB0byA0LjE4IGlzIGJldHRlciwNCj4+
PiBnaXZlbiB0aGUgZGVlcCBmcmVlemUgc3RhdGUgd2UgYXJlIGN1cnJlbnRseSBpbi4NCj4+IA0K
Pj4gDQo+PiBJbmRlbnRhdGlvbiBjYW4ndCByZWFsbHkgYmUgdHJ1c3RlZCB0byBodW1hbnMgOikN
Cj4+IA0KPiANCj4gDQo+IEl0IG1pZ2h0IGJlIGJldHRlciB0byBjb25zaWRlciBveGVuc3RvcmVk
IHVuc3VwcG9ydGVkIGluIDQuMTcgYXQgdGhpcyBwb2ludCBhbmQgdHJ5IGFnYWluIGZvciA0LjE3
LjEgb3IgNC4xOA0KDQpBaCBJIHNlZSB0aGF0ICdMaXZlIFVwZGF0ZScgZm9yIG94ZW5zdG9yZWQg
aXMgYWxyZWFkeSBtYXJrZWQgYXMgJ25vdCBmdW5jdGlvbmFsJyAoSSBpbmRlZWQgcmVtZW1iZXIg
c2VlaW5nIGEgcGF0Y2ggdG8gdGhhdCBlZmZlY3QpLA0Kc28gbG9va3MgbGlrZSBub3RoaW5nIGVs
c2UgbmVlZHMgdG8gYmUgZG9uZSBoZXJlIGZvciA0LjE3Lg0KaHR0cHM6Ly94ZW5iaXRzLnhlbi5v
cmcvZG9jcy91bnN0YWJsZS9zdXBwb3J0LW1hdHJpeC5odG1sDQoNCkkgY2FuIHRyeSBmaXhpbmcg
dGhhdCB1cCBmb3IgbWFzdGVyLCA0LjE3LjEgb3IgNC4xOCwgd2hlbmV2ZXIgdGhhdCBvcGVucy4N
Cg0KQmVzdCByZWdhcmRzLA0KLS1FZHdpbg0KDQo=

