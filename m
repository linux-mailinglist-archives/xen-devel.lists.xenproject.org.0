Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75800678BEE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 00:22:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483345.749465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK68F-00085X-3S; Mon, 23 Jan 2023 23:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483345.749465; Mon, 23 Jan 2023 23:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK68E-00082u-Vw; Mon, 23 Jan 2023 23:21:42 +0000
Received: by outflank-mailman (input) for mailman id 483345;
 Mon, 23 Jan 2023 23:21:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTo8=5U=citrix.com=prvs=380e0b34c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pK68C-00082o-V3
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 23:21:41 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aece4d75-9b74-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 00:21:38 +0100 (CET)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2023 18:21:35 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6876.namprd03.prod.outlook.com (2603:10b6:a03:43b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 23:21:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 23:21:31 +0000
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
X-Inumbo-ID: aece4d75-9b74-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674516098;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9VAQ+PgfRLyqSM3sIrJHXqHBo+yHSLvVHai9VtXAOVc=;
  b=axQ9tY2VgrLq3OvPJMu2ufAWvHSa535xVmb7HQsDifWXekwLeMsGfLkf
   glgbTyyXdNnfFyd0oGefW6Ua+6C6fA+nIGOFCxMns8xqFIfzIgILOjlzK
   kn0rY1LtzXn10masE40ZtLVS/Hc6sfU9jNxmHRxdGgGEK+BMG2BEb7U0x
   4=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 93868080
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:i38qt6wZQfdGrZCls/N6t+euxyrEfRIJ4+MujC+fZmUNrF6WrkVWn
 2UWWmqHa/mNYGb9LY0lad/kpB9UvZ/QytI3SAE9+yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRnP6sT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXlqq
 91IFCwzVxm4tsyvz5OUb7F9gv12eaEHPKtH0p1h5RfwKK98BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvTaVkFYZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKgCNxCTO3gnhJsqG2O4UgeCw8MbmX4neWnqVKQVdRac
 GVBr0LCqoB3riRHVOLVWBm1o2WFv1gfRsBXGO057ymCz6PV50CSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5LH6+8iNnoEjjY2
 TGUqzM/gb5VhskOv42x+lrNkj+3ppzESwczzgrSV2OhqAh+YeaNboip8kTS7OwGIpyQSFKAp
 1Abl8PY5+cLZbmGkyqLR+cBFa+o/N6KNTTdhRhkGJxJyti203uqfIQV5S4kIk5sa5wAYWWxP
 BWVvh5N7phOOnfsdbVwf4+6F8Uty+7nCMjhUffXKNFJZ/CdaTO6wc2nXmbIt0iFraTmuftX1
 UuzGSp0MUsnNA==
IronPort-HdrOrdr: A9a23:Qa8OaKs3iZn4YPxhvrvnmVVZ7skCC4Mji2hC6mlwRA09TyXPrb
 HIoB19726RtN9xYgBEpTnkAtj/fZqyz/RICOUqUItKGTOGhILLFu9fBPrZsl/d8kTFn4Y36U
 4jSchD4bvLYWSS5vyKgzVQfexO/DCvytHUuc7ui1pgSAF0Z7pxqy1+DRuWA1Aefng9OXNALu
 vh2iM9nUvHRV0nKve2AXQIReqGiMbMkNbPaxQBGxk7rCmC5AnYl4LSIlyq0hASXylMhY0j/G
 SAuQr/+am5qfmnyhnak0PV8pRKiJ/c0dsrPr30tuElbgbhjQulfoYkYb2OsHQepuax5E0xmM
 TNpRBlE9t+7G6UXmzdm2qU5yDQlAUj7HLv013du3vvrYjSQjUkB9FajZ9YdByc1ks6sNlwlI
 JHtljpzKZqMQ==
X-IronPort-AV: E=Sophos;i="5.97,240,1669093200"; 
   d="scan'208";a="93868080"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fa5W9EOm8znadrPFHvvqhCeE4XdvNHGlTFNcAQ48Wgl1YRcZEJ3XtVltRncVxxiiaitOP31XHbfX7fbHgP8GT6vn7upI9Qjey7RMJp2oj78yfv+4/vhKYdYUbbz8BO+TJAj7NpQSExnY/y22zpaggieX9nvPCnTjHd2Vw4yho3NePS2Bi0AxHvmBoQgd9016xd6KSH68OsG2sKXW2XLH4pBoKmF0OngP10XCiAul4VwrR21hUjNL8OX6SgjNP1pQRgiJebAYlDLejUGrd1ki1kaP1+GF0qG9cbKGgPJCObkTCaaNWdEPGenmf3ucRTM/+vJOijIjHzxgmrJP3oE33w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VAQ+PgfRLyqSM3sIrJHXqHBo+yHSLvVHai9VtXAOVc=;
 b=n0VUAHy8c8kwHB9+v9URprFRjBWK/vsehDLaiTj0zMQsOnQYwFWA7PE5D1GxXo8nY2H0DIf2/5zEixRZXziuuPT74XR5dbvPrxW9JlQNWRX/yH7XKo7RRjVNi1MlO0wKBdgkeMsZwhYVlTmFo8uLlO+2YwSa0z/jBSnSthSRJXx5DGKSMYvXotDRmL/MEbboJGnGbHgGc9q5R14fJdnBPLMePoG7jmw1eAE0SQd1lwqBvCry1FLIPL94ZE4L44UjvSfOCInCOhoM6h2+QHHpUpWCM+7q3R02O8zBK4J/365D4PdtYdV2Rb16YiJEyHQsYeX3aIUri3ZFzw77Q7hAOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VAQ+PgfRLyqSM3sIrJHXqHBo+yHSLvVHai9VtXAOVc=;
 b=sbiUf3LtAq2/nlz9Kfm8jZcp6tQ24RI4HsjYPqtxM9FOWjFIs0/E9XH4or+S7qBoG8ulKrCpO9XJPcYJzjHl9CqrsN+j2td/TO/R0f5Dc/rttKwSexdhEZXW6W8JADt7Z881lnye5FjtreKz0L3Oi5rCFrMSluEIgdiCF+1AW8A=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v1 11/14] xen/riscv: introduce setup_trap_handler()
