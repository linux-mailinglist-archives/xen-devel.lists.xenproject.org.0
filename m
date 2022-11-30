Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69E563D3A2
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 11:40:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449803.706761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0KVP-0007qR-Ig; Wed, 30 Nov 2022 10:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449803.706761; Wed, 30 Nov 2022 10:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0KVP-0007oY-Fg; Wed, 30 Nov 2022 10:39:55 +0000
Received: by outflank-mailman (input) for mailman id 449803;
 Wed, 30 Nov 2022 10:39:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvFK=36=citrix.com=prvs=3260afb21=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p0KVN-0007oR-P6
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 10:39:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 500e3c30-709b-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 11:39:49 +0100 (CET)
Received: from mail-mw2nam04lp2171.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Nov 2022 05:39:46 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5347.namprd03.prod.outlook.com (2603:10b6:a03:218::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 10:39:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 10:39:44 +0000
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
X-Inumbo-ID: 500e3c30-709b-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669804792;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=LW/gcqgvEAMtOnusw6tnumETsxIkCPFe7qKpDO8QD/Q=;
  b=gHJE2RcyNzzXX0Z5ML7B01JME3JPT1n2Pvr71NZWi3hguXAzVOWSVK9C
   lXUW4lmZMFmtTDSMXvjODTU00g6dpk0iA8yYY1kTQzGJdq83FnGmJl8Hf
   ZppigzM8NGA8KSCk5l3qbWiVMiqsoz5Wkkep0u1QPQoY8LvWL30hNdU7y
   c=;
X-IronPort-RemoteIP: 104.47.73.171
X-IronPort-MID: 84886035
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:w6UfMq8paxozra/FhnLTDrUDon+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mUeCG6EOq2LZzf0edp/b4SxoRsPsZaDy4I1HAtppHw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKsT5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkSr
 sIeDRtUSyrb3fCMka2YF+w1geMaeZyD0IM34hmMzBn/JNN+HdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTeIilUuidABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCN5CROPgraMCbFu7/U1JJ0A3CkSCvvTj1H6EVuBEC
 BQT5X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8/AKxFmUCCDlbZ7QOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRVLufgcBRAoBptz8+oc6i0qTSs45SfHsyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CBhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:dcUeK6vu/TKhXQk8Y+CUB9H97skCXoAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPqftXrdyRGVxeZZnMffKlzbamfDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjJzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeF+aP3CB+R2zYZSndqza05+W
 bIvgTl7uH72svLiyP05iv21dB7idHhwtxMCIiljdUUECzljkKFdZlsQLqLuREyuaWK5EwxmN
 fBjh88N4BY6m/XfEuyvRzxsjOQngoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPbi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZDIMu60vFjLA
 BdNrCa2B9kSyLdU5kfhBg3/DWYZAV2Iv5BeDlbhiXa6UkMoJkz9Tpk+CVWpAZ9yHt6cegF2w
 2MCNUXqFkFJPVmEp5VFaMPR9C6BXfKRg+JOGWOIU7/HKVCIH7VrYXriY9Frd1CVaZ4u6faoq
 6xJm9wpCo3YQbjGMeO1JpE/lTER3i8Ry3kzoVb64JisrPxSbL3OWnbIWpe2PeIsrEaGInWSv
 yzMJVZD7vqKnbvA59A20n7V4NJIXcTXcUJspIwWk6IoMjMNor239arOMr7Nf7oC3IpS2n/Cn
 wMUHz6I9hB9FmiXjvijB3YSxrWCzjCFFJLYd3nFsQoufsw39d3w3koYHyCl7G2ACwHtLAqd0
 1jJ76imr+npACNjBT101k=
X-IronPort-AV: E=Sophos;i="5.96,206,1665460800"; 
   d="scan'208";a="84886035"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GooTNwjJEZ1Wook78mEUHLRmuFMyubLYibmVYDEHs6yc7I0vck8vAEeQRUj4qW3apf0VrGVYY1RA5UHr4gEUbYxKmQH2N2O5NMyTBLqULH+gsjsnzZ2Te7yXRDB6ZiLj3JxP+2Qu2VBUkfeXM134Al/nAoQov8siUFNtVUNTbxyVsVYUR9Dz+Spo4hq8NgU8bEOSfJbP5wG5NWeEwXkrXuoZkLyXRUp/MG2zJgzHl+9BNspn9NIozJYINdBg7AeFq3FRq3sjSE08OyIMul6B66C1hnSHmef40HpKuBARq6L8nmf3yILOK4+Vl1cNCMpFYS2ujnVl8tmU0N/0oZJBIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LW/gcqgvEAMtOnusw6tnumETsxIkCPFe7qKpDO8QD/Q=;
 b=RA+5mlj+LpJltBS9mjZKk/koYOyPbDAl5ldz8m83bJetrvlNiR5bhThiXlLCvK9b+6s/Um2Mg3/nAOAYt+UlKsQh7akDYS388fCJaTy+Lo6CCCBmWL4w/SrHZ/OnxQVnNWMPg/11DdEINHI30Ifla6kNr9IUyQX18bTPlzqwpBW6EMMhLhD2I6XcoLuY5EGpKU4wT0ljjAVY6THtws/gw53dY8WgFX/MZww9zSfTN6OPOUwV2mkSL293KUyErKqNnZzCxSQhV6gh9piLYs156SFLZg6HIblIoVQq91rIWOiKuNsfymlCbikwcjGb0g5inJhMWgpU4Tvr0+sKt9MTlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LW/gcqgvEAMtOnusw6tnumETsxIkCPFe7qKpDO8QD/Q=;
 b=N2vUOz5PZHeT1cWjtfGQ1rQ0k95i65VBHnmIxJw0RIi9GsRxG11/KUIuwc5O6UaseEJuIA9a2erW+dsDO3X85tRE3Xj0AIPt3sHhfoXCDeGX//ib34NtNbYxJhJLV5O6RdzC9G2v5f5C4o56u9SsgpWt8ZVzbR0NT2HnLuIzQjc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/mm: PGC_page_table is used by shadow code only
Thread-Topic: [PATCH] x86/mm: PGC_page_table is used by shadow code only
Thread-Index: AQHZBAKvvRJ2heCKJ0SiESCucWQuIK5WYfSAgAC3SICAAC7bgA==
Date: Wed, 30 Nov 2022 10:39:43 +0000
Message-ID: <b033810b-2d17-43af-015f-4c03f48c15ce@citrix.com>
References: <df240766-7a57-d9ce-f0a9-697fc470e1f5@suse.com>
 <4fef5b0c-4463-cd6f-15fc-47268505517b@citrix.com>
 <96f6a943-0e1e-7399-fe83-56a550d47bf6@suse.com>
In-Reply-To: <96f6a943-0e1e-7399-fe83-56a550d47bf6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BY5PR03MB5347:EE_
x-ms-office365-filtering-correlation-id: a03c46d4-f274-4c25-5f4d-08dad2bf31a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Uw+SpsFOUZwSL/TbnO9lrkkjDYMgAk8h8jwgtjPeUinaFlxjFrevr+sYMKeXr+2ODjYFst/trV6vAlLfLWfUXuXjgp35uv7iOXGH+UBhvZ39oArrInMsR8PardZPvZA7yUOYkAUZv0RxRO/qgXW/2nWJCVqzjukFuNxKTswB69gLFZhZBWsb0sX5OaNpeIW5kCpnEAjsS9uXP5q9GNlf+jIJQQbA/Y43x7m3AqDbLnJXqXo/xmEwhoT7g63Hu/ZSw9yHIeVTNuBAa/iG0ET7eIw3+L98P6uSGnR5iZHdveh/CidKrQNaUXSFZCIlzqZRkp/0p5w1RZAfT4l8OpJWgOEvBu5YbwXpH6CW68stZttYqNSIsvYWEsep2LA8uCB2pGkxrMrvbQjU95PELo2AbxFSDjUFb83CLmVbRemnbH5eNM3T9Ki8YHMbN35SknKsMALCzS0woOrEKcjEUCGqRkgL/TLPKgSszlEHsOXT2u9KIkTl5x4vYPArXRtODSjIXghUohhfwTYuEV2orI4KEG/ZWGTYMmRzhVVtE01ZbsmpijYbuIhQE+1T6T3itYXvfNkfStNq/cYRV6QH2Ca+JPieFzMH7RzpJYsaF2JgwlxqyS67iy8BaNVDV4PpuunqHzOAf6JItl+z1YOqwfbyl38d/zkWZR+HhyOnMLS+wrNJVSgzcP74ykd32ZvYzu1JYFTq3TulNIMErJYdPS3czknW8GGz5h0OYt+w3V8FRrs+yzGLqCzr0as0HqRUfFweE1UNxis7moFLpumUYIJFOQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199015)(66899015)(8936002)(31686004)(41300700001)(36756003)(64756008)(8676002)(66476007)(66446008)(66946007)(91956017)(38100700002)(82960400001)(4326008)(316002)(76116006)(54906003)(6486002)(71200400001)(2906002)(478600001)(6916009)(66556008)(83380400001)(5660300002)(38070700005)(31696002)(53546011)(6506007)(86362001)(186003)(26005)(6512007)(2616005)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXkwNEozRkNYV0E5a0VtMStudXJBOUs0YWthSTBGcjFaeDFlOGdHdE4xcXZp?=
 =?utf-8?B?Nm9WL0dQcVpiUWxTZW9WbEJFa2RzdWpDY1VzWjhrY2VHQi9HNVNISW5HUk5y?=
 =?utf-8?B?SXNHZE5HSlh6MHlQRnJmdjVhb3dnVVQ2K1l0U1NHblQ1YVlZclBBdUdhOUls?=
 =?utf-8?B?ekhzMjJjL0o5MWNlSWVYbGx6c3dVS2c1alYwd1h3V0Y5eE5tU0txRHBFZnNP?=
 =?utf-8?B?Sm9qTzVkeUp5QXlydlJzazlNZC9DYmtJNFltRTlSdk5Qa3lsSWx6b2g3NHRD?=
 =?utf-8?B?em9TSGhnZ3lIK0srVEpDODlDbW5iajdPQnFVM1JnanIrVWtDUFZuWEdqWk8v?=
 =?utf-8?B?MTRlY2loWm83czlXVEw2M05WMjVWblJPM0MwenhFeGFlSFNNd3ZaWS9ETHVV?=
 =?utf-8?B?NUZwbnVHTTNMdEpUbCtMT1FxZDN4cGFZKytWalJwNnFhYzQ5b1cvblBGYWFL?=
 =?utf-8?B?TldpdVNUWENzUmZ4cVpzb0JIakNyczBKMlB4TytGS0VCNEwveDZsbjZ6bitM?=
 =?utf-8?B?VHBsbXpxNEpQOHVXSkEyRDhSTnhTMk15bXM0Qy8yc0RqSmlNOElPYS9pckNo?=
 =?utf-8?B?UFRFY1IyQjBxeEgrR1phT0xSWDhlekk3ZGNCVGVaaTgxSnhjd2tkZ2dwNEw2?=
 =?utf-8?B?QWw0aTllUzgrcDFReWsvVm0wSE81eWI5QVlZM0pQY0xwbWx3NEZESlljd085?=
 =?utf-8?B?VXVxaHhvQU1IQzhobC9OK1o4SmNtYzkxazE5RFhtMStCZldtT0wyZ2ZpZTEv?=
 =?utf-8?B?QUo1K25rZjBGTjNUZjRGOFZ1aCtBd3FsOEt6RW12NEdLMVRXWkhadmlxWGla?=
 =?utf-8?B?RHgxbXhyU3lFWUdOaDZoR0hPMDM1dUp0T0JlOWVMUnphZ0VmWnVqTXM2MWJ6?=
 =?utf-8?B?VzhBTTdOZ2FXdHlSVFJLaUF1eVRYUVJQNlc0Tm1ObVZtRjVjckh1TFdLb3lM?=
 =?utf-8?B?aFlXU2t3OFBHdFVBNGowTncrZDBqZG4vNnFXb1BaM3k3REY2emtIckt2VGhX?=
 =?utf-8?B?cmRmKzVaR0wvSi8zQXU3UXVaZmdENXlKb2RuVURqT1puTk0zamNJbW52ZGhl?=
 =?utf-8?B?dXdSWW9vRHhOUFRoWnRoTWM0OEFvVnRFM2xDekhMK0FKUmdFY2cvUXpJK1dO?=
 =?utf-8?B?dENHR1RScmxaZGRNZFVqZWpaVnFHU3QvbmdtRHV0ZDEzcTBSUm1WTHRWNDRZ?=
 =?utf-8?B?MmhXeHFtV3YzNXJmcURBWXU0OFBVM2duYTFqWWVYUXoxcGdNZGdJVUFLeC9o?=
 =?utf-8?B?eS8rcTc4SFlWMERHU3d3THdWbWQ4YjhxdEMreURsZURwei9HeHQzdnFCczBE?=
 =?utf-8?B?VnJJS1lNbzM0WGlVT2tMa3dLczVkM2dnZm9RMXREYVcvc2VDeDU1SjFRVnFp?=
 =?utf-8?B?NEJaTzZ1SFU4QitpKzY5Zys0QllzVGl5WDZLNnRabFNQSG1WcWJJdFVGZzFS?=
 =?utf-8?B?RFlUZVF0YXpVdE1kWE5Ta1ZIZ3hCaEhKNm5vSTRSV051R3V0KzYvZ0tvV3dL?=
 =?utf-8?B?b2JpN1ltT3l1T0R2VEV3LzB3b1l4RkdRSUpWUzE4dWp0ZVFwMTNWWnlCeVpo?=
 =?utf-8?B?dFJzMnBBSTZpREhWYzN3cUtmeENIQXRMY1RoUXhkN2E4MEI5b010cmcxbFlk?=
 =?utf-8?B?M2hWUFlYaGVHRkVDSCsrbk80a1IrTWRJTnhVMWM5czcvK0NZSW5JdGhHd1Z1?=
 =?utf-8?B?b2cvYndodnV5SUN6ZzVNUzBTR2pWMFU4UHJEckZmU2VFK0NxekgydGNJbG5k?=
 =?utf-8?B?OWQ1Q2Rwb3FJMXNra201bk9vL2ttTnhJaE1jZDgydC9wLzZTMmg3b3M4YlUz?=
 =?utf-8?B?cEFiSndjblRkUWgvMklPOU0vMFFLd29Jd1BsMUk3MjNhSEtKNUxXUkN1dlBQ?=
 =?utf-8?B?ZHY2VDhDam9kZUpzVmNjc2JVM2crZndlTEN2Y2JQckcxMWhQSWFLYmFIR3o1?=
 =?utf-8?B?aExjSGQ3cHpGSnBBM1Y1ZGhNY0NQTFlFVE1GZlFlSWpPZkRrRGxKZmVLb3Fv?=
 =?utf-8?B?N3JjNnlZQXc5dE9lNDY2UWZ2VmxzWmtlRVl1aWMyZnJ2Q1N5U0xIVlNRWUtT?=
 =?utf-8?B?NDAxTkU0TlZESytxVTR4MXpjYmZqWlRhMytMa2YrUHQvWDlvUFUxSVhmZHJT?=
 =?utf-8?B?WkVvY2dVUGFJQ1ZqUnk2enVQc0F2c3FST2xsZkx5S1VrclZ0Wk5tQnhnbmZk?=
 =?utf-8?B?Y0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68723E609C67DD499112DD390DFCD582@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	txlxjY51vClBv2IJxY4j+9hjtkXTzlgrwNk87MbIJ+lWhXG01KDQ/BaGLBZwdz0yCIa1CwOymg6hQZSNuGTmhK4RGryinIVHcd0wKN3Dzq6g5dt/Iynz5HhWH5kCK5VKHHuhzgCN6NvO8DNQAShmafaJO1ZnHeurCqWfg2SO7UD34JZidaVb3vJ7tARbPELoqOJB1nqB3VZhD6lZl5q4FGUkm7Xzl/4XDEz0bSUvGMG+1wV3u2TmSg61nM08yCcpbJG/4neL+OsAUwUloQWUDrkNU/ObL5Oti16mB/oeWCKKKudjF2DTWA8waChOFHxDFcFfgEc9ORuxIoIH/F29B/Y9durVfSSis7zng44+hzk3vuout/nuvTgweWMT2qDnJ9ldUc5M46UXOuHzjDXUvk/5Chc2BZosoVvo3YPsMaD2OwdOgbCyFZRoajAPRiGSHcGghafiDhAMnlpl9eg68LCwrJbNzLIgE+u7sdpnwIvwooAQTsHTY2u7ATgxkWi/32OHdhbTRqysSbiVparetbabwaPMpYAwXfL6/x904gqiKFXVuipNxF5NiqIQ2qG3gmAm6OYFERlOj+B2ZbCI6dIxdEk+TBIrfH+uZTbeUW54lzwapTJuT/mUB/lrIAJFU+0Sh3bi3pH3js2ygHkXvwAjzxPLoevIBJDd9TBzwh5V5fRPgEv0GIot5zKRhblaPBqMUkTsTp22hUfLgouLCsplRCGrofiuaLBVIyvX3VpFq77qG5CP7+d/wilrI+m0e/AxXlHWnnPZUSZzP4zlhbL6p99yP1Sv0D3z12oCFIyVobpuZ7tvozC6vH3q8K7MGUJBBEsPDCWVh5NsgdlrPw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03c46d4-f274-4c25-5f4d-08dad2bf31a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 10:39:43.9252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5pqlgAazEb7UnpA09xm2Bw7IZu5vweLmSCM8jc4xuFcHiwNKotdJmnC+EPRymKsFqSpghVknWbNro/SY994yu+D6BSFWkIZ454QPX4ogKog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5347

