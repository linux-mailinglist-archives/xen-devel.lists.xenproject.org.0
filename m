Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B65766D08D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 21:53:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478989.742547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHWTc-0002eV-5d; Mon, 16 Jan 2023 20:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478989.742547; Mon, 16 Jan 2023 20:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHWTc-0002cO-2O; Mon, 16 Jan 2023 20:53:08 +0000
Received: by outflank-mailman (input) for mailman id 478989;
 Mon, 16 Jan 2023 20:53:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbzH=5N=citrix.com=prvs=37389537a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHWTa-0002cI-7N
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 20:53:06 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c47dae32-95df-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 21:53:04 +0100 (CET)
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jan 2023 15:53:01 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6329.namprd03.prod.outlook.com (2603:10b6:303:11c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 20:52:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.019; Mon, 16 Jan 2023
 20:52:59 +0000
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
X-Inumbo-ID: c47dae32-95df-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673902384;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=iDL1zluBrBcTcbxS6RUN8p9kDjFJHfxxR9EVb4tVrEk=;
  b=W/g9yBkUQho/t057gBjuVG6VInPnQqfixvZ2U/kjyhvTu+8N2WUYtZ2G
   rXjahUb4YtqrHUY5cMWDzG7OSJw457tG9ioh9Uh7thI363gJMohXGbJ4t
   vGKX3cFf40LgpUQLuUDMOZ1fC+PXvMcrWnDcnQdzTPRRGSVDB4M8R8HIE
   M=;
X-IronPort-RemoteIP: 104.47.55.102
X-IronPort-MID: 93298023
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/zuYE6Pp9mEBqqbvrR0llsFynXyQoLVcMsEvi/4bfWQNrUomgTNRy
 jAfWT+GP6uDYmf1eYgkYIy+/EwDuZeAzoBlGwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5wJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0r8rPl1u1
 9E+ERkqXxOvgefq/pOLZfY506zPLOGzVG8ekldJ6GiBSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujCJpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eexnmqCNpIT9VU8NZUoUOQz34SUCRVdneK8dKcjnKlVuNAf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIVqf67OVoDWaKSUTa2gYakcscwwB5NXypZApuTjGRN1jDa2dg8X8HHf7x
 DXihCIznakJhMgHkaCy50nagimEr4LMCAUy423/Tm+jqw90eoOhT4ip8kTAq+ZNKp6DSVuMt
 2RCnNKRhN3iFrmInS2JBeASRreg4q/dNCWG2AY1WZ486z6q5nivO5hK5y1zL1toNcBCfiL1Z
 EjUukVa45o70GaWUJKbqrmZU6wCpZUM3/y8PhwIRrKiuqRMSTI=
IronPort-HdrOrdr: A9a23:ZWfzXqP28Hq/P8BcTs+jsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICOIqTNSftWfdyQ6VBbAnwYz+wyDxXw3Sn9QtsZ
 uIqpIOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.97,221,1669093200"; 
   d="scan'208";a="93298023"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9spva7YyCwqYmB5pRtVYLj4B00KTjrGhUP8b0t2vlZdnsogbSTSehMsaKZsXxV3j4aI3+7HtuGe9JZy0NgZsus8I1ao2Q5fg8JhsUk8Es3U9E5iFgaGaj3wylWCDXAaNAWeNZjnsPgsOGMXmuWc0/WBoqJn7Ol6brRYz6DB7I5kgDv8RpIsEo13LyFELJIEZHGzBKtrv7zuC1CtLSyqeNhUIbrDKPRJINlihWpS6kdVvCdrsGArgim6t/tlqd2ZR+l3QYpNJzmcsbOHdafEKJCPgwP5noQlI8yCZAeUiOdMdF4RyirnPQEkl9TB+AoPsmeLfg77cmJYYhndUq9Faw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDL1zluBrBcTcbxS6RUN8p9kDjFJHfxxR9EVb4tVrEk=;
 b=NZvH+qXxOp1hl8rVwYAKwh2U9cr19Utiev+zyGbeuTLPYMXYW2vYgFFaVyKr90wTWycymmv4/ugQhFMOFSmb8MuDAawZ4Cllabha3iQ67u6VzsoXjmzdJuFIa2PJDqZmc19LJWz4blm1Z1yWH12GUP/i+e2hmwoItdbaf+psacApiHOsk1BV814wxccQTDT7LejsL+gwh6uGQDIhPpuNhyHawwfRqYH/NT00fNhvKvHvO68IkJbmCdB9zFdDAzQEyrZIQkKfoNn5CLOGUt9YsWaQBFbWTgY+QRBIN8crMzBaWysmQBdl/8OZ7k7RV5FizGjgOfB6mbPMpwjKP4gnmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDL1zluBrBcTcbxS6RUN8p9kDjFJHfxxR9EVb4tVrEk=;
 b=EjdkPe+4mFFHwXOR4BGpQ3CSOVdAh444eLlKxt3HLOXHwc0t4Qw10a3DGinUr9ESCPUwuhF4xJGBQpYyU5Gur/Xo9pECq1BzjZTPpzREiJgpUgsjrxANaXB/ES7/NbiUv44NKkEixTxk8q0mKRQShu7f9XJ6p0/XwP1abnC4i8Q=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/5] xen/version: Calculate xen_capabilities_info once
 at boot
