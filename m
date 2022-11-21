Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8278363269F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 15:46:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446669.702381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox83c-0007g4-FG; Mon, 21 Nov 2022 14:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446669.702381; Mon, 21 Nov 2022 14:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox83c-0007dF-CM; Mon, 21 Nov 2022 14:46:00 +0000
Received: by outflank-mailman (input) for mailman id 446669;
 Mon, 21 Nov 2022 14:45:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5PF=3V=citrix.com=prvs=31798088b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ox83a-0007cM-MO
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 14:45:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 343357c0-69ab-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 15:45:57 +0100 (CET)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Nov 2022 09:45:54 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by PH0PR03MB6464.namprd03.prod.outlook.com (2603:10b6:510:bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 21 Nov
 2022 14:45:52 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e%4]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 14:45:52 +0000
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
X-Inumbo-ID: 343357c0-69ab-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669041956;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hp9P61fgn1RuHvIj1Cz0V1fKbLBHYOGLcBRppAK30rY=;
  b=JrGIEOxMfxRbaoWIA+w65ZO28fdbhK6VQqxXmA6APfCrf0gy1xRGQQm6
   OcHiikKKjvuOUC5nLzYEMHWXlXX4qPL0mZ2Hpo9SbDoXVEhPZEz69Iali
   DluTE9876IdFE/ztdA8kHwGzK8rT43mfLqbH/h8Qje7omLMHLDAOZ1zzr
   8=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 85253912
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vzXvw65rhkHQq4GHP5x1zAxRtBrGchMFZxGqfqrLsTDasY5as4F+v
 mRLXD3VMqvZZWb1Lo91YYrjp0oC65CDm9dmTQA/rCEzHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkR5QeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m2
 /BBExInTCG6vt2Z0JKrWLRP28URFZy+VG8fkikIITDxK98DGMmGaIKToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Okkooj+WF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNJPTuDjp6cw6LGV7jE9DDswRVSrnd6e1X75C5VAD
 2sp5RN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgc/iTQsSAIE55zop9g1hxeWF9J7Svfq05vyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLzsZ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:QgsC06rAd5BM3/Rkkw9yblgaV5sDLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcItKLzOWwldAS7sSobcKogeQUREWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZa6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyR+49bLgFBCc/xEGFxdC260r/2
 TpmxHwovzLiYD79jbsk0voq7hGktrozdVOQOSKl8guMz3pziq4eYh7XLWGnTYt5MWi8kwjnt
 Xgqwope+5z93TSVGeopgaF4Xiv7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twriGknqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYdU99WPBmcUa+d
 tVfYbhDcVtABWnhrfizzBSKemXLzAO99G9MxA/U4KuomNrdTtCvjYlLYQk7ws9HdQGOtl5Dq
 3/Q9pVfPsldL5oUYttQOgGWse5EWrLXFbFN3+TO03uEOUdN2vKsIOf2sR92AiGQu1+8HIJou
 W2bHpI8WopP07+A8yH25NGthjLXWWmRDzojsVT/YJwtLHwTKfidXTrciFkr+Kw5/EERsHLUf
 e6P5xbR/flMGv1AI5MmwnzQYNbJ3USWNAc/tw7R1WNqMTWLZCCjJ2STN/DYL72VTo0UGL2BX
 UOGDD1OcVb90iuHmT1hRDAMkmdDnAXPagAZZQy09Jju7TlbLc8wzT9oW7Jlv2jOHlFrrE8el
 d4Lffujr67zFPGj1r10w==
