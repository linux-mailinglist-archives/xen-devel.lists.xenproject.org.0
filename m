Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F12405FA32B
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 20:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419306.664081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohxCZ-0006Ji-Iq; Mon, 10 Oct 2022 18:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419306.664081; Mon, 10 Oct 2022 18:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohxCZ-0006Hv-G2; Mon, 10 Oct 2022 18:08:31 +0000
Received: by outflank-mailman (input) for mailman id 419306;
 Mon, 10 Oct 2022 18:08:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ILM/=2L=citrix.com=prvs=2752edee2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ohxCX-0006Hp-Od
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 18:08:30 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88ae3b86-48c6-11ed-8fd0-01056ac49cbb;
 Mon, 10 Oct 2022 20:08:28 +0200 (CEST)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Oct 2022 14:08:13 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5933.namprd03.prod.outlook.com (2603:10b6:a03:2d5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 18:08:09 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 18:08:09 +0000
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
X-Inumbo-ID: 88ae3b86-48c6-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665425307;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PnZoCexthh/EXunivWF7KSnsSKgHi7Gq9hM7Q3WRMC8=;
  b=N/x0t0e5yNirVtofB3QrHlONTgC89sDGtoQPjlVgs5LiSGhLXdJ+kHed
   UJwrF58eP+xpneeYArYcvebNosF8q7GHQoE4nQG682URs+dZazjp0JiKt
   i8WNFLCGv6eneHDYtaEVL2Feq3snZ2/3fZEyLSSl2x2fzJmfUAUVZajFB
   k=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 84925573
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:j6SxlKC33X/cNhVW/xriw5YqxClBgxIJ4kV8jS/XYbTApGt01TBWm
 jYYWz+FPvrfYWr8ft51Odnn9kMD65WGyNIxQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8pWo4ow/jb8kk25K2q4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2k7DZM32OFzLF1cq
 /ApLis3bAGxtem5lefTpulE3qzPLeHNFaZG4DRF8mucCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWMG7g7FzUY0yzG7IAhZ+b7hKtfKPPeNQt1YhB2wr
 WPa5WXpRBodMbRzzBLVriP227KQxksXXqoJT5+Fz8dhg2aT/Ug/JBM6c1mQr+uA3xvWt9V3b
 hZ8FjAVhao4+VGvT9L9dwalu3PCtRkZM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDht8ztLSxitvuSU3313peZqymjfxccK2AqbDUBCwAC5rHeTJobixvOSpNmD/Szh9isQzXom
 WjW/G45mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 RDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:JDptpqMlAIYJRcBcT2L155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUiSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yvT9aw+cyTpAVr4RHoFqjwpF5N1HL2xa1+
 Ukli1QffibLUmhOF1d7yGdgjUImwxelkMKgWXo/UcL5/aJCg7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KcuZlFkIPwjgYVq3Poi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwM/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiItiYfzQTOaNSSj5uw5zvmWehTNYd3E8LAv27Fp/rvhWbHsLSqPDFgzjsrImYRsPvHm
X-IronPort-AV: E=Sophos;i="5.95,173,1661832000"; 
   d="scan'208";a="84925573"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZ/8ONue2NH2c7wmoRYCoPyGStpJbmoCrNgTc3mHHpM6KHFUiog0lPtp0sDk/k1VrNLUXCsvMDkfpRQkBy4XXxsLBBhtcosjyePefPG+RRrZsXXpgDmwX1zq3g6RIqVVjUJJ7LbVUQVAv3FaN8JTl7vge4qp/OmgsQdZHaRLHGxCT9ETd5O5AhxMAWnpKVgtcxql42J1JLAWV3y5VZB5g6WmCenAi3Gm80scx8mDBQmSYEvNOnxLQHSQ9UXpgRnahcj2DA8k/TEFiicjOS+LQJrb3vWIGP6voHvZ54cyEs9cDmLuAGZriUTjgiKM7Gf5ZyNWvy6x74ywY9MS+HO36Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnZoCexthh/EXunivWF7KSnsSKgHi7Gq9hM7Q3WRMC8=;
 b=PHA3JzhDzf7HwGaACHEhm3g54FKAoeEVKQZ3YF1hNvkP3rvU3+c19DSmT/XQI93qOo3+/42Ct5jSAGkZwFsZm3RYCy4PYGk/+wteQMHcBziywFO8cFDofz5yvYi79iM0XB+W9zRmV6RR2WrI+gm9tJOdtFw1WUd/7FZ1lRqgR1ynkCPb+El6XxxZlCNhdKBnbMtiXqpF8aX43Uc4upoI6PmYZsOTOT1iB3G2Qu/Q9udgMk0bHyn0zsUSwa9LHXCA2wYhn2G2e+TAplUz5neqlxM0yVgn0MZ3HEKULqsZeB5JCkhg01f7T+ONw/+hXWQ1WK6rkXr1EWTZyao3+ijM4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnZoCexthh/EXunivWF7KSnsSKgHi7Gq9hM7Q3WRMC8=;
 b=Ghc4z3IXMfcXu0UfifsAYwz/um0lojUJk6Q2XY0ipxgMoEf6gO9N37PugGJredCsVwpIzRuutOv3eNDZxFuX521TJiNxTmbg/bms8piP9+u6GVkfZbIZHeHqQKVpCk/CKFXDid6u22WJ5oS8vd/CsG2I4DvC78aLMrg1OuhpLeQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [PATCH 2/2][4.17] x86emul: pull permission check ahead for REP
 INS/OUTS
Thread-Topic: [PATCH 2/2][4.17] x86emul: pull permission check ahead for REP
 INS/OUTS
Thread-Index: AQHY2YU75mqlIJYsj0WxLAJHeHNvXK4H83eA
Date: Mon, 10 Oct 2022 18:08:09 +0000
Message-ID: <2dc898c0-b42a-28d7-7126-9379f03119f3@citrix.com>
References: <4ca86bb6-ca6e-0c6f-448a-55fb73a3c02a@suse.com>
 <4d01771c-fd02-b607-c480-04bcb11fa7b3@suse.com>
In-Reply-To: <4d01771c-fd02-b607-c480-04bcb11fa7b3@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5933:EE_
x-ms-office365-filtering-correlation-id: 80fd0a94-3f14-4f73-27f4-08daaaea6391
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Y8UNt3BEpsD8qWlgk9z396CZUW8YnzPqWPUlUaBBZnDAlLSW6T+t366uBDrOq0p/oRDFkvV34cU9lTULP4qQni6YRnmk16QyzDTH8u7uYuzA7CJ5Dc1OzPnVQMz3FyUcOSWS8uTJP2rYEcoCKlsqCN4e3Cab1kVEYz0gEOfOdi1PehhqMLPjE6aXreKaKZ5iSXbrW5peA0m06RilvaqjZjJwnkrT28+pfWOC7n3Ku3BfidT7CVgz8oeyOnKugK+3peKkdFAe5TZcexI5BCTuXQVCgZuSaIsa6NJmFU5Isrp/DbYXSNy3DwGqEt7cTqr6c22coTgAF7Hu0tdPdP+AhasNv1pDKBwpSfR98/5LmRGrnBdIPr7d0yyNqKmzUQ5PPAKupFvJizoZ594zabwbZ8Lrtod1x/9HZ8WLx8frflmgixA29OK/SvdoSL05TQ1ZfjWVxuRWP3D60FJjTIrIJ7V0a7b0pSXK8I6rVJA33FGRCIfBCb9lMjFf581+LVPlcEKJF+knE8IZsL/T+DiRVFvuvRJBEvfD2fzbfwdsrAp36BAxAV2EfTFH+HAn7kT1ZoM3OhOMT19HMdTGTTo8xU2Mb50SKZ4ls1f9zUQd6IccFTsqLTaVo5P8RkPdgCiuFy4/tKBh5Y3jY15x27tz2Bb09qvUOww/J4Kd1GhzkzjqvjKSE9MWTOZ2gSq5lXmbiSTnjIWTKgOlNxdLgJthjinPqQFOr1t5v3pfM/oUDrFshkbZTc9obJsRwhAQAfR0wHfQTSmcyd4HSPA09IpUZV7ycvzAQ7U+6/DA74Vz4LVFjWV5YapUztPxBafq7qtPPxmAjHLQ9vQSaBkAUVJktg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199015)(6506007)(36756003)(53546011)(2616005)(26005)(316002)(6512007)(38100700002)(8936002)(71200400001)(82960400001)(41300700001)(31696002)(86362001)(76116006)(91956017)(66476007)(64756008)(66556008)(122000001)(4326008)(54906003)(66946007)(66446008)(5660300002)(6486002)(478600001)(8676002)(110136005)(38070700005)(31686004)(83380400001)(2906002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eHZxYVVaZ0Jia21YRVNsb012LzhXck80MUJDNzRYRHZUdndvWEdVMVcyNUdi?=
 =?utf-8?B?VzlCZW9Nb1JIaythbzhyR1YvQ3Z1eThEeGtXOHE3YlViUlQvYWQ2UVhJZ1c1?=
 =?utf-8?B?YTljMTJsN0NMS1BWTjJrTWZVNnpNWmI5OGJjeDNzalNEckZYRE5Fd0J2RlFh?=
 =?utf-8?B?eTlTaytneW10Q3k1Z2dEUGYrQkJFcUprc1JKcFlPbXNNeWVnSzliOUJZU2pK?=
 =?utf-8?B?cXdIRWVMZ0JpZ3NFY0w1K2tFVUN1cmxpVGZkTnE0ZUlWSGNkY1NZL2pSa1d2?=
 =?utf-8?B?UDhVY29sMlZHVWZDcllGWTB3OEVpN2lGUjZKOUFTQ1QrUEJ2aGUrNHJONTV4?=
 =?utf-8?B?eGxRdUNyNE9ZM1hrd1dlQ2JOcU5MMVk2NERCeXdSY1N1M3NkYUJYWlorQzJR?=
 =?utf-8?B?NTQ1ZUd6UzRMOFk4UjJ1TStZcDBzRmJCSEczdk1BQk5PZkVjVGZMS0hVYVQ2?=
 =?utf-8?B?VE1NRjVKYVJpLzJ0aTRzRU1rTmxtYzlyZUFyTHFCRUhoNW1xVk0zc3ZMdTJH?=
 =?utf-8?B?UktNbVlNUWdRVVlZVnhMbGlFQU5MVi84aUhGZ3RCdE1vNTJzclpZZ3hnbU1U?=
 =?utf-8?B?VW5Za1NxV0lSOUM5NldJZ0gvbjRETDRVb3JabHBEZjV4Zk8wODlMbGIrVnBj?=
 =?utf-8?B?d0UzYmk2QXZrc2VkUytmbm9BbnlmS251eURUb1M2VFZ0cDlDQ241b2l3TU5J?=
 =?utf-8?B?a1pRSG9VQjZYbDJQUmNnNWpjbm5jU01jMlZSVnAraXdKK3hVd1kwbzdGMkU3?=
 =?utf-8?B?dVNLQ0t0R0lSL0VlaWNIeW1BYlZqTTVBQUFqV1FZSzVETmpkQnhPN0JDSzMz?=
 =?utf-8?B?bW80QlAwcE5CS2FwMUcrL3hIaDhYN0xUaUMzcndacDhQbHhPWm52UllXSklR?=
 =?utf-8?B?eEt3ME9kL3M0REtBbEsySnMvSEJlR1dOVituL3ZFU3RVWlRLaWhoZitwRmEw?=
 =?utf-8?B?NU40aENVdlhVVmxzOXRCU3JmR2ZjTWhqRDhrZ2pCZGkzTnhnR2lFYVUyOHd2?=
 =?utf-8?B?ZG1PZTdVK2pwdzVyckhkTWhIdlNRZCtybFJiTmEyTnlMd3FTQ1ZPc0F0djFk?=
 =?utf-8?B?bWdPejhHaTVjVWtpV1hHeHkzSk1RNW80M2FTV1pDd1RmQURHeUhpaVdXWDN4?=
 =?utf-8?B?OHRlRUdrT3ZSazVhQmhGQ0NhQ090V095c0hYc2RPaFE2T05FV1JtclpjZjVp?=
 =?utf-8?B?ci9FT0lNOHdLTWRpWGhQWDdVUERad2dYeTVLWjkrajltTXBvdHlKOGRnVVFM?=
 =?utf-8?B?S2cramwrOGs5RXgzZzR2ck5iM3VnblNkK21sa3JUTUF5Z1c4LzZuL2FlNW9X?=
 =?utf-8?B?R2N4RXdTZHZmTlVCeXJWMVZVTHZWT0ZES3U5ZlVvaCtoeCt2d01Qc3AyMEFl?=
 =?utf-8?B?NEFhcHZtMnk5eGowY3BMeXI0ZG03VkU0dGZrc3YvSEM3N3hjVndxQzNvM0FC?=
 =?utf-8?B?aUc4VG5uV0g3VU9BcGpsanBlcWQrZUg1NkQxckVmaVFKV1dBdkg2Sy9xWGxi?=
 =?utf-8?B?T2JaY3NaMGZwbFFONHNTdzdabnVGdGRud24rbnJvYTNBRFhZdXBiRlJ3cGxL?=
 =?utf-8?B?TXpxTXVpcjJ1bG01UmpWQzYrRUZKVFZnWXRHUjR4b0dJazRDbkl0M0tOK0dy?=
 =?utf-8?B?WTgrTitmVHpYaXZ2OWtvN2FWTDl5anVvTGtDQWVmYTlmekVlay9iZnMya0pT?=
 =?utf-8?B?bmpYeDI1bWxBbHZ3MjZmYnp6T3VVU3EvTm1pTUd4Q21rWFVWSCtuQ1hleDRL?=
 =?utf-8?B?MEI0aEs0U2NJMFpQMjJRakh5eWtXaXMxMFEwNHlySXRFdGZwQ2FhMlZpSE9V?=
 =?utf-8?B?ZTY3aGxvZk5meU1RanUrVVBsZ0RFR09BRERWZVpVSUxCVUt0SWY1Y3hKWHpJ?=
 =?utf-8?B?dUNINkFQZVhLSXhjWTZzQS9iakhrUUNqeXBrLzF5SW9HbmVjZjRJNitiQlAx?=
 =?utf-8?B?VDZuNlBRSzJNYnFtWEdDVTk1dFBYQnVGYXdTS2tZNnBpOUt6eDVXUnVyMGdJ?=
 =?utf-8?B?d0tpdVVEUjdiSms4MlduSGt3enlDbDhNSVo4OXJBYWRPM1pkNEw4dTRQR1g5?=
 =?utf-8?B?dVRJdTRKNzcxOVU5K01BYVBTZHhhNGhkZFZOZUVQaXp6NzJEOE9uSDJFeUhv?=
 =?utf-8?Q?ptiyRstG8tKB7QGbxES9VZrMs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C7D3BF5F10764439C740B59A1BB05BD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80fd0a94-3f14-4f73-27f4-08daaaea6391
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2022 18:08:09.5560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W+uAo5p+R+7DFzb/Jv44GVWtBpE9PAb6BmJmX9QPc3YsBSf4gXosFujxTjkWSIkxLwYwTQSZ4rj+iMjod48q2V+oSGkkT5IgWv1/eQnsnp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5933

T24gMDYvMTAvMjAyMiAxNDoxMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEJhc2VkIG9uIG9ic2Vy
dmF0aW9ucyBvbiBhIGZhaXIgcmFuZ2Ugb2YgaGFyZHdhcmUgZnJvbSBib3RoIHByaW1hcnkNCj4g
dmVuZG9ycyBldmVuIHplcm8taXRlcmF0aW9uLWNvdW50IGluc3RhbmNlcyBvZiB0aGVzZSBpbnNu
cyBwZXJmb3JtIHRoZQ0KPiBwb3J0IHJlbGF0ZWQgcGVybWlzc2lvbiBjaGVja2luZyBmaXJzdC4N
Cj4NCj4gRml4ZXM6IGZlMzAwNjAwNDY0YyAoIng4NjogRml4IGVtdWxhdGlvbiBvZiBSRVAgcHJl
Zml4IikNCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0K
PiAtLS0NCj4gUGFydGx5IFJGQyBmb3IgdGhpcyBub3QgYmVpbmcgZG9jdW1lbnRlZCBhbnl3aGVy
ZTsgaW5xdWlyeSBwZW5kaW5nLg0KDQpJbnRlbCBkbyBhY3R1YWxseSBkb2N1bWVudCB0aGlzIGlu
IHR3byByb3VuZGFib3V0IHdheXMuDQoNCjEpIFRoZSBvcmRlciBvZiBjaGVja3MgaW4gdGhlIHBz
ZXVkb2NvZGUuwqAgTXVsdGlwbGUgdGltZXMgaW4gdGhlIHBhc3QsDQpJbnRlbCBoYXZlIHNhaWQg
dGhhdCB0aGUgb3JkZXIgb2YgY2hlY2tzIGluIHBzZXVkb2NvZGUgaXMgYXV0aG9yaXRhdGl2ZS4N
Cg0KMikgVGhpcyBwYXJhZ3JhcGggSSd2ZSBqdXN0IGZvdW5kIGF0IHRoZSBlbmQgb2YgdGhlIElO
UyBkZXNjcmlwdGlvbi4NCg0KIlRoZXNlIGluc3RydWN0aW9ucyBtYXkgcmVhZCBmcm9tIHRoZSBJ
L08gcG9ydCB3aXRob3V0IHdyaXRpbmcgdG8gdGhlDQptZW1vcnkgbG9jYXRpb24gaWYgYW4gZXhj
ZXB0aW9uIG9yIFZNIGV4aXQgb2NjdXJzIGR1ZSB0byB0aGUgd3JpdGUgKGUuZy4NCiNQRikuIElm
IHRoaXMgd291bGQgYmUgcHJvYmxlbWF0aWMsIGZvciBleGFtcGxlIGJlY2F1c2UgdGhlIEkvTyBw
b3J0DQpyZWFkIGhhcyBzaWRlLWVmZmVjdHMsIHNvZnR3YXJlIHNob3VsZCBlbnN1cmUgdGhlIHdy
aXRlIHRvIHRoZSBtZW1vcnkNCmxvY2F0aW9uIGRvZXMgbm90IGNhdXNlIGFuIGV4Y2VwdGlvbiBv
ciBWTSBleGl0LiINCg0KVGhpcyBtYWtlcyBpdCBjbGVhciB0aGF0IHRoZSBJTyBwb3J0IGlzIHJl
YWQgYmVmb3JlIHRoZSBtZW1vcnkgb3BlcmFuZA0KaXMgaW50ZXJwcmV0ZWQuwqAgKEFzIGEgdGFu
Z2VudCwgd2hpbGUgdGhlIFNETSBzdGF0ZW1lbnQgaXMgYWxsIHRydWUsDQppdCdzIGVudGlyZWx5
IHVzZWxlc3MgYWR2aWNlIGZvciBlLmcuIGEgbWlncmF0aW5nIFZNLikNCg0KDQpSZXZpZXdlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4sIHByZWZlcmFibHkg
d2l0aA0Kc29tZSBvZiBeIGRpc2N1c3NlZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNCj4NCj4g
VGhlIHJlZmVyZW5jZWQgY29tbWl0IGlzIHN0aWxsIG5vdCByZWFsbHkgdGhlIG9uZSwgYnV0IGJl
Zm9yZSBpdCBSRVANCj4gaGFuZGxpbmcgd2FzIHNvIGJyb2tlbiB0aGF0IEkgZGlkbid0IHdhbnQg
dG8gZ28gaHVudCBmdXJ0aGVyLg0KPg0KPiAtLS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUv
eDg2X2VtdWxhdGUuYw0KPiArKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxh
dGUuYw0KPiBAQCAtNDI0OCwxNCArNDI0OCwxNSBAQCB4ODZfZW11bGF0ZSgNCj4gICAgICAgICAg
Z290byBpbXVsOw0KPiAgDQo+ICAgICAgY2FzZSAweDZjIC4uLiAweDZkOiAvKiBpbnMgJWR4LCVl
czolZWRpICovIHsNCj4gLSAgICAgICAgdW5zaWduZWQgbG9uZyBucl9yZXBzID0gZ2V0X3JlcF9w
cmVmaXgoZmFsc2UsIGZhbHNlKTsNCj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBucl9yZXBzOw0K
PiAgICAgICAgICB1bnNpZ25lZCBpbnQgcG9ydCA9IF9yZWdzLmR4Ow0KPiAgDQo+ICAgICAgICAg
IGRzdC5ieXRlcyA9ICEoYiAmIDEpID8gMSA6IChvcF9ieXRlcyA9PSA4KSA/IDQgOiBvcF9ieXRl
czsNCj4gLSAgICAgICAgZHN0Lm1lbS5zZWcgPSB4ODZfc2VnX2VzOw0KPiAtICAgICAgICBkc3Qu
bWVtLm9mZiA9IHRydW5jYXRlX2VhX2FuZF9yZXBzKF9yZWdzLnIoZGkpLCBucl9yZXBzLCBkc3Qu
Ynl0ZXMpOw0KPiAgICAgICAgICBpZiAoIChyYyA9IGlvcG9ydF9hY2Nlc3NfY2hlY2socG9ydCwg
ZHN0LmJ5dGVzLCBjdHh0LCBvcHMpKSAhPSAwICkNCj4gICAgICAgICAgICAgIGdvdG8gZG9uZTsN
Cj4gKyAgICAgICAgbnJfcmVwcyA9IGdldF9yZXBfcHJlZml4KGZhbHNlLCBmYWxzZSk7DQo+ICsg
ICAgICAgIGRzdC5tZW0ub2ZmID0gdHJ1bmNhdGVfZWFfYW5kX3JlcHMoX3JlZ3MucihkaSksIG5y
X3JlcHMsIGRzdC5ieXRlcyk7DQo+ICsgICAgICAgIGRzdC5tZW0uc2VnID0geDg2X3NlZ19lczsN
Cg0KQXMgYSBmdXJ0aGVyIG9ic2VydmF0aW9uLCBib3RoIHRoZSBJbnRlbCBhbmQgQU1EIG1hbnVh
bHMgZWx1ZGUgdG8gdGhlDQp1c2Ugb2YgdW5zZWdtZW50ZWQgbWVtb3J5IHNwYWNlIGZvciB0aGUg
NjRiaXQgZm9ybXMgb2YgdGhlc2UuDQoNCkhvd2V2ZXIsIGFzIGJvdGggJWRzIChvdXRzKSBhbmQg
JWVzIChpbnMpIGlnbm9yZSB0aGVpciBiYXNlcyBpbiA2NGJpdA0KbW9kZSwgSSBjYW4ndCB0aGlu
ayBvZiBhbnkgcHJhY3RpY2FsIGNvbnNlcXVlbmNlcyBvZiBjb25kaXRpb25hbGx5IG5vdA0KdXNp
bmcgeDg2X3NlZ19ub25lIGhlcmUuDQoNCn5BbmRyZXcNCg==