Thread-Topic: [PATCH v2 2/5] xen/version: Calculate xen_capabilities_info once
 at boot
Thread-Index: AQHZJ6P9a3SW6Dw/uUGcS4ObfuDLQK6hNfQAgABTzIA=
Date: Mon, 16 Jan 2023 20:52:59 +0000
Message-ID: <164e5248-948e-9467-5b34-1510d32f8d82@citrix.com>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
 <20230113230835.29356-3-andrew.cooper3@citrix.com>
 <9ff94f87-e3fa-c397-ebf0-b4849cba757d@suse.com>
In-Reply-To: <9ff94f87-e3fa-c397-ebf0-b4849cba757d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW4PR03MB6329:EE_
x-ms-office365-filtering-correlation-id: 7feead8a-bdec-45aa-feab-08daf803a6e8
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /W3lLB5/47P6fVfSlFJW3qJFuX3dQ0EMhPVSRXaA2gBK+KNJRYN0QitpbKWQGLRlPJJ6ccnb8+lNr9Og/ymJf2SFX5MVHLfr+sfujJrdlAIGUFkjGbcIxMiPRMPEHeilxvj4CuCwwe/4SOHmfHKOoR96WVlZOAfgZGfs8zugVH/oqVkAYflCCdTSE961bfo2GOISX+ImpQjMzKMxZntGOqWwkr+4hsjCMaADZRoZbqbHfAKpoNVUPJt85Q9VukT3fIVNVT/AfIFr0Oh2spq9XRX5/QcIbY5B0C77WXTL2ZxfszEIm2Ipq/17Z2KbuLCl+u6B90HDj97TNR7Kw7mvNSjplpov9gO6MolMSjHksRgfdAtm+DKsD02mH+deahWqrJgdb84mIMfy8a5LJ74PI1EDtItqpWyuMUuzAvS8HgR4RJSt6wo2hBIY00Eedky95u6dzG8AGEokSPxOYPc58/ebsbfnQv3cwj2lhqv4iojX7No3Dsl1H+fryVVBFkTT4te6aiFq+Lm5T9G0JFdttfxl5a+ob+AU3vJnwTtEIYikzDl3KrvfmxbCV/EU5mwV+fZhtJAhM7V36tNgAUp9ZbNeloUO4MI54gbAYsFfavo9XZ5UoUOIlIr5roUGCQlHYyLTOa3E54WmogHc/5Qf/reLSs9aBNDyvUXHjyVPtB4aURsEzyf6gt4FnmKNXZJ0VtevNof9X+B/lajZVRMGRnwk1jjBYkxI4a/kLlFHRUqBZguIC27CzLHoiA6AY+75bnJjFv48+MvT/3WqDOg1ng==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199015)(38100700002)(82960400001)(38070700005)(36756003)(86362001)(31696002)(6486002)(66556008)(66446008)(66946007)(4326008)(26005)(6916009)(66476007)(64756008)(8676002)(186003)(91956017)(2616005)(6512007)(478600001)(31686004)(76116006)(54906003)(71200400001)(53546011)(122000001)(316002)(8936002)(41300700001)(6506007)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Uk9sblpRelF6di9qZmxURURiTEc5T3Rob0h1TDNxNEVMNWppMXBDVjU5cndF?=
 =?utf-8?B?aVVMWGVOZXN1ZE51Zm9ZaFp5Mkhlbmt0VUZBNzViTUlHMDJwcjR1d2RnUE9x?=
 =?utf-8?B?UXpCc29TYzdqbmNuRjRPUVJVOWFZWHduOUUyTG9EaHdPd0dBSHBnTWIveVl5?=
 =?utf-8?B?NWhyZHR3RXZodTY0MWE3UEFUaVVqcVplckdLek4vRThRVkJGUDN4UjZhV21s?=
 =?utf-8?B?R1ZEdUJLTGRTV1hNcm9XSmlDZi93alJYR3Fsano2L0lNQ05sZ0srZU1SaWh0?=
 =?utf-8?B?MjB2SEJKeTBhazlJWVJBU0R3U2kwOVRZanRxR1dobElOQVdMMFU2c0pmcko4?=
 =?utf-8?B?cEV3NEV5eGQ5emdGZEVPRlYrMEt2dVlsMWxaci92MGRyeU5LRFl0Vjh0YmhF?=
 =?utf-8?B?cmMvMjFRT0lWb2FLbEY3NkhLazVPZWNVWVV6azdnd1oxUlN3Si9QbzgraVRk?=
 =?utf-8?B?alNkSnlzUXRYeGRseVE5QjRRNFVpNHdUQXlsUy9SNVoxUDJyclFWWDlhR1E1?=
 =?utf-8?B?U0NCNXVXVmpCWlJzZkRRL3lZRlBUTHJaRkRzQU9CajFVdGF5dWJVTDQyY3RP?=
 =?utf-8?B?Vk0zS0tOOHViY045ais1OG1kQ3p1cmZmcUNTcU5ldDBuS2ZIZXR6Wk00emlT?=
 =?utf-8?B?VldMc2oxZittbHVoQ3ladUh6cDdzMk56cWovcUdDMXlpOHZPNFByS21xeThR?=
 =?utf-8?B?a1RQNXNsQVhtdmJkL3FFSDNWb1VJb2dEclAwNnM3MWtvd2h2Zm1zQnlodXRy?=
 =?utf-8?B?SzJpWVdwais1dXBTbzhydEROcVNGTnNWMlFCaVdLaXhiejcydDRrOFQwTWky?=
 =?utf-8?B?eElhVVlkZEVwcU14QnBIdk9aS2QrSlpManlYWWhHenM2amo1VHJqdHdXSjZo?=
 =?utf-8?B?L1ppK083SXA3aFJDczhTYXJpMlV6OVpURmFkcFlmRXIxMnlBbHBQdTJOcXlx?=
 =?utf-8?B?K3NQaWtJVCtobUsrd2o1VEFHL1d5MnNqQmw4TDZ0SDhlczVZRk45TUJxc3Bt?=
 =?utf-8?B?SUxGb05nMmhDL0N3NklIaGJuMEVNaThJWkJGai9wQTR1djlCYzBuWUt6UG9j?=
 =?utf-8?B?MTNQZ2ZUSE1LNlJzKzIzY1J0TlJ0ZE5FeE5uUldqUUVncFRXdEgwV1M4OUtE?=
 =?utf-8?B?VDZCK0RXM0lxSnlEZG1KSWErNVBmSXdYenZPQlNtTmtubTBaNUdjL0UybmF2?=
 =?utf-8?B?djFNSFU5aHJDSlVwWkYwUmpqV2VITEhxRjl2YmFteG5raE9MQ1VCM3liUjdn?=
 =?utf-8?B?eUwvdEN6bEMrNlNXc1NsNS9aMk9QTEg4N0NacElMbXJwTzVXL0NHa2FBSGhQ?=
 =?utf-8?B?UGlZSktBSnpQbHBVU1BSZXFxd0UrYlhrN3RKSWtYNUtYR2p4OUZtdVg1dmpt?=
 =?utf-8?B?c3pqd0pnclRBSmZhNUVLN1VSd0IwcFNPS3JkTy9DYTZ6VGFtWmIyRktmTHJL?=
 =?utf-8?B?NUxBbmoyMzR1ekhEdHFMbE5vRmNlTEIwWTVGeURwS0tRVGhPTm1YdnBwV3Fi?=
 =?utf-8?B?N3kxT0xxb2NNVjhKZVN4VllJS0ZTVVZqdElFSHJMQUNkVTRCMThzZElMZEY3?=
 =?utf-8?B?RVYxN0J4TFFZeTJFU0JwUzduR2N3Mmp4MzdEeVUyK0RUS2FtL0RCZk55UEdC?=
 =?utf-8?B?ZER5YXBaWnREbmg2ZjBJU3BVbzVINDNKcjNTYnoyQUJxRkYxSWNBODYxOEhr?=
 =?utf-8?B?eDE4aXdHWG96eXE3WUJmdS93UzMxZkhCVmdqS3QwTmdycWFCanh0OHF5TVhZ?=
 =?utf-8?B?ZjZlL1ROSFYvWnhjckFic3BTUmlUa1cyZSthR1BFTTI5T0d0MDhReWdLei9B?=
 =?utf-8?B?Q3EvOU1jcVkxU0dCOERJR2pHbWdmU28vbEtEcDFPZmZ0SlVvOUU5NCtnM0gz?=
 =?utf-8?B?OG1IM1BtdjJUNXczUnppWHlpUEFWS3EwV0tkaDgxK01SN1NEQUJUMjZQV2lx?=
 =?utf-8?B?ZjVRdE9kb2t0dDlsejdtME84aFpxWjJ4alhXU3owbm5QWUJLaHFJNEtSL2ZY?=
 =?utf-8?B?MnE5aXNxVFRpR1BGTitHbmIwdWUvcWZKdUpIclNBUVhhUm1LeVpPeEJtc1px?=
 =?utf-8?B?ZkFpQ2R4U1k1aXp0RDJhQUR5bW9vSitrck9Pc0l4VUVjcGxkdm5QMHNTVVU2?=
 =?utf-8?Q?c+uGkaCRqn1we5+mbkt1p+rUH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08BB3628E9C64546B77C5229F22C2C98@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9fFGr2zew/9yAPEbPtOhX22xndc2epBXgJS5CuCrYZoKTB0vm1+gNi+Pmp7c5HjxlrWU439HTvby8qmULya219s1XR8M8mPPyhEk/bcsH+o9wwaHSamwNKXG07JnxLGO4MCaclg89fsVMY0ed5IxhrIE2tYc24nV8VxxyY7qmBpLwDXNL82hRjNiyIjecs7FFlke4nOEUCuOvlGvrDaUUIkKBNInieu6YrHX0mPdZe5cbCJBytNVtvSntFeXQCwB+IT/ZJUY6uUgjy5AVmsLdV99CZmuyfDyGv3856u6saGnymgwDmCzgoAUUfgTdrdDurbPqzD0c6iQHGAHzM+dQptB5ypzfjR2E/FT/MrPjo0XkEZnkoz4AJ9FvRrFNwYBVADxxVdxkZhNEjF6q46pJ2PEErPCpPKjsfDBSnDVO3XNKRJpC3ob1h9hiTSYP4SOjk9O9fAAwkPLaStEP95KyI9MTMPfgtOJ4QHrzgUsFPOq+jlGHVCER0TNwrU02rdtNkOpd8aOIG7KSaJkBGBIPx8itP9Lz4VYQXhCIW0dj9uqifsW3lnXXr27Edn7aelZY81/qAMYnBUdk9xMn3mh/yWcstS52qE8wLHuAwoKORQdXBxfszSPFXIrscN4jQbSjr73l/OS9pnD+2fsSPjxoRvOo5V9Miv13Fgdoc7Pclm5j3nJeHbrJpuWq4hxWfWP6bIwRya2JDraiLjdI7QGESVVBuc8X7fOd7HWGxHoxAP8D7O2888KK7R0+oxM0ZU1KlP2r2AfTZsWDCZn3rIB3bsfpX9wzSWLbTSKxZAE7lhRXlkMclAw7M4vVrdqqPs0NS1kX+h5ghdcHOr+UAOCr8yFr6gKlJWEJUqri++BGFOHUJCPLd92ROJvwKGC8YGUjmsR9/xocuJk+APv2nKX3A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7feead8a-bdec-45aa-feab-08daf803a6e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 20:52:59.4911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JLznpn+l3rSnFIkvktoZPfHiMYfPbqlg4Nl9MIDG+F3oRueTr6dH6WYdXPc+jHp7j69+ShUu+tRDu/Qwxp/jyUIv6ymfOAB7DLpc+ghZP0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6329