X-IronPort-AV: E=Sophos;i="5.96,181,1665460800"; 
   d="scan'208";a="85253912"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUcspBl0LERqARwtM4FvS2vOaV5HjBCVBkcDXR0J9Yc8u0memeR8YJzqIB3bgpaNWDyLr7b9ewwZyBtAinXR/z0PS4SgBTLI8gil4LSu6zpTtN04Zgq5VpAcFgVbPWnkDv39fIeGzj88lFTx7AIghTso0kDMY5Y4V4nlkEd+1Gyfi/hAXe/zf3MDFSkanVqATnMXsTx1tC0WGO5ChmBcTI3ebnq/zHyyoZcVFz9j8qh5WaHMNEuhmgqlJ71TfjBk0ROGftOLjLPXdj3uq9mBALYhM3i5ha3klsXXDeM6Gf3o7NQxB9SFClubAnBTmI+zxUXi3JmDmjtilkhOqqbjAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hp9P61fgn1RuHvIj1Cz0V1fKbLBHYOGLcBRppAK30rY=;
 b=YlEmUNWgCGoj2jm8GNKmbbvOmewwPL/d+IXpnbepsTETRga7W7S7tNDRgBH7UHVwD5F0cYGU9HjfJYDkuuA+nhbjgzfOxDxg95vyTQHoQwBWDBH7u7+XIPG3xwhaFuwSbx1zWbVYb2CcLoZZCDzqer8ocV8UwLUcMz3Cif1eekk2xxhLSTip5jxEw2d1fev4RPd+Z7yY0l2iDSfdGNDtqV3ubQXGF/25dSu3dHok3dCobUT7JhSXueJLD0gqmwgAAB43fq/SY0bz9FYtrDKGjSVGhWCKXlmYaiB3HBWBEpGtmjyFJVDo2hnXwmKYiig1dqMeIVWJptDFvz1hcv7r5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hp9P61fgn1RuHvIj1Cz0V1fKbLBHYOGLcBRppAK30rY=;
 b=VPWjLfRdSJr6XmVyDSKuB/BR8C9xSb+kpyw3XzBASgDR3Myn2WM1l/JMs6K7ZJ5b2UDGMqfsBGUaZ5HSaQAM9e1b+IFT2yDPuTjXMU7jFlMmCHVzR21hDzp3LKFsfyXjJ3Iy3I9p0PK+ykJJnW7qAzVBWUcEGL2G3QEsCaZ1LJI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/HVM: don't mark external IRQs as pending when vLAPIC
 is disabled
Thread-Topic: [PATCH] x86/HVM: don't mark external IRQs as pending when vLAPIC
 is disabled
