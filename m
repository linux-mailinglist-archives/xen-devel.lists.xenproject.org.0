Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 242405FB145
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 13:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419572.664362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDCd-00043E-9s; Tue, 11 Oct 2022 11:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419572.664362; Tue, 11 Oct 2022 11:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDCd-00040p-6G; Tue, 11 Oct 2022 11:13:39 +0000
Received: by outflank-mailman (input) for mailman id 419572;
 Tue, 11 Oct 2022 11:13:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3DRi=2M=citrix.com=prvs=276b56479=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oiDCb-00040j-W1
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 11:13:38 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id beefeaa2-4955-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 13:13:35 +0200 (CEST)
Received: from mail-bn8nam04lp2049.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Oct 2022 07:13:09 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5145.namprd03.prod.outlook.com (2603:10b6:5:1e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Tue, 11 Oct
 2022 11:13:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5709.021; Tue, 11 Oct 2022
 11:13:06 +0000
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
X-Inumbo-ID: beefeaa2-4955-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665486815;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DxKKZvA+xwRFz4ieq7pKElvtN+v56YSUwmmWRv544k4=;
  b=XIiWI3zgNYu0PTnwE+Jsnw03NsnhoZDkl2VxZcPQASfDJIYb5yE2jROB
   RC7H6TBMWBr+tO1vsg/l3baCzz096tZOmQfJrghNcAndPD/IVdKrIj0Rf
   j1gdyWOHNpAkUPjsRlABGY8+mjhb17lpnsC15J6M0GP0hIzHbqQ2hh+f2
   A=;
X-IronPort-RemoteIP: 104.47.74.49
X-IronPort-MID: 82878647
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KgMzEqCCegpyzhVW/xviw5YqxClBgxIJ4kV8jS/XYbTApDkq3jxVy
 jEYDGjXa62NajSmc91wa46/oE1SucDWydUxQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8pWo4ow/jb8kk25K2r4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2k0ZoM3qrhGGlhq7
 NAYDTUtZA+Bl8WplefTpulE3qzPLeHNFaZH5jRK62GcCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWIE7g7EzUY0yzG7IAhZ+b7hKtfKPPeNQt1YhB2wr
 WPa5WXpRBodMbRzzBLVqCLz1rGTwksXXqoTTeOAqtNBmWap/UMsVDlOWgSC4r6m3xvWt9V3b
 hZ8FjAVhYg/8la6COb0WRKQqWSB+BUbXrJ4Eec39QWMwar8+BuCCy4PSTspQMMinN87Q3otz
 FDht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHeTJobixvOSpNpFv6zh9itRTXom
 WjW/W45mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 SBsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:frPXRanXgxBUbuKKqnPkeetF4qbpDfOPimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LHErXoBerZ8bMRiA1XkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4ZkWUzxjIjLH47JlON1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEz82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBOB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+qKGjMiq9NVlVcQ6duf22vaIJy4EUbICbQRGrWRQpj9aqpekZD4nSR+
 uzUagmccPeEQ==
X-IronPort-AV: E=Sophos;i="5.95,176,1661832000"; 
   d="scan'208";a="82878647"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUoyRt0xHHjnK0GngtGbQYd9B8zMHXHlzgypZJwIQqJqfTTIC53jmQ9ZcFuVvMnlex0+3pARgvZNAeeKeUfEi8UWU8sqMuyjVzThRiQWQtO5c3ZzK83V8JhQNogMFCEo0P6PQQTMopqGxeH39jKeO2C1A3YWv+fzw1PMfxiAx+e+eXK//RpSQ/uf+l2N4ReeLNNUzmgFT5yK2y4WRhtq+i8E2xItPyXhnK/P9KEufYKyIobAGyz0/uyVGLbjvHCX6ojvmZuQ42fyvO9jbnlfXJ/Vy8vVoDeHzZuhOCDtiwqhjph670WlkofWdQbflcHyMiFLUGiVidIMuujB66v8bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxKKZvA+xwRFz4ieq7pKElvtN+v56YSUwmmWRv544k4=;
 b=lfapv03Fxh53RQSIvnTZBgLC/pO4cLZaOoSuKVVrRsdth4w/e/JUF0QryLQ6m5PBmIvQiTH7mFF39J/zxz2jpsywt9hW/UNuG3RlUJBm44l1aiNPC+QUTWFctS5uyIvnT/cwunrt/Mj39iJL10icAJc5hh07dFygomyEJy1UMBGONsIF1V9kxhv6OC9ODOB5Xe59HV85Omq0LreVtR98Ct9y/ze1xcN7Zo99fbu+Q6PhxA3M67+Ha5tWoR7WPUzAZh1V3rrHBid6djtbudWS9aJHmH2NcdVStYcNMWhv4uRYbRFbqA26EW7+ImI7ZGBJah/YYM0C+fRWn+KJ2cOw8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxKKZvA+xwRFz4ieq7pKElvtN+v56YSUwmmWRv544k4=;
 b=kyvLyjKhuNkhujOCAYef9uXwu5IepLayD603p39wbvq/GwCGIlFhrji6CrwFDzImme1gjbjajsrX4TuK/7eKbUk7IqJetzwDfNVws8rPQWfeMcf3T1ZFiVkVkmApg+QxXDT453z2yTzP+2KkDpQiLFJJxBHwp58BE+AjwpAmQb0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [4.17?] Re: [PATCH] x86emul: respect NSCB
Thread-Topic: [4.17?] Re: [PATCH] x86emul: respect NSCB
Thread-Index: AQHYyNP7HPEYuhoQC0yvtYIRC5F8064H/XmAgAEhrYCAAAwLgIAACAWA
Date: Tue, 11 Oct 2022 11:13:06 +0000
Message-ID: <6be3288e-7d08-1e07-1283-c68a2acad88e@citrix.com>
References: <b0103a30-22b7-c010-3e8b-6eab1c25ee47@suse.com>
 <f5851974-86ab-8da7-3b5f-4196faae7969@citrix.com>
 <1fc32039-5a3e-5f74-d6ab-059ab8037338@suse.com>
 <AS8PR08MB79917F69AA9899C2A86C3C1092239@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB79917F69AA9899C2A86C3C1092239@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM6PR03MB5145:EE_
x-ms-office365-filtering-correlation-id: 4d5d50d7-5fb7-46c7-21a6-08daab799277
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Yf+bG0eXdrHjpfwVVAohOneIe+jXbWbQpw8bxAaBrgEW+pGGHqfhs66pKXE/Rzug/3XmY2WhhhGZGzu6DveWRR2SF0h0jMUIf92NOgtoYg9vJ/nwPebm5LKggW89SdSXOr5xamaQYUSc9k3RqyksVgg72C2P8oUjwvrr14CFYXsN+v7XbjqfuawaDPY0Mm7bLjdhQeAEY8Ea/iEwc7k0ryEY7G7XjJdX+zPOShlanOVqyBDxRAGOXvCSRwjn4xiUcTmsWk3xkuOeOzUMkKVJtH9/jXrxLjYLHm29wJhkSJxmeJP4Z/LQrL9jF7u+/oxaXQxd9SaQdjD+NrlcJQpCxyInElThgg+v3Pd9gsPtOrVfwP3xcb6tkJSkcP+BhCbmnAAVcktEXbSYz732m/JlxP8LRXipm2SKzKnVQhGBG/90ay8gxOOjgLdnCoF1xDA4kfb+PUdVgPDJB6YkLUbpjOCiFwLa3+xFB4AFbNclt/ye//JyFM/6wSfBA/IBsv4ZhACN77x6B700WKx3U5PSBBRPpK7SPuBeG/xwbgIttuT820ATotgfCFdxjf9epBzahxf2bz1RJnmJkUrm6Vl0+xHawqaa/FsfbrLLYqq8sJgy86YYdtsD/S5vLZ/aT2rKp9nunprAsAjbeRAdn90Hf9k3MtBCNbSzSxbsie0eJB73g0DR6uNxI21pQPmp/aCiVONjybYuqQUQSaRsms02WU9tqc6y1N9CpZc2VqVUCR2FUsZe9SqcUFPLBRarIqJfBPup6m/2/G4lh5dD1Et1seUd3uLtSt5bBC8mIiPr5Rn0HUiBwtbe9mVSJUXKWOedXA4PZiUU53oUphlDA2tQxg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199015)(316002)(26005)(186003)(36756003)(5660300002)(8936002)(2906002)(6512007)(2616005)(8676002)(66446008)(66476007)(66556008)(66946007)(4326008)(76116006)(91956017)(64756008)(53546011)(6506007)(41300700001)(83380400001)(31686004)(71200400001)(38070700005)(122000001)(82960400001)(478600001)(110136005)(54906003)(86362001)(31696002)(38100700002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aVNDZGdJdEI5QzQwSnNLZzlhQnFJUVdvZnE0dnJFblBieWEwbU1LaGl2NHZo?=
 =?utf-8?B?eVorUGtMZlNkLzNORmg5WDdLWkU5ZVM3M3lRYVRrVlpoVlhHR1lZVklQY20w?=
 =?utf-8?B?K28wKzFMZGR0cHpGanlhQU9LL1ptUUV2L1BaNDBESmQyYWw2V21ZcnN4QWhw?=
 =?utf-8?B?T093cWRUOVI5azZvSkpRcWlpdG84MGowSU95OHh1Nm1nZHBqVElJZUNDcndM?=
 =?utf-8?B?MFd1N3ZUbm9DUVJQY2ZHK0pTaGRWK3Q4bVhnS2htTG5kR2lZVXg2TmJCSDBM?=
 =?utf-8?B?WkpGckNZUDFDaXMzNkp1MVNpUHZXNnFQQXlqUmJvbEpBMDhaZ24yT2NEL1FD?=
 =?utf-8?B?SHVHdFJwLzdQVElPUlpJTmxvZktLcFAvSUhoVEE4V1dCSFArbHFEeFNyS2pL?=
 =?utf-8?B?eHF3a0Iwc3AveW1GR1QyV3F4OUJtbHpwdGZYaFR0ZlpFVnhCMmVaaVlkYkdS?=
 =?utf-8?B?WmtlWlhpQ3dpcGpKdjd5cjZCNUpYUXRDc0ZLQjdiZEJsZEZwSklKYUxPbkgy?=
 =?utf-8?B?RVA1MHJGMVRkNHFIUlhEUU5TRFRlLzAyWkkwUnFVL1RMR3dOTHFmNzFLTjVQ?=
 =?utf-8?B?b05NanZwcExkaTFVT29HRWhXQlZHQWZOM2FIYklzTldHMlB3OWNOVC9xaVNv?=
 =?utf-8?B?SlhRTGJEbzlqRXBZOEVEM1ROcG81NXdjcDZnaitPbVFqN3dUK3FlNWxzREkz?=
 =?utf-8?B?RHdUbFRNQTFWeHkwQzlWRXltdllUdStYV0JOVVEvNFFnb09CTG0xQ2hvODFV?=
 =?utf-8?B?OGpad21QOU9EWTBjdHlKeHZsdk9yUjcxYzdTR1F0cVBGZTVuVDAxdEZYc2Ux?=
 =?utf-8?B?NnRTdThKOXJPZFFiRVJMd29WcjQrRmZKRmZMTG1reDhXa2lwbTQ2R3ViM2ZW?=
 =?utf-8?B?dFZnUUJTRmJrZkRCS294eHRSZDF3R0preS9OM1FhU0U3RmdxZGcySmt3QzM4?=
 =?utf-8?B?eW9sME4rd2ZBVVg0NVA1Vm93ZWRyemU1Q2pqNjBuZk1PN0FDTGM4dTVWY2xs?=
 =?utf-8?B?SXU0akEvOW1RZTFWcFlEMkVJUVlGcFc3Q085K25xMkRIaXd0ZEVJZ2s5M01D?=
 =?utf-8?B?MFJFdDltazh5bFdhTEFVWTNuMGJZenYwSm1Da25qSllRSzRncE5hMEIwV29a?=
 =?utf-8?B?TElaMkJpRmhNV1B2V21oWjNaMDdOSHlLTXYxL1RjMUZmMmVINlR0UUJnL3VE?=
 =?utf-8?B?djFjbkpDMkJSU3poWnVSNEs0aDdnLy9tWUhYWWc4Zks3QmE2OVQwUFhEYTdr?=
 =?utf-8?B?cUM4WHEwMUJjSVd2SWR3NHpGU2dHVVA1Qlg2Rktxd3JRc3kxejB3TDZIN0pO?=
 =?utf-8?B?TkxQcnFQcDJxMkx2VUMyOFFCamZoMk1yZUt1NEtJNFU5WmZOb1VxcUEyWWhv?=
 =?utf-8?B?VzhuaWh0SzEvUTZ2VVJkbkQ2OEhxdDZVb3ZQakZKWHJxcjFMeU5NL3Vqc3dQ?=
 =?utf-8?B?K05lVTIyenpkSFJ5WlQwRzZiVGpLRFhyWDA4N2x2RG5FMFU2ZzFFekt1WDc4?=
 =?utf-8?B?T21aT2wxS3owREtwdENsRCtTa3pITEtFUWNXQm9yVkphaVRQOUhScTRkNG1P?=
 =?utf-8?B?RE41dVdJblQreEFuL3ZCVFFXT2dvWm5ia0J0UkdmQm5hSHRwWEErTURhNlVN?=
 =?utf-8?B?WWRPMGQvazdtZDJNRlU2Z1pHbXNEQkJ2Sng4Ky9Id3dJQzVZMWVscVNyN2g5?=
 =?utf-8?B?QWpQaVc4Z3ZCbmdIREZ4clo3bGc0M0F4bTNzME9jK1lGeUE4UkdLeHF1dGFH?=
 =?utf-8?B?M2k3aVN3TFI2Vm4rZWo2Zmpxeml3b004S0pBZ1l1b1Nzd0cycjF4Z2Npai9q?=
 =?utf-8?B?azJ2V2FDckduT0tma1dySnZDbUlyWm14bGt5aDFQWnNFbytzUUFOMDRXaytw?=
 =?utf-8?B?MFlqOE9qY1RjL3ZVSXRYOTN6ZGs4QnJxaGtEWkhpRjJWRklNSEpKWXI5MFlW?=
 =?utf-8?B?UVpWZVZrbi9vTHA2YVc5SHFIbnluL2QxcFpVdnV2WEltK3ZnUW5LUStYaFZQ?=
 =?utf-8?B?elhnZldJRmdHanRzbzJ5M0VuZ1NiMUNweUxoalZBMm9ibmx2VFU2bXJPZHNP?=
 =?utf-8?B?Q1pibFZjR0daQ21QdTdTYS9QOHhvdWRiQUZvN00wR2ZZVDhTYThmR2htY1pv?=
 =?utf-8?Q?p+KSuuyK4sFTsA7nrNGilTo2N?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD4430F6ADD95C4E951E8EFB70D8DB1E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5d50d7-5fb7-46c7-21a6-08daab799277
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2022 11:13:06.2707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J3txwyLiO3utLgigqOxEt7K/qpNf57h4FSh5GwnAzFRr8mj8DUdT0sAJh5/H7Tb8/IBYXziClMfUWB+VyaalHdtwQAZf+mR6/3yWgJNn7oY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5145

T24gMTEvMTAvMjAyMiAxMTo0NCwgSGVucnkgV2FuZyB3cm90ZToNCj4gSGkgSmFuLA0KPg0KPj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCj4+IFN1YmplY3Q6IFs0LjE3P10gUmU6IFtQQVRDSF0geDg2ZW11bDogcmVz
cGVjdCBOU0NCDQo+Pg0KPj4gT24gMTAuMTAuMjAyMiAxODo0NCwgQW5kcmV3IENvb3BlciB3cm90
ZToNCj4+PiBPbiAxNS8wOS8yMDIyIDA4OjIyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gcHJv
dG1vZGVfbG9hZF9zZWcoKSB3b3VsZCBiZXR0ZXIgYWRoZXJlIHRvIHRoYXQgImZlYXR1cmUiIG9m
IGNsZWFyaW5nDQo+Pj4+IGJhc2UgKGFuZCBsaW1pdCkgZHVyaW5nIE5VTEwgc2VsZWN0b3IgbG9h
ZHMuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4NCj4+PiBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4NCj4+IFRoYW5rcy4NCj4+DQo+PiBIZW5yeSAtIHRoaXMgd2FzIHN1Ym1pdHRlZCBi
ZWZvcmUgdGhlIGNvZGUgZnJlZXplLCBzbyB5b3Ugd2VyZW4ndCBDYy1lZC4NCj4+IE1heSBJIGFz
ayB0byBjb25zaWRlciBnaXZpbmcgdGhpcyBhIHJlbGVhc2UgYWNrPw0KPiBTaW5jZSB0aGlzIHBh
dGNoIGlzIHNpbXBsZSBhbmQgdG8gbXkgYmVzdCBrbm93bGVkZ2UgdGhpcyBwYXRjaCBpcyB0cnlp
bmcgdG8NCj4gaW1wcm92ZSB0aGUgY29kZSBzbzoNCj4NCj4gUmVsZWFzZS1hY2tlZC1ieTogSGVu
cnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KPg0KPiAoSWYgaXQgd2lsbCBub3QgY2F1c2Ug
dG9vIG11Y2ggdGltZSBvZiBkaWdnaW5nLCB3b3VsZCB5b3UgbWluZCBhZGRpbmcgYQ0KPiAiRml4
ZXM6IiB0YWcgcG9pbnRpbmcgdG8gdGhlIG9yaWdpbmFsIGNvbW1pdCB0aGF0IG1pc3NpbmcgdGhp
cw0KPiBgIHZjcHVfaGFzX25zY2IoKWAgY2hlY2sgd2hlbiB5b3UgZG8gdGhlIGNvbW1pdHRpbmc/
IEkgdGhpbmsgdGhpcyB3b3VsZA0KPiBoZWxwIHRvIGlkZW50aWZ5IHRoaXMgcGF0Y2ggYXMgYSBi
dWdmaXggc28gaXQgaXMgbW9yZSByZWFzb25hYmxlIHRvIGNvbW1pdA0KPiB0aGlzIHBhdGNoIGlu
IGN1cnJlbnQgcGhhc2UuIEJ1dCBpZiB0b28gbXVjaCB0cm91YmxlIG9yIHlvdSB0aGluayB0aGlz
IGlzDQo+IG5vdCByZWFsbHkgYSBmaXggdGhlbiBqdXN0IGlnbm9yZSBteSBjb21tZW50Li4uKQ0K
DQpUaGVyZSBpc24ndCByZWFsbHkgYW4gYXBwcm9wcmlhdGUgRml4ZXMgdGFnLg0KDQpUaGlzIENQ
VUlEIGJpdCBpcyBvbmUgSSBtYW5hZ2VkIHRvIGdldCBBTUQgdG8gcmV0cm9hY3RpdmVseSBhZGQg
dG8gZml4DQphbiBlbnVtZXJhdGlvbiBwcm9ibGVtIHRoZXkgaGFkIG5vIGFudGljaXBhdGVkIHdo
ZW4gbWFraW5nIGEgY2hhbmdlIGluIFplbjIuDQoNCmkuZS4gdGhlIENQVUlEIGJpdCBkaWQgbm90
IGV4aXN0IGF0IHRoZSBwb2ludCBhdCB3aGljaCB0aGUgY29kZSwNCm1vZGlmaWVkIGluIHRoaXMg
cGF0Y2gsIHdhcyB3cml0dGVuLg0KDQp+QW5kcmV3DQo=