T24gMTYvMDEvMjAyMyAzOjUzIHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTQuMDEuMjAy
MyAwMDowOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IFRoZSBhcmNoX2dldF94ZW5fY2Fwcygp
IGluZnJhc3RydWN0dXJlIGlzIGhvcnJpYmx5IGluZWZmaWNpZW50LCBmb3Igc29tZXRoaW5nDQo+
PiB0aGF0IGlzIGNvbnN0YW50IGFmdGVyIGZlYXR1cmVzIGhhdmUgYmVlbiByZXNvbHZlZCBvbiBi
b290Lg0KPj4NCj4+IEV2ZXJ5IGluc3RhbmNlIHVzZWQgc25wcmludGYoKSB0byBmb3JtYXQgY29u
c3RhbnRzIGludG8gYSBzdHJpbmcgKHdoaWNoIGdldHMNCj4+IHNob3J0ZXIgd2hlbiAlZCBnZXRz
IHJlc29sdmVkISksIHdoaWNoIGdldHMgZG91YmxlIGJ1ZmZlcmVkIG9uIHRoZSBzdGFjay4NCj4+
DQo+PiBTd2l0Y2ggdG8gdXNpbmcgc3RyaW5nIGxpdGVyYWxzIHdpdGggdGhlICIzLjAiIGluc2Vy
dGVkIC0gdGhlc2UgbnVtYmVycw0KPj4gaGF2ZW4ndCBjaGFuZ2VkIGluIDE4IHllYXJzIChUaGUg
WGVuIDMuMCByZWxlYXNlIHdhcyBEZWMgNXRoIDIwMDUpLg0KPj4NCj4+IFVzZSBpbml0Y2FsbHMg
dG8gZm9ybWF0IHRoZSBkYXRhIGludG8geGVuX2NhcF9pbmZvLCB3aGljaCBpcyBkZWxpYmVyYXRl
bHkgbm90DQo+PiBvZiB0eXBlIHhlbl9jYXBhYmlsaXRpZXNfaW5mb190IGJlY2F1c2UgYSAxayBh
cnJheSBpcyBhIHNpbGx5IG92ZXJoZWFkIGZvcg0KPj4gc3RvcmluZyBhIG1heGltdW0gb2YgNzcg
Y2hhcnMgKHRoZSB4ODYgdmVyc2lvbikgYW5kIGlzbid0IGxpYWJsZSB0byBuZWVkIGFueQ0KPj4g
bW9yZSBzcGFjZSBpbiB0aGUgZm9yc2VlYWJsZSBmdXR1cmUuDQo+IFNvIEkgd2FzIHdvbmRlcmlu
ZyBpZiBvbmNlIHdlIGFycml2ZWQgYXQgdGhlIG5ldyBBQkkgKGFuZCBoZW5jZSB0aGUgMy4wIG9u
ZQ0KPiBpcyBwcm9wZXJseSBsZWdhY3kpIHdlIHNob3VsZG4ndCBkZWNsYXJlIFhlbiA1LjAgYW5k
IHRoZW4gYWxzbyBtYXJrIHRoZSBuZXcNCj4gQUJJJ3MgYXZhaWxhYmlsaXR5IGhlcmUgYnkgYSBz
dHJpbmcgaW5jbHVkaW5nICI1LjAiIHdoZXJlIGF0IHByZXNlbnQgd2UNCj4gZXhwb3NlIChvbmx5
KSAiMy4wIi4NCg0KInRoZSBuZXcgQUJJIiBpcyBpcyBzdGlsbCB0d28gdGhpbmdzLg0KDQpUaGUg
b25lIHBhcnQgaXMgY2hhbmdlcyB0byB0aGUgaW4tZ3Vlc3QgQUJJIHdoaWNoIGRvZXMgbWFrZSBp
dCBHUEEgYmFzZWQNCihmb3IgSFZNKSwgYnV0IHRoaXMgZG9lcyBuZWVkIHRvIGJlIGJyb2FkbHkg
YmFja3dhcmRzIGNvbXBhdGlibGUuwqAgVGhpcw0KQUJJIHN0cmluZyBsaXZlcyBpbiB0aGUgUFYg
Z3Vlc3QgZWxmbm90ZXMgKGFuZCBpcyB1bHRpbWF0ZWx5IHRoZSB0aGluZw0KdGhhdCBkaXN0aW5n
dWlzaGVzIFBWMzJwYWUgdnMgUFY2NCksIGJ1dCBub3doZXJlIGludGVyZXN0aW5nIGZvciBIVk0N
Cmd1ZXN0cyBhcyBmYXIgYXMgSSBjYW4gc2VlIChmdXJ0aGVybW9yZSwgdGhlIDMgdmFyaWF0aW9u
cyBvZiBodm0tMy4wLQ0KYXJlIGJvZ3VzLg0KDQp4ZW4tMy4wLXg4Nl82NGxhNTcgd291bGQgcHJv
YmFibHkgYmUgdGhlIGxlYXN0IGludmFzaXZlIHdheSB0byBleHRlbmQgUFYNCnN1cHBvcnQgdG8g
NS1sZXZlbCBwYWdpbmcuDQoNClRoZSBvdGhlciBwYXJ0IGlzIGEgc3RhYmxlIHRvb2xzIEFQSS9B
QkkuwqAgVGhpcyBjYW4gaGF2ZSBhbnkga2luZCBvZg0KaW50ZXJmYWNlIHdlIGNob29zZSwgYW5k
IGZyYW5rbHkgdGhlcmUgYXJlIGJldHRlciBpbnRlcmZhY2VzIHRoYW4gdGhpcw0Kc3RyaW5nbHkg
dHlwZWQgb25lLg0KDQoNCiJ4ZW4tMy4wIiBpcyBldmVuIGhhcmRjb2RlZCBpbiBsaWJlbGYuwqAg
SSBjYW4ndCBmb3Jlc2VlIGEgZ29vZCByZWFzb24gdG8NCmJ1bXAgMyAtPiA1IGFuZCBicmVhayBh
bGwgY3VycmVudCBQViBndWVzdHMuDQoNCj4+IElmIFhlbiBoYWQgc3RybmNweSgpLCB0aGVuIHRo
ZSBodW5rIGluIGRvX3hlbl92ZXJzaW9uKCkgY291bGQgcmVhZDoNCj4+DQo+PiAgIGlmICggZGVu
eSApDQo+PiAgICAgIG1lbXNldChpbmZvLCAwLCBzaXplb2YoaW5mbykpOw0KPj4gICBlbHNlDQo+
PiAgICAgIHN0cm5jcHkoaW5mbywgeGVuX2NhcF9pbmZvLCBzaXplb2YoaW5mbykpOw0KPj4NCj4+
IHRvIGF2b2lkIGRvdWJsZSBwcm9jZXNzaW5nIHRoZSBzdGFydCBvZiB0aGUgYnVmZmVyLCBidXQg
Z2l2ZW4gdGhlIEFCSSAobXVzdA0KPj4gd3JpdGUgMWsgY2hhcnMgaW50byB0aGUgZ3Vlc3QpLCBJ
IGNhbm5vdCBzZWUgYW55IHdheSBvZiB0YWtpbmcgaW5mbyBvZmYgdGhlDQo+PiBzdGFjayB3aXRo
b3V0IHNvbWUga2luZCBvZiBzdHJuY3B5X3RvX2d1ZXN0KCkgQVBJLg0KPiBIb3cgYWJvdXQgdXNp
bmcgY2xlYXJfZ3Vlc3QoKSBmb3IgdGhlIDFrIHJhbmdlLCB0aGVuIGNvcHlfdG9fZ3Vlc3QoKSBm
b3INCj4gbWVyZWx5IHRoZSBzdHJpbmc/IFBsdXMgLSBhcmUgd2UgZXZlbiByZXF1aXJlZCB0byBj
bGVhciB0aGUgYnVmZmVyIHBhc3QNCj4gdGhlIG51bCB0ZXJtaW5hdG9yPw0KDQpXZWxsLCB3ZSBo
YXZlIHByZXZpb3VzbHkgYWx3YXlzIGNvcGllZCAxayBieXRlcy7CoCBCdXQgdGhpcyBpcyBhbHdh
eXMNCmJlZW4gYSBOVUwgdGVybWluYXRlZCBBUEkgb2YgYSBzdHJpbmcgcGVyc3Vhc2lvbiwgc28g
SSBmaW5kIGl0IGhhcmQgdG8NCmJlbGlldmUgdGhhdCBhbnkgY2FsbGVyIGNhcmVzIGJleW9uZCB0
aGUgTlVMLg0KDQpCZWNhdXNlIG9mIHNhZmVfc3RyY3B5KCksIHhlbl9jYXBfaW5mbyBpcyBndWFy
YW50ZWVkIHRvIGJlIE5VTA0KdGVybWluYXRlZCwgc28gaWYgd2UgZG9uJ3QgY2FyZSBhYm91dCBw
YWRkaW5nIHRoZSBidWZmZXIgd2l0aCBleHRyYQ0KemVyb2VzLCB3ZSBkb24ndCBldmVuIG5lZWQg
dGhlIGNsZWFyX2d1ZXN0KCkuDQoNCkFsc28sIHNpbWlsYXIgcmVhc29uaW5nIHdvdWxkIGFwcGx5
IHRvIFhFTlZFUl9jbWRsaW5lIHdoaWNoIGlzIHR5cGljYWxseQ0KcmF0aGVyIGxlc3MgdGhhbiAx
ayBpbiBsZW5ndGggKGF0IGxlYXN0IGl0J3Mgbm90IG9uIHRoZSBzdGFjaywgYnV0IGl0IGlzDQpz
dGlsbCBhbiBleGNlc3NpdmUgY29weSkuDQoNCn5BbmRyZXcNCg==