Thread-Index: AQHY/aKo13OJiWHN50yw2/gbAohrPK5JdKIA
Date: Mon, 21 Nov 2022 14:45:52 +0000
Message-ID: <4d53c50a-e91d-ec76-c884-152cb10feb86@citrix.com>
References: <69b79ab2-0acc-5980-9a79-8c477aa33868@suse.com>
In-Reply-To: <69b79ab2-0acc-5980-9a79-8c477aa33868@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|PH0PR03MB6464:EE_
x-ms-office365-filtering-correlation-id: 781eee5a-0cde-4a17-4ea7-08dacbcf16a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NoiDJmGZxi0HoGd66WTAII7uxtoKASbfWhTwHT3szuv48Nnil87Oau+8wu7kYTqWhT08PQiDji76L40GQpP6zlVov4W22ZYkYM8BjrHbaH9m4CkV5JEhNyqGJHLJQxWxjDRjCghGOtbFy5dw7kAOxjTebMOuEMf6i5wBPMgHEaDJr3ft2Van9alVH8TvgMnyyUeDyUI+f9cCX/bWikaOyUuHHeNOieQrLlEPQqCB5lAlR4XB6wql+gixD3hV4DsnBnFDqzMA6Qb0LdYg2JiYGwnYV51BinIZdHGdY1bYrn7AwbIKfK4iurHVtN9ZRuh4yYW6GARhUwohQK3eKFRlt88RutpPXFl44Ke6G/CmQVLVcc6K8dn6FjwleYNQGpEcXQMIO//071stm3kWE+dPFyeSprFaWSDJ0cvDJCE7n1YWqhdBGzgIIOJORswOzlAKevA1lldP62f3q5XWP2n1j/8Lxwx1b6YfVMu+yZJqZdA8E1kyAGQ9INRJ1rdMSv3xnUGKUT8SeafciV+lBJ3aJPf5PxdoNDi73GggrU/UzTJmd5ids180EWid1RaT3XtkbuF07PF34l0SKgQ5cpLkuP9Rs/kuhoClJGZqcezTsKc6g6J8zpK+d2oRYPBqq3aNFZQ5ce2YHOrW30oIElnxUSpeUww3fOaM5jS2HAIEky+R1tii8IipaWL5U7d7A8IFuQJOsvv7Jc/0BvHRRbksRZTBZtzScucHt1OvlYMR0is6KunmV4CIVtqrgzicnuGq+osSGrIYjJOwj7+D0P3Qcw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199015)(53546011)(36756003)(31686004)(38100700002)(6512007)(38070700005)(82960400001)(41300700001)(86362001)(110136005)(31696002)(122000001)(107886003)(4744005)(5660300002)(83380400001)(6506007)(2616005)(2906002)(186003)(66556008)(54906003)(6486002)(64756008)(71200400001)(316002)(91956017)(76116006)(26005)(66446008)(66476007)(4326008)(8936002)(8676002)(478600001)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ckk1VjFDc1NJSENzMTQ2ZUY5Y05qL0dTaGMxZEFQZ3NudkNtVU9iU1duRmNi?=
 =?utf-8?B?TTB3QXl3cjNQbkpWYXdKamlrUVcxbG50Z2UzSTNMb0U4R21BcjhGcTJVd0ZD?=
 =?utf-8?B?emhBUE5LTGZxdTJ1RHFmalJFYmRudUwwcG1JRW05OFE1TXhRcDc0UkVPZ3NZ?=
 =?utf-8?B?MkI5UmwxVXF2cUxRZGVwY3pHR2tscnF1UlRRaHdWOUdhelRHRDdHYzd2MDFC?=
 =?utf-8?B?TytpUjNwQ1ljMUdZOXd6VEdEcVBkbmRNdGZQclJOWWl4UlpRVmU4NFdjU0FC?=
 =?utf-8?B?RlRVaGg3aENwTlF2TzZkNUxrK2hONGhFeWd3UWdVWXdsSTZmSjh0QTVJNzJP?=
 =?utf-8?B?Skx1WE5Ta01Ma0RyeUNDMFE1ZnFud1ozTkhMajNnS1dSdElheHhhSkZNd2ls?=
 =?utf-8?B?Z3haMDhzOG5DUTkzWm5IdnJYbVV6ZERmc09JQ0ZJbXhOdm4zU0F6cFZGek0w?=
 =?utf-8?B?WFp1YlhhckF6ZXd0TmRRMVB5OFlBUVc0dWJmWFhHUEpuUGtWYjlpMXk2c1da?=
 =?utf-8?B?SmVodnZqZmZJcm4xZWNwQ3JVZ0E4UTNaOXp1Yk5RV0Q3WUJoRTNyZm0yNVpt?=
 =?utf-8?B?ZEN5bWlJVFVTNXF6Zmp1N3VWVWxjTTZYMjFlUE0vNkkxT2VXOHRiWFJBOW1s?=
 =?utf-8?B?SzcxS2JGR2ZTeEpYTjhCd1IxbXgwb3RjUXVwcFVCRnFtMHkySlhPNnU1c2px?=
 =?utf-8?B?U2M4NEwwSml2eEdZQ08xUGJHUTZmY1BaRk5GdERUSHZncitMdUN3MWFlbXZN?=
 =?utf-8?B?Q0Z5UE9sUC90U2Z4cHhtN0VCNVU3TVNnZnJHQko1em8xbVhDVFdrMC9rSlU2?=
 =?utf-8?B?aHlYSmovb2Z0NHUvQTg5QUdOWkxNSWpvMktGdUpTeEJtNkdlSHJCSnkvNFQ2?=
 =?utf-8?B?RFViSnlVVGlVcittWGptSklTT1JKNWJqRG1WWGVTRmtzZUhUUGp0ZnMvSHkr?=
 =?utf-8?B?bVdVZFNCbGtCUVlNbDNOR1AxWXMxSGFWTTNRYThnQ3lYQ3Q0R1Z1N0lzOG9y?=
 =?utf-8?B?aklVNTFCSkhsVzdTQzVVU0FiYXA4Z3JtdTZEK0FjTHIzc0hPZ0lOeTc5SGRT?=
 =?utf-8?B?dVpaOFpIVDVGMU5DWFdvaWVxZ3pmTUt0bnpWMm14czRoaVlZZXYzTFl0SU96?=
 =?utf-8?B?Wm5SdXZKRjBmZS9TSldKZFA2Q0pZUndqYWloK0FRSUZ1aG9CaGdWeitwWHVp?=
 =?utf-8?B?a1RqRGwwYjViMk1waHc1TWdkMmE4dXhEWEw2OXpBRXc1NVRDZG1tRTE5bzNq?=
 =?utf-8?B?K0lVZXRway8zNG5tdHU2TDM3R1A1WFlnTXFERTFKK3lrT0hmNXZTNzlQNjNI?=
 =?utf-8?B?SnN2SjRienJMVnpJNEpYUnZNa0MrUGhoZ1ltdXVrc294TW1FL3FxYmtiRnI3?=
 =?utf-8?B?a1VGTFoydnpaUUc3N3QxUUZyYXVJTlNVOEVWU1g3ZTFjRjJ3bEhrL1hWQmxT?=
 =?utf-8?B?dUgrTmxiS2E2NzRnU1ZkY1Q5VHQ4TVRCeU9ZZ1hDcGlSY1hHUUZsUHd0b3d3?=
 =?utf-8?B?enhnS0h2Z3dHWk9MTDc2NjJPT2JadE12U3RJa2EyN2o5ZzB3MkwwY0YvSWlY?=
 =?utf-8?B?ekhkNEN3M29aZVM5RFVVVXZJMnVCd2YvZnVlWlJSRVM5MlN1MS9xYTNaVjJw?=
 =?utf-8?B?cFFDWE9oM2V4d01oYkpDWDdSYU5kNys4NVZVenZRQzJ6L1p3NWVxV1pGYVo1?=
 =?utf-8?B?WFlneFlkU2tHakI5Uk02c0VlV0hHblE2L0NMSGQ5Z3VqeTcrQ0VFdkxUWllR?=
 =?utf-8?B?Mnl3eGNZcjJTYlppMURjQy8yQWhRUmdSYVRoODhmSkI1TmNXV1lrVXNKM0dT?=
 =?utf-8?B?cmVLWDRpVUduSmV6N0lxa1FYbGVpckJlR2NOOE42M011dmFZUFM2by9Ja0dZ?=
 =?utf-8?B?RDZVaVAxbnVya1VkVFUwYjd2WWFQMGhVZnh1V2RmTGFjd0pkOGljamIrN0I5?=
 =?utf-8?B?dFovVHRoZU1Fd2RObFZLY0tqNUt3eGFGVGRWay9SbDd1b2JqV1F5TkVRR3p3?=
 =?utf-8?B?dE1vU2l3aG5MRVlkWmVYMDlMci9KUXJlT0VvbXNnQWZ5VFI5TFNlenV3dnFl?=
 =?utf-8?B?NndIZE5PZEREcjgrdzU2VjBDcjExR29ic3dXcnlHSjl3R0J1NnNPNjFCZ2pG?=
 =?utf-8?Q?QNSiK/gNqGY2mcAPZ9rCC0egw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C54058D2E2D3C7449DBB700C77AC82DC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pUZlmYP0owY5Jet0ugW+Sdpc4ourz6CUjVx0CHAV/tySccAwx4bmyTkloTmYpF+A7ecLYcwJMPnrpAI17ggo5PkgyXQzwx0SdFe3kk2O042/iHGWWS7PmLsUJLys5lvNNoFPG/bSUVajG1X/O/LP5qWxHoNo70vEQjF4Qlp6V5a5dlXMOo4uXU8vdB4EgVLi53UgU34lnBlek7OBWzolr2PtyXYi/hGD/RjPNHspdfWfU6oP7wMSWasvCGdexfAFVxJ0pUgF1jcfefTDWfwG2L/Eses6KpQ/XvmOI3eCUbHNIa6uwC1KaAvFs6Ft+q/BkqWSfsHjzF4P3TUfbSNZSFIoeMwM2wTxBAS1sqwO3SiuQgJGdeI5OLXR+BjbWs1IGdf5xTwhxNYylvmOadhQg7S+tydd/DRM47Z/UH1VTeuLxTkvttk8paxbQeAe5ckOU6Viyehj/Dx660ONaSzM9mJa7CysWKjD0XY6O3ZQI/xg0bNHW1U8w95myqjy8XtXXasc5OBc0cbuZPAkQR21XDkxTi9YwVaQNIzgp5bHy8gM9xjdTvVqUdR7KYUr7zACNBM0Ga1oIUMuu2MBkvyrIFgFYw4n6OaWxqYWow7csVCpWxbBuHLf80efGwMtGIv20dn4c+irQf9CSGvuANVeQI9/zXRjNlRJN0sLDjL/kRgVWifvI40xxkmsQDaQJ/Ch8er6ej9e/iQY/Bf3S+Zivqhfb0nNn2i1/zzjmBEhTcNQ+4hSy+ux6nMztEvQpIW6+E4OQaVz7yPEwP+jk3G5rWVooqix0NVwZFQGfMrHmKZVebtLQbgFtuR0KMNmPuM04pWzjuCfk/viF2eouIgfCw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 781eee5a-0cde-4a17-4ea7-08dacbcf16a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 14:45:52.4322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xhJmk9qpQkLr0vz7Q2/5GeEl5Z6/RDcYbY3Z74nJq1WG+KXmXsjoz0hJQyi6ej2HVCsmK2GAswCiBXWTA8LSprrqXMQ4Ru4dNMTvVBUr1e0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6464