T24gMzAvMTEvMjAyMiAwNzo1MiwgSmFuIEJldWxpY2ggd3JvdGU6T24gMjkuMTEuMjAyMiAyMTo1
NiwgQW5kcmV3DQpDb29wZXIgd3JvdGU6DQo+PiBPbiAyOS8xMS8yMDIyIDE0OjU1LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBCeSBkZWZpbmluZyB0aGUgY29uc3RhbnQgdG8gemVybyB3aGVuICFT
SEFET1dfUEFHSU5HIHdlIGdpdmUgY29tcGlsZXJzDQo+Pj4gdGhlIGNoYW5jZSB0byBlbGltaW5h
dGUgYSBsaXR0bGUgbW9yZSBkZWFkIGNvZGUgZWxzZXdoZXJlIGluIHRoZSB0cmVlLg0KPj4+IFBs
dXMsIGFzIGEgbWlub3IgYmVuZWZpdCwgdGhlIGdlbmVyYWwgcmVmZXJlbmNlIGNvdW50IGNhbiBi
ZSBvbmUgYml0DQo+Pj4gd2lkZXIuIChUbyBzaW1wbGlmeSB0aGluZ3MsIGhhdmUgUEdDX3BhZ2Vf
dGFibGUgY2hhbmdlIHBsYWNlcyB3aXRoDQo+Pj4gUEdDX2V4dHJhLikNCj4+Pg0KPj4+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+IEFoZWFkIG9mIG1h
a2luZyB0aGlzIGNoYW5nZSwgY2FuIHdlIHBsZWFzZSByZW5hbWUgaXQgdG8gc29tZXRoaW5nIGxl
c3MNCj4+IGNvbmZ1c2luZywgYW5kIGZpeCBpdCdzIGNvbW1lbnQgd2hpY2ggaXMgd3JvbmcuDQo+
Pg0KPj4gUEdDX3NoYWRvd2VkX3B0IGlzIHRoZSBiZXN0IEkgY2FuIHRoaW5rIG9mLg0KPiBDYW4g
ZG8sIHN1cmUuDQo+DQo+Pj4gLS0tDQo+Pj4gdGJvb3QuYydzIHVwZGF0ZV9wYWdldGFibGVfbWFj
KCkgaXMgc3VzcGljaW91czogSXQgZWZmZWN0aXZlbHkgaXMgYQ0KPj4+IG5vLW9wIGV2ZW4gcHJp
b3IgdG8gdGhpcyBjaGFuZ2Ugd2hlbiAhU0hBRE9XX1BBR0lORywgd2hpY2ggY2FuJ3QgYmUNCj4+
PiBxdWl0ZSByaWdodC4gSWYgKGd1ZXN0KSBwYWdlIHRhYmxlcyBhcmUgcmVsZXZhbnQgdG8gaW5j
bHVkZSBpbiB0aGUNCj4+PiB2ZXJpZmljYXRpb24sIHNob3VsZG4ndCB0aGlzIGxvb2sgZm9yIFBH
VF9sPE4+X3BhZ2VfdGFibGUgYXMgd2VsbD8gSG93DQo+Pj4gdG8gZGVhbCB3aXRoIEhBUCBndWVz
dHMgdGhlcmUgaXMgZW50aXJlbHkgdW5jbGVhci4NCj4+IENvbnNpZGVyaW5nIHRoZSBjYWxsZXIs
IGl0IE1BQ3MgZXZlcnkgZG9taGVhcCBwYWdlIGZvciBkb21haW5zIHdpdGgNCj4+IENERl9zM19p
bnRlZ3JpdHkuDQo+Pg0KPj4gVGhlIHRib290IGxvZ2ljYWwgYWxzbyBibGluZGx5IGFzc3VtZXMg
dGhhdCBhbnkgbm9uLWlkbGUgZG9tYWluIGhhcyBhbg0KPj4gSW50ZWwgSU9NTVUgY29udGV4dCB3
aXRoIGl0LsKgIFRoaXMgb25seSBkb2Vzbid0ICh0cml2aWFsbHkpIGV4cG9zZQ0KPj4gYmVjYXVz
ZSBzdHJ1Y3QgZG9tYWluX2lvbW11IGlzIGVtYmVkZGVkIGluIHN0cnVjdCBkb21haW4gKHJhdGhl
ciB0aGFuDQo+PiBhbGxvY2F0ZWQgc2VwYXJhdGVseSksIGFuZCByZWFjaGluZyBpbnRvIHRoZSB3
cm9uZyBwYXJ0IG9mIHRoZSBhcmNoDQo+PiB1bmlvbiBpcyBvbmx5IG1pdGlnYXRlZCBieSB0aGUg
dGJvb3QgbG9naWMgbm90IGJlaW5nIGludm9rZWQgb24NCj4+IG5vbi1pbnRlbCBzeXN0ZW1zLsKg
IChBbHNvIHRoZSBpZGxlIGRvbWFpbiBjaGVjayBpcyB1c2VsZXNzLCBnaXZlbiB0aGF0DQo+PiBp
dCdzIGluIGEgZm9yX2VhY2hfZG9tYWluKCkgbG9vcCkuDQo+Pg0KPj4gSXQgZG9lcyBsb29rIGEg
bGl0dGxlIGxpa2UgdGhlIGNhbGxlciBpcyB3YW50aW5nIHRvIE1BQyBhbGwgWGVuIGRhdGENCj4+
IHRoYXQgZGVzY3JpYmVzIHRoZSBndWVzdCwgYnV0IGRvaW5nIHRoaXMgdW5pbGF0ZXJhbGx5IGZv
ciBhbGwgc2hhZG93ZWQNCj4+IGd1ZXN0cyBzZWVtcyB3cm9uZyBiZXNpZGUgdGhlIHBlci1kb21h
aW4gczNfaW50ZWdyaXR5IHNldHRpbmcuDQo+IFF1ZXN0aW9uIGlzIC0gZG8gd2UgY2FyZSBhYm91
dCBhZGRyZXNzaW5nIHRoaXMgKHdoZW4sIGFzIHNhaWQsIGl0J3MNCj4gdW5jbGVhciBob3cgdG8g
ZGVhbCB3aXRoIEhBUCBkb21haW5zOyBtYXliZSB0aGVpciBhY3RpdmVseSB1c2VkIHAybQ0KPiBw
YWdlcyB3b3VsZCBuZWVkIGluY2x1ZGluZyBpbnN0ZWFkKT8gT3Igc2hvdWxkIHdlIHJhdGhlciBj
b25zaWRlcg0KPiByaXBwaW5nIG91dCB0Ym9vdCBzdXBwb3J0Pw0KDQpIYXZpbmcgY29udGVtcGxh
dGVkIHRoaXMgYSBiaXQgbG9uZ2VyLi4uDQoNClRoZSBwcmluY2lwbGUgb2YgTUFDLWluZyBwYWdl
dGFibGVzIGlzIGluY29tcGF0aWJsZSB3aXRoIEEvRCB1cGRhdGVzLsKgDQpJT01NVXMgaGF2ZSBB
L0Qgc3VwcG9ydCBzdXBwb3J0IHRoZXNlIGRheXMsIGFuZCBvbGRlciBJbnRlbCBDUFVzIGhhdmUN
CmVycmF0YSB3aGVyZSB0aGV5IGNhbiBzZXQgdGhlIEQgYml0IG9uIGEgcmVhZC1vbmx5IG1hcHBp
bmcuwqAgVGhlIHRoaW5ncw0Kd2hpY2ggYXJlIE1BQ2VkIGNhbiBsZWdhbGx5IGJlIGNoYW5nZWQg
YnkgaGFyZHdhcmUgYWZ0ZXIgdGhlIE1BQyBpcyB0YWtlbi4NCg0KVGhlIGN1cnJlbnQgbG9naWMg
aXMgY2xlYXJseSBub3QgZG9pbmcgc2Vuc2libGUgdGhpbmdzLsKgIEl0IGxpa2VseQ0KcHJlZGF0
ZXMgSEFQIHN1cHBvcnQsIGJ1dCBJIGhhdmVuJ3QgZ29uZSBsb29raW5nLg0KDQpBbHNvLCB0Ym9v
dCBpc24ndCBsb25nIGZvciB0aGlzIHdvcmxkLsKgIFRyZW5jaGJvb3QgaXMgcHJvZ3Jlc3NpbmcN
CihzbG93bHkpIGJ1dCB0aGUgZW5kIHJlc3VsdCB3aWxsIGJlIHNvbWV0aGluZyB0aGF0IGZ1bmN0
aW9ucywgaXMNCnN1cHBvcnRlZCwgYW5kIGRvZXNuJ3Qgc3VmZmVyIGZyb20gc2V2ZXJhbCBDVkVz
IHdoaWNoIEludGVsIGhhdmUgZWxlY3RlZA0Kbm90IHRvIGZpeCBpbiB0aGVpciAicmVmZXJlbmNl
IFRYVCBpbXBsZW1lbnRhdGlvbiIuDQoNCkkndmUgZGViYXRlZCBzZXZlcmFsIHRpbWVzIGFib3V0
IHJlbW92aW5nIHRoZSB0Ym9vdCBpbXBsZW1lbnRhdGlvbiwgYnV0DQpoYXZlIGNob3NlbiBub3Qg
dG8gZG8gc28gdGh1cyBmYXIgYmVjYXVzZSB0aGVyZSdzIGFsbW9zdCBjZXJ0YWlubHkgYml0cw0K
b2YgaW5mcmFzdHJ1Y3R1cmUgdGhhdCB0cmVuY2hib290IHdpbGwgd2FudCB0byByZXVzZS4NCg0K
QnV0IGFzIGZhciBhcyB0aGlzIGdvZXMsIEkgdGhpbmsgd2UgY2FuIHJlYXNvbmFibHkgcmVtb3Zl
IHRoZQ0KY2xlYXJseS1qdW5rIGFzcGVjdHMgd2hpbGUgY2xlYW5pbmcgdXAgLyBmaXhpbmcgb3Ro
ZXIgYXJlYXMgb2YgWGVuLg0KDQp+QW5kcmV3DQo=