Thread-Topic: [PATCH v1 11/14] xen/riscv: introduce setup_trap_handler()
Thread-Index: AQHZLOAf2Nb+ieXL2kOG2Uab6ou5Zq6sqRgA
Date: Mon, 23 Jan 2023 23:21:30 +0000
Message-ID: <649d27c9-d8fb-e6d6-5b4a-a28ed4773f1b@citrix.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <b8d03f33aea498bb5fde4ccdc16f023bbe208e7f.1674226563.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <b8d03f33aea498bb5fde4ccdc16f023bbe208e7f.1674226563.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6876:EE_
x-ms-office365-filtering-correlation-id: 693343b8-ca98-4ab9-7560-08dafd988f7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tj0CyC8sDgWGiGzCEZetYXwlMudXXJVGYcUXq58m3MjGjvXTHILys9naxETuQkA1xRE4PsnAtOaTGO5aUWcqK+8fS1TdGPLXrbYv3Y7XvraV9u7tlliKNCZkejMo8eGhafu24ZGkfM+bE17AWrCuuP7NLKeHx1esvfNTy241LUyFVWMfA6oVcXoLQ5cQ3EcP697Z/4Lj+fjAbg0E46rsZjxfQcXO3y5wrzxVrQJGvuB4TfgvfGzbbRtVnGpOjy4zqXnHBoTDM+atSobzgiGp/X6f8TxyjL5J9U4h9DwbZ7arAf5tGu4cmD9QJGAkhGbJepBD0aqzbgKTAgTvUpqLMZ0pmb4W1nDlaFwYIWqDyzifwf0gC9KO/cxAhielCIMGgapBk/iomb1/gudC5l5vBlwXPls8mINeIg3EmJ3MoMsT9Qg0Rgp0SzYys21HDRwRVdtX1QSr9ycy1mPsi6uJNWBNJn+dcqFMNHqPQinHPbsRcndBJzDpPVMHcCb82+cJhV+dvVJC45X6WzyBfUEZxQ2lffp8nIzo2SCSWhGeSx3z3fJe6i+znCPk3vTqBTBPmYc2ElnAjF0pUFFpmBdUB8Lwyg9b38Th7B6t43wKjmSFexP/JvQLnWKG9EXEGC6Q78ckM18/mMVJi4L7/a/1XhR7FVyw9zPRTlVbuOxX5gt5V+vf8iJ+VFD4CCZeVhWo3eR0c/YWgZLgNXNzpTtAKSTyjEC0Mjmx4HhV23POUdPEyc5JMO9DWtoHj95iniU5wCsWdONo6VcfSHnXl5S19w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199015)(122000001)(38100700002)(83380400001)(38070700005)(82960400001)(41300700001)(86362001)(2906002)(8936002)(5660300002)(4326008)(8676002)(26005)(6512007)(53546011)(6506007)(186003)(66556008)(66476007)(316002)(76116006)(64756008)(2616005)(66446008)(54906003)(66946007)(110136005)(91956017)(478600001)(71200400001)(6486002)(31686004)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bmtqd2dJTVoxS1NwRjhsVGcxNjUyTzFRTEVMbEVLL0ptYjNXMnJSdEpyMDZ1?=
 =?utf-8?B?MVFHZEExQmxHVWFoM3FSM1A2RDNZYWdWTDArbzIwb3Y1S05udGxtYUI4ZnJJ?=
 =?utf-8?B?QXQ3aldvYkpUL2J0VDNXT3IwZWhQZytkVnFnWThic29GWU1GbkorRVBHdDFh?=
 =?utf-8?B?Y3BFbUdHa3NCZXRCY05HUnRRU3pqVDUrWUV4ZVJNNHNvTTNPV1FpUEl1eDBu?=
 =?utf-8?B?NCszbkVnSUN1TjRWZE9yMTFxZ05JQVNaS29TZ0pOaW42SDV4QUVzWHVNeXJI?=
 =?utf-8?B?ZE9ueDZuUjlDK01tVnNONDd3amFtbTRxY2d0MkR2TU9ac2lSbjc1T0NMUXNP?=
 =?utf-8?B?U2JkaDZsSjhJS3NNOUdBenVPZENmWVB2VmFXdU1Ra1FHNnRKRmc3ZG0rQjdq?=
 =?utf-8?B?VXZDWHdSL1VVZG00M0pWVVhSbVBaWGllTzk4NThDYWVFa3dQc3NuNkNybXRu?=
 =?utf-8?B?S24wTkFPc0VaV3pDZWd2aTBCckN0VU55Tnk0Z0twcXBacjFSaS9aT2pPdmJl?=
 =?utf-8?B?YzdGeUI1SG84emswRUJnTXdoS29JQ01Ualc5UzBXZmo3cGRrc2ZSRmJ3cHo3?=
 =?utf-8?B?OFA0d0pZL2xjOXRDQ1FFUUlqbFduK1BKNXV1ZWo2aGZra2k1K25JdWVoTG94?=
 =?utf-8?B?bDE3bG91TkdEV0tzcFM0NE9DaUFxdDZjeG1DRk5MTGpncXE4NnFXT2twY2Rl?=
 =?utf-8?B?N3p2ZEI3UmdidldtZXdiYUs3K2JET3gxeXkzYTVtVXZ0RUU4SUxzcXpzeW0r?=
 =?utf-8?B?RTBXbFVpMjhncERRcVViTzExQmpSTlpzSDBIZzdGSVlKdlRiNi9yWldKc0JN?=
 =?utf-8?B?MHoyTXIwcDk0b0NBd2VvNzRNUzlVaHR3Vzlsd0wzMlp4OHRBNHFELzVuazFm?=
 =?utf-8?B?Y0JZY21OM0tzWWVvQm5jMllnNmlhSUlXamdjQXBDYjNiMWZ2VDJ2Sk44TVJK?=
 =?utf-8?B?Z2loWGNyRlNBRkQrWlVLZzl5Mm9hMllXK3VIR2JReXlpUnRRQVUzNUZpcmY2?=
 =?utf-8?B?TSs3bXJPakswTldrYnJHbFBFdmxnRjhtRkxRbHJCZTVLa0pnU2JDRHJ6MUp6?=
 =?utf-8?B?d2wzbWlnN2NJdlc2MUJQSWFqdEJNODV6TlJRVCtuOVEzMHVkcDlWMUtXNjFs?=
 =?utf-8?B?c0dOcXhpa2RNRXYxcG1OYzZ4K05RUnBaRzVvdVppUmFLQnh0Nmg1bUMxVzJx?=
 =?utf-8?B?elF1QVczdG9vYzlJOWJDdnRtYjFEek1wZXdMYnhoanJUVWJjTldiT3RWaDk1?=
 =?utf-8?B?SG12VTlsei9NdVV0VStkOUU1dWFOczJHejUrRjg2NkhxMWVFSmRvWDR1czBN?=
 =?utf-8?B?a3VHVlBlKy9RSnRLLy9WNXdUd2x5Y0dUWXZrWkVucEVBeVlBT1JTRGdySWVr?=
 =?utf-8?B?dmlhSHY3RytuTncxYVljUDErQTJ3TzhtdlBTMkloNTkvR2U1eVNtS0dOMUNx?=
 =?utf-8?B?dTFTUlh0Uk0yNFF5aXNYNmwxYzl6ZHp6VEdzUDVOcDFIbjFWS1JXQU1JNFRL?=
 =?utf-8?B?aDNINk9yazlJZ3RiNUFEZ3BnTDljdjNLRmJxYnV6RXhyU0tMWmdIS2RTOW1r?=
 =?utf-8?B?dS94SnR2Z1lsb0VRUENtcThIQVcxdmJwYkMwQU45cjQ2Q1ZMcm81M2Fac1pT?=
 =?utf-8?B?WTRUQnlGTkh2T2pkbk13c1N5RHNkYWwwTWVKZ0l1ZHBUUXRuVnBmeTlDWFhL?=
 =?utf-8?B?dWNWcW8xYzBDb1IwTXlEc1AyQTJjaHRiVmhhZFE5bHBMcURxUFhrWFNHbHFK?=
 =?utf-8?B?TGxkWlRaeUt3c2VqRHZWVkFsYkFabE5tMUlKT2VldFp2bzVTc1ZBTnBsZUoy?=
 =?utf-8?B?RVY0djE0RjRZR2UzM1poeXZFUTNWQmR6Mm0renlXYkM2NFBUclJSUzZTMHg4?=
 =?utf-8?B?U0FZblZDeVRzODJPWjkxcFNUd1BSVDcrU0tsOTgrakVRUmFuNW44UmhYRE5I?=
 =?utf-8?B?cWlOQnhaUDM1NzZOUkhFT2h2WkYwWnVBVllEa1FUQnRZajBVdjRzVlBOTU5R?=
 =?utf-8?B?VU9INXM2MURqOUZ6OXJHdHEwRDhRTk53dnRkODJzY04ySTFPMmZHR2hyV0Nr?=
 =?utf-8?B?WkM3MTR0VEtPUFJEbjA5eDZ5MHJ1azVMaGViYW85R0pjQjBwejl4VGJXSXZa?=
 =?utf-8?Q?ffkzjilnNgE/vbk/dbUhetYpL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <33AD6D6D84F6D94E8710024B9A2E812C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X7FpE/wjCnPUrtb8AXS/5qBnmxCqSGqHSxxhNMGtwHDw3v4PNlXv1E2zm0EXxUciD8+FnzH6K1Nz1Y+/2xiWFqz3m5QxUxrZhW6mAnj3UQBkFM6S17cbHWDegitEEKn4J32VT+EcFxbLooKFz+0CInY+pKD/lFHqlRrxpETNfagtkOqGt67Vtpk/T/o182ceZanSMK0abr1VabQY+HffxXR/0KTMs4D5Gq8lSDIE4/OqPwPtS/fsAWT3JGkO77aSiYkrwIt1GyxoK4MknRgAFNTRQLmOeTle5HF5gf4PzJgNYrocs2+18VhWej5nl1ALagjTw/48I4mOcitW+LLQZJ+ypjt8rxL1rsV00I6Pb9VnkOhxJrtyzr3VSFIAWdi6JtHFYwr2eVGjmZhvvk+ZlZpA2OeViHxFSSYuhXfyRAqG23SHUs7oP4ofqwZTz6bvUzqVicwIhag5a3DD1M0CQnPREXc+cnaOEQ4xF1JsA4gEcpdkBPesunLczkMOPCICRAuIZ5rvzCDKerPWwZo08HzbqRM7Npq9VbHujb7Lbb5CM1SIsYhu7dMGRS7i7SaGfj0C9M7se6rWT75LvwXDzfMxEZnlet48pV0JMaXdaQAfYaAIgQSasGsaKIaMaqWsaoCQOf+ToX3rZ//ssD93QVopEakpkgkHaSf7RWGz5Ept1A6Kav7jFCMjC2w5fj3r+aAydljJj11wpQXHz5ex7/8ShRMQCrFKbxp6ejGH2HafpUz06D6m0Z1X7P/JXq1aV1YclNK0GpLmEkERQu+fgPN5KIpHH1gZ6pVNrH10NugeRy9stEXrBMy056DMbWMs61NkIInOXeQ8L/6mdkrunRhPLb1uxkDZ1Z6pdxNjkhwp9yBFmjbEtl8hOuQCGHif3RcJ2SinPDQXXmQWkhcy5g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 693343b8-ca98-4ab9-7560-08dafd988f7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 23:21:31.0344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ish8hN88PD0GyYUqyTIZW28n7SfQYNtaL7YxGGHTbmJHyQyIe3topu2az4lPf9FfWgt09TtDUxgd5cXCte3m1VdG+eVOJKF1H6oYUa9fzE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6876