T24gMjEvMTEvMjAyMiAxMjoxMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEluIHNvZnR3YXJlLWRp
c2FibGVkIHN0YXRlIGFuIExBUElDIGRvZXMgbm90IGFjY2VwdCBhbnkgaW50ZXJydXB0DQo+IHJl
cXVlc3RzIGFuZCBoZW5jZSBubyBJUlIgYml0IHdvdWxkIG5ld2x5IGJlY29tZSBzZXQgd2hpbGUg
aW4gdGhpcw0KPiBzdGF0ZS4gQXMgYSByZXN1bHQgaXQgaXMgYWxzbyB3cm9uZyBmb3IgdXMgdG8g
bWFyayBJTy1BUElDIG9yIE1TSQ0KPiBvcmlnaW5hdGluZyB2ZWN0b3JzIGFzIGhhdmluZyBhIHBl
bmRpbmcgcmVxdWVzdCB3aGVuIHRoZSB2TEFQSUMgaXMgaW4NCj4gdGhpcyBzdGF0ZS4gU3VjaCBp
bnRlcnJ1cHRzIGFyZSBzaW1wbHkgbG9zdC4NCj4NCj4gSW50cm9kdWNlIChJTy1BUElDKSBvciBy
ZS11c2UgKE1TSSkgYSBsb2NhbCB2YXJpYWJsZSB0byBoZWxwDQo+IHJlYWRhYmlsaXR5Lg0KPg0K
PiBGaXhlczogNGZlMjFhZDM3MTJlICgiVGhpcyBwYXRjaCBhZGQgdmlydHVhbCBJT0FQSUMgc3Vw
cG9ydCBmb3IgVk1YIGd1ZXN0IikNCj4gRml4ZXM6IDg1NzE1ZjRiYzdjOSAoIk1TSSA1LzY6IGFk
ZCBNU0kgc3VwcG9ydCB0byBwYXNzdGhyb3VnaCBIVk0gZG9tYWluIikNCj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpBY2tlZC1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg==