T24gMjAvMDEvMjAyMyAyOjU5IHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiBTaWduZWQt
b2ZmLWJ5OiBPbGVrc2lpIEt1cm9jaGtvIDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4NCj4g
LS0tDQo+ICB4ZW4vYXJjaC9yaXNjdi9zZXR1cC5jIHwgMTEgKysrKysrKysrKysNCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9y
aXNjdi9zZXR1cC5jIGIveGVuL2FyY2gvcmlzY3Yvc2V0dXAuYw0KPiBpbmRleCBkMDlmZmUxNDU0
Li4xNzRlMTM0YzkzIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9yaXNjdi9zZXR1cC5jDQo+ICsr
KyBiL3hlbi9hcmNoL3Jpc2N2L3NldHVwLmMNCj4gQEAgLTEsMTYgKzEsMjcgQEANCj4gICNpbmNs
dWRlIDx4ZW4vY29tcGlsZS5oPg0KPiAgI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+ICANCj4gKyNp
bmNsdWRlIDxhc20vY3NyLmg+DQo+ICAjaW5jbHVkZSA8YXNtL2Vhcmx5X3ByaW50ay5oPg0KPiAr
I2luY2x1ZGUgPGFzbS90cmFwcy5oPg0KPiAgDQo+ICAvKiBYZW4gc3RhY2sgZm9yIGJyaW5naW5n
IHVwIHRoZSBmaXJzdCBDUFUuICovDQo+ICB1bnNpZ25lZCBjaGFyIF9faW5pdGRhdGEgY3B1MF9i
b290X3N0YWNrW1NUQUNLX1NJWkVdDQo+ICAgICAgX19hbGlnbmVkKFNUQUNLX1NJWkUpOw0KPiAg
DQo+ICtzdGF0aWMgdm9pZCBzZXR1cF90cmFwX2hhbmRsZXIodm9pZCkNCg0KV2UnZCBub3JtYWxs
eSBjYWxsIHRoaXMgdHJhcF9pbml0KCksIGJ1dCBpdCB3YW50cyB0byBsaXZlIGluIHRyYXBzLmMN
CnJhdGhlciB0aGFuIHNldHVwLmMsIHdpdGggYSBwcm90b3R5cGUgaW4gdHJhcHMuaC4NCg0KPiAr
ew0KPiArICAgIHVuc2lnbmVkIGxvbmcgYWRkciA9ICh1bnNpZ25lZCBsb25nKSZoYW5kbGVfZXhj
ZXB0aW9uOw0KDQpDb2Rpbmcgc3R5bGUuwqAgTmV3bGluZSBiZXR3ZWVuIHZhcmlhYmxlIGRlY2xh
cmF0aW9ucyBhbmQgY29kZS4NCg0KSGF2aW5nIGxvb2tlZCBhdCB0aGUgc3BlYywgdGhlIGVudHJ5
cG9pbnQgc2hvdWxkIGJlIG5hbWVkIGhhbmRsZV90cmFwDQpyYXRoZXIgdGhhbiBoYW5kbGVfZXhj
ZXB0aW9uLsKgIFBlciB0aGUgc3BlYywgYSB0cmFwIGlzIGVpdGhlciBhbg0KaW50ZXJydXB0IG9y
IGFuIGV4Y2VwdGlvbiBiYXNlZCBvbiB0aGUgSVJRIGZsYWcgaW4gQ0FVU0UuDQoNClRoYXQgYWRq
dXN0bWVudCB0byBuYW1pbmcgd2FudHMgdG8gcGVyY29sYXRlIGRvd24gdGhyb3VnaCB0aGUgY2Fs
bHRyZWUNCmFuZCBhbHNvIGluIGVhcmxpZXIgcGF0Y2hlcy4NCg0KVG8gYXZvaWQgdGhlIF9faGFu
ZGxlX2V4Y2VwdGlvbigpIGZ1bmN0aW9uIGluIEMsIHlvdSBjb3VsZCBjYWxsIHRoZSBDDQp2ZXJz
aW9uIGRvX3RyYXAoKSB3aGljaCBpcyBhIHJlYXNvbmFibHkgY29tbW9uIGlkaW9tIGluIG90aGVy
IGFyY2hpdGVjdHVyZXMuDQoNCj4gKyAgICBjc3Jfd3JpdGUoQ1NSX1NUVkVDLCBhZGRyKTsNCj4g
K30NCj4gKw0KPiAgdm9pZCBfX2luaXQgbm9yZXR1cm4gc3RhcnRfeGVuKHZvaWQpDQo+ICB7DQo+
ICAgICAgZWFybHlfcHJpbnRrKCJIZWxsbyBmcm9tIEMgZW52XG4iKTsNCj4gIA0KPiArICAgIHNl
dHVwX3RyYXBfaGFuZGxlcigpOw0KPiArICAgIGVhcmx5X3ByaW50aygiZXhjZXB0aW9uIGhhbmRs
ZXIgaGFzIGJlZW4gc2V0dXBcbiIpOw0KDQpQZXJzb25hbGx5IEkgZG9uJ3QgdGhpbmsgdGhpcyBw
cmludGsoKSBhZGRzIGFueSB2YWx1ZS7CoCBJdCdzIG5vdCBvbmUNCmxvb2tlZCBhdCBieSB0aGUg
c21va2UgdGVzdCwgYW5kIGl0J3Mgb25seSBhIHNpbmdsZSBDU1JXIGF3YXkgZnJvbSB0aGUNCiJI
ZWxsbyBmcm9tIEMiIG1lc3NhZ2UuDQoNCn5BbmRyZXcNCg==

