Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B833B58C5F8
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 11:59:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382328.617243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKzXl-0004Bv-5i; Mon, 08 Aug 2022 09:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382328.617243; Mon, 08 Aug 2022 09:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKzXl-00049j-2Q; Mon, 08 Aug 2022 09:59:29 +0000
Received: by outflank-mailman (input) for mailman id 382328;
 Mon, 08 Aug 2022 09:59:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OsbD=YM=citrix.com=prvs=2126415cc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oKzXk-00049d-9l
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 09:59:28 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c872a6b4-1700-11ed-bd2e-47488cf2e6aa;
 Mon, 08 Aug 2022 11:59:26 +0200 (CEST)
Received: from mail-mw2nam04lp2175.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Aug 2022 05:59:23 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6096.namprd03.prod.outlook.com (2603:10b6:5:397::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 09:59:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 09:59:14 +0000
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
X-Inumbo-ID: c872a6b4-1700-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659952766;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4KdswnCGNoBj46tV+m2UQug6LHCAU7u2DJfoAWjJgcs=;
  b=B02fizQibNs3niJBc8zM+ia67QzdMAbarpLHARcC1DYirAeg5gZwyqG5
   kjpmKM+PAKvYCkqnRvG9q8NYLH2zoa+vsniYxQhJMTjXnL57EFPnmkidE
   8s2r2m7XwJ34QtawNNgd0SXQfOC1m3gVMCfQqeXR5J9ypWVqAlM1E9Wxa
   s=;
X-IronPort-RemoteIP: 104.47.73.175
X-IronPort-MID: 77587349
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YDNWy65s5iyyPnrcWe4TLAxRtCfGchMFZxGqfqrLsTDasY5as4F+v
 mYfDG+EaPreN2XzeNkia4qx9ExX6p7RztRrTwc9+ywyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ks/5KSq4Vv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJF4oG7Ea5blIPTpp6
 /UxJzkvSD/bvf3jldpXSsE07igiBO/CGdtD/1Rfl3TeB/tgRo3fSaLX49MexC03ms1FAffZY
 YwedCZraxPDJRZIPz/7CrpnxLvu2ia5LGYe8Q3IzUY0yzG7IAhZ+b7hKtfKPPeNQt1YhB2wr
 WPa5WXpRBodMbRzzBLarS/82bSTzEsXXqojDZeJ/fxroWaR5TE4GQArawuwnsmQ3xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xCmEaQxZbZdchtctwQiYlv
 neWm/v5CDopt6eaIU9x7Z+RpDK2fC0Kd2kLYHdYSRNfuoa+5oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr/hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:1DJELq+unAi9xAoUGfRuk+F7db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1YjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3XRY0eTFcdcso+5zXUISdKUmRIXeR
 730lAd1vFImjHsl6eO0F3QMkfboW8TAjTZuCKlaDPY0LDErXQBeoR8bMtiA2XkAwBLhqAC7I
 tbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0XbWIyUs4nkWUkxjIiLL4QWCbhrIw3Gu
 hnC8/RoP5QbFOBdnjc+m1i2salUHg/FgqPBhFqgL3f7xFG2HRii0cIzs0WmXkNsJo7Vplf/u
 zBdqBljqtHQMMaZb90QO0BXcy0AGrQRg+kChPbHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33I
 /MVVtJ3FRCD34Gyff+qaGj3iq9MFlVBw6du/22z6IJyYHUVf7sLTCJTkwono+pv+gfa/erKc
 qOBA==
X-IronPort-AV: E=Sophos;i="5.93,222,1654574400"; 
   d="scan'208";a="77587349"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJVWnVt96AYlPRV1GZ96M5fcEUkvl4JCD3jkZffuWXvoUZwsQo4sAdVzF3aY2E/AeyNMFOxLoQ7MXVm2ZW9gsZIZEeyxkSB53JYPcE3wTfK3KQUB1ofPDwL4oYytugd6osjP+3tMEsrpDMJC8gyVKB4vhVoll3Jxr9NLuKJ5gN0gFHg9vQWSNgfFb6A8g4S8BWwSPdyRsdMwq+LfuWFo1xHEgV6syoCa/sV5rOoc+DmXGKskJupQjzdu0+el3AwzYd1uPD20nqBwJnbnlgFgwiNepdfqzboYCgvggJ9EdUctRVRAX1+7PXVkJDmHPQTAp8PtWncSA3KPDUSzorre3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KdswnCGNoBj46tV+m2UQug6LHCAU7u2DJfoAWjJgcs=;
 b=PcnCDz2+m94he09xCcvGCtC0mAUN5aUJlCirE9KKqYVcL93zP8KnOD1zPQMFDhJyySas41fQBOXhsjnYg3zJLW8jI5wpJHgSY1l3LQ1uJ8NY+yVFVMLc0Eztrvx1dSS2twKAvEYW8LwNUn8l0db40jHgKfjYu8Eext9F1KWtRJN9ZdGxaCiR3gQlkaNftfAzNXSdT6R4L8ONv2SWh6FWrcfpSlgWUESXS3eNZ33OsoLk1JdfUs98NggCGDAnGHs9TUNrH+CFHH6zdhqLj65k7+205qHab5BmusrMmuYBO3scXEXSCjYuKnW0IG9LpkGhTD3ZzS8yGkkjDSjvsasASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KdswnCGNoBj46tV+m2UQug6LHCAU7u2DJfoAWjJgcs=;
 b=IiPoe28Nqwez7BxiiODajmdMX1Cal6TFjGXqmt3HTDh1SxWWprcWsGgP5n5Gig9T4NEjn07K+3BB27Dkni0pFxCdz/cGU3svT9vSLMJf5t2RrIoGxKLIkGFUl+61J1XuYlh8eNteqHF50nGRXYZteKjv4lUGXxQlmvjo0m4ZCaM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v1 7/7] tools/ocaml/libs/eventchn: do not leak event
 channels and OCaml 5.0 compat
Thread-Topic: [PATCH v1 7/7] tools/ocaml/libs/eventchn: do not leak event
 channels and OCaml 5.0 compat
Thread-Index: AQHYo3Q7g2T4T7O1X0OIdhve1Wb7Ta2gpUyAgAQVkQCAABlAgA==
Date: Mon, 8 Aug 2022 09:59:14 +0000
Message-ID: <c3d04d8b-6c84-e2f2-1d1f-cefc7121597c@citrix.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
 <6e5fd9edfea379b69682fa538141298fc1bc3110.1659116941.git.edvin.torok@citrix.com>
 <cb9b9589-0d0d-d644-385a-eedcdb90f733@citrix.com>
 <404E8D81-3409-41FA-8DBE-3D4136D3938E@citrix.com>
In-Reply-To: <404E8D81-3409-41FA-8DBE-3D4136D3938E@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86818ee3-4b0c-4ce7-51a3-08da7924a688
x-ms-traffictypediagnostic: DM4PR03MB6096:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 a4C5cloGh5LAKF9f3zP590zAGVbnTPTo+571odSfx2dcgYEs/EuIWZW6mGHomtf1IoeW+/cmNIc2Kilc2hrbGGjEDcXmb+uZuObzuoMxMT7lV/A2jOn6TN1PYkYVicLnAceb7QLJsMP5QXcNLM37wpJmWEZ6vH1zaH2QsoUvGv7l3Vz/G5YOBwDdlx886dIZlrk+0BMkyhpa0Onyq63OjEQYZeRETp7DBg8ck2tI7rkzkWVWScqMYo5BfiH0TqPabIyPnjwrKhLwa1fCiEhucT5yP55zvOE7SXFWM3Qd0HLdZIyPpMmrAZ86Tn34/olwdNIwYixfB4chG7HQex8NYyf1eGE9D1kAt2chgn5zBJLTV/f8dsozWkiIWpyhFolG02b5t9ZTcgaMBgXKj9MM3Miv9IGdt9cpuQQFsN0nxdLfLWuL1yNg4Ax2hUxWJDn3kmNcouNZr0eMJH9SsEQwIhkTxVQhG1+PFiWUBcZpX2A2T/gdz9Qb40pPDajndcHxXG2K7FEieYDoJ3WBmrJaQCVLzjm1Qd5HDsUNiO5nqs+iF1yeGEjNm1wFCjPbjq5fGOdo2Tqx9Laa+sW1TxxKY5w/wf8g/MqkNohQvN9ggdKE5TgMafQ45H6yMMWiTxLx5G4/JmbENqJt2vYlvY7gqBFXH7C/tHTRaK5H2k0UiaeQPBsDpnDhIVn98OVfrtBIeb+vGuZI1dTsadzW7WtaokYoI7DcaYwTOfvbXdF6GCJO2aBfvel+XL9DOLQfShqQ6Dg7XTsoILTKOBJaWs/r6RVSZn4YaOb/Z17poAwKP5FvjHaBpuxf8fsPwKnUWTSIh1nptlvHVzq+dBtH4IKio1C/U5aF9xjTnKLrWiKR7n4TXiP1J88fMsIGS/P/+Z2HBimUw9WtwsSp4v5M6L2T4hYfs/EPjc9M33/ksNSRTEpLlXDxUtknLd3vX4wrZx14
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(6506007)(53546011)(2906002)(41300700001)(83380400001)(107886003)(38100700002)(122000001)(186003)(38070700005)(66574015)(6512007)(2616005)(26005)(82960400001)(31686004)(71200400001)(64756008)(4326008)(8676002)(66446008)(91956017)(66476007)(66946007)(76116006)(36756003)(37006003)(54906003)(6636002)(66556008)(316002)(86362001)(8936002)(6862004)(478600001)(966005)(5660300002)(6486002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RFBiSGFvSW9xQ2hGZ25xQU95c0JQVnQ3b3RhakQvMHA3dXhqSG1BVmZXYmdp?=
 =?utf-8?B?RGZGK3B3STMxaEJlN1lLdjFvQ3NIWFZkd1pLeGFlMVZtTnFjTTZydTkwU1Nx?=
 =?utf-8?B?bFowVXl0U0dhZVI5cmUzUnN0blNYZEllWFNrdlNrZFVGcFBKWWJaTHh5YWRp?=
 =?utf-8?B?dHVnajF2RDMzekdMOHE4ODBQVzNKQXg1NTNmVlR3NUcwdVEwNVMvRlM1NUlq?=
 =?utf-8?B?dzN2aW9YNUhWYjVpRFJDWHF5SlFoeWNWTno3eEwwNTVBcE1FamRoSGdRZmNr?=
 =?utf-8?B?Ym9rU3pVNGQ4a2dadlM2ajBtZXU3TUpiSDlYSUVTS05Rdlk1RUFSdktRM1ZS?=
 =?utf-8?B?SE5kd2dRb29TT0d6SGl6YXJVU1ZCRi9zelljVUNDWXlzMWllZVJoNnE2eHVX?=
 =?utf-8?B?T0lXbGs4QlJ0ZzF3UlUwU2dVc3VuWDFOMVVGZTFWT29jNmRUSGRLZEVVdnVH?=
 =?utf-8?B?UjE4TkFSMHViVktJdklvUktINlZtdmpYVTRDaWU2RVJYa2dmd1NpUVdpUUpG?=
 =?utf-8?B?V010UmpaV2U0TnBzTWNLcDAzODRoTU1BVEtxUTJ6V0VtSDFiN05EQTZLWmtJ?=
 =?utf-8?B?MXpDU0xFcFZXREFCNHZOV09rOG5rRm04a1JQUWJKQlZ3NUNYZTZSR3ZzenVT?=
 =?utf-8?B?bDdURmlzdGhxOTFIM2ZIWXpaemNvMVFpSEZQcXk3YnRFMHZtUk1UQ1ZKMmxh?=
 =?utf-8?B?eStib0JKSHpTRG5ReHVmQm1mb1dTT3Z4TW5pUE92ZXVBTWQ0WFlOZmZjUmUw?=
 =?utf-8?B?eEZQWHVIb1FpUkdHSDcrZEJDZC9lMGN2d2lWdkJ1Y0NsYmhpS3FMSkRuTzRl?=
 =?utf-8?B?cndUTTcyRWhudUZLTk1lWURHVkUrUmN1NlZ4YnVJc3N6ZGNwNmRENlIvalBq?=
 =?utf-8?B?citFM0M1RldVd0ttTEhRZ3lXM1pWb3liWUZ1clF5UktieHozK0E2TnArbzk3?=
 =?utf-8?B?amlGT0MzdVJObncvQlp5TnpFdHNBeU5KZVFqcUg4dWJobFN3NnZRcTZ3SjF2?=
 =?utf-8?B?Q2k1eTR6ZVpaY3FRL0NvWUhGMHpFUE9iYVhnT0wxV0MzMGFTUExZNmRrQWlI?=
 =?utf-8?B?VjR6TVpOaWVPcGhCbEU3cDBrS0psQjRQcGVvQXBxZ1lVWndDWm90U0pYTlM2?=
 =?utf-8?B?V3IzQXBQZGh2Wk55T3lKTlNyUVV0WjlzaU1BaFpwVUtLT04vbXNaWDRmZnBl?=
 =?utf-8?B?L1JHNlRjak8zaVBNcllNMThSSlZJOThnKy9WdUVrVDFBejFWV2tOdFZGdDRq?=
 =?utf-8?B?YzBSdWZaQW5mM2xHK05Bd0NWemNSemtZSFRHR001OVhxTUVuTkhDaXBPV1Y3?=
 =?utf-8?B?Q09BZGQ3YVVWQzM0dW50TTZmTGxZQ0V6YW02MG1YTC91V0JTWGF6OWVVZkFR?=
 =?utf-8?B?SjdkVzFUR2p0UG9OcTF4SE02TlgvZUUwMHNGOGF1RTdEc1IvNDhIaVliSjJ6?=
 =?utf-8?B?dGplVkhDV3RhK0I1RnNtRmtpL3pLRWU0YkNxbGlNMGxmZ0RtRysxTHNWT2Yr?=
 =?utf-8?B?NUZwR2lNbTlPejBiSTNnNnJkbjQ4MVNZaDNxUytMN3JvYjV3bVl6VWhCdkVh?=
 =?utf-8?B?aGpveC81dzNTMjV4cy9iV1lYY2NtdmF5cFVkN05oWkc0a1F3bCtWajd0dUZh?=
 =?utf-8?B?VnJsY3pNaXRubE5qOHMydDZRR1RqcVBKTkw3d3lOa09vS001RGl4VVFUU3o3?=
 =?utf-8?B?cmgvdUJLcmZ6NFNTR0FwZHpoNEtZKytHOE12NjgyVlo5Qi9kK24ydjA2S3ZP?=
 =?utf-8?B?bVpYbDVxQ0pXR0Nib3lMckYrUndURzY3VDYxNGcvNngvWHpvc25RUHZPd05K?=
 =?utf-8?B?Y245WDUzaWdmb013VTYwNHpvZ0RtTjRtTGxpQ2VZb2xWQWR2M0pDZFJWMUxs?=
 =?utf-8?B?eXJ2d2pLUWJ2WWZ5Y1djQWZ1bG1ubkhTNTUya0p5Zi9xbDVUcmZ1UFhzNWFB?=
 =?utf-8?B?TlJoUmFJVXFsVWc0QVBNdUZ1WTRPYXpUNE1tcWNBc0lFNXBITXd4aFJObHoy?=
 =?utf-8?B?M2c4ZnVIY2JSWVRTYTAyQzJNUGh5SmkzakMrZGVZVCtTcjkwcVNZeHZOWmhi?=
 =?utf-8?B?SlRKRnp6TFFOMTFTNzY5ekFFVkhxa3JvMWlQdUl5aW5BcXVvTWpEOVZXYjF0?=
 =?utf-8?Q?4zuM+kEDccGjrQv1jRym9y1pZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <20FAFED8058CD848BA164C8D8A5C93FE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86818ee3-4b0c-4ce7-51a3-08da7924a688
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 09:59:14.5612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3WrHpDhmydgemkmwdX5KcAmzQTpDHxHT13YFAikarFv6pIOXPe3dMMN1QC+EecvlzVWvvPJYIkucUKZ6KYbLkXtJZv42VZylpKFrQhoATHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6096

T24gMDgvMDgvMjAyMiAwOToyOCwgRWR3aW4gVG9yb2sgd3JvdGU6DQo+PiBPbiA1IEF1ZyAyMDIy
LCBhdCAxOTowNiwgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6DQo+Pg0KPj4gT24gMjkvMDcvMjAyMiAxODo1MywgRWR3aW4gVMO2csO2ayB3cm90ZToNCj4+
PiArfTsNCj4+Pg0KPj4+IENBTUxwcmltIHZhbHVlIHN0dWJfZXZlbnRjaG5faW5pdCh2b2lkKQ0K
Pj4+IHsNCj4+PiBAQCAtNDgsNyArNzEsOSBAQCBDQU1McHJpbSB2YWx1ZSBzdHViX2V2ZW50Y2hu
X2luaXQodm9pZCkNCj4+PiAJaWYgKHhjZSA9PSBOVUxMKQ0KPj4+IAkJY2FtbF9mYWlsd2l0aCgi
b3BlbiBmYWlsZWQiKTsNCj4+Pg0KPj4+IC0JcmVzdWx0ID0gKHZhbHVlKXhjZTsNCj4+PiArCS8q
IGNvbnRhaW5zIGZpbGUgZGVzY3JpcHRvcnMsIHRyaWdnZXIgZnVsbCBHQyBhdCBsZWFzdCBldmVy
eSAxMjggYWxsb2NhdGlvbnMgKi8NCj4+PiArCXJlc3VsdCA9IGNhbWxfYWxsb2NfY3VzdG9tKCZ4
ZW5ldnRjaG5fb3BzLCBzaXplb2YoeGNlKSwgMSwgMTI4KTsNCj4+IFRoZSBtZW1vcnkgYWxsb2Nh
dGVkIGZvciB4Y2UgaXMgdGlueSAoNDggYnl0ZXMpIGFuZCBpbnZhcmlhbnQgZm9yIHRoZQ0KPj4g
bGlmZXRpbWUgb2YgdGhlIGV2dGNobiBvYmplY3QsIHdoaWNoIHdlJ3ZlIGFscmVhZHkgZXN0YWJs
aXNoZWQgdGVuZHMgdG8NCj4+IG9wZXJhdGUgYXMgYSBzaW5nbGV0b24gYW55d2F5Lg0KPj4NCj4+
IERvbid0IHdlIHdhbnQgdG8gdXNlIHRoZSByZWNvbW1lbmRlZCAwIGFuZCAxIGhlcmU/DQo+IEl0
IGlzIG5vdCBqdXN0IGFib3V0IHRoZSBtZW1vcnkgaXRzZWxmLCBidXQgYWxzbyBhYm91dCB0aGUg
ZmlsZSBkZXNjcmlwdG9yczogdGhvc2UgYXJlIGEgbGltaXRlZCByZXNvdXJjZSwNCj4gYW5kIGlm
IHdlIHVzZSB0aGUgMCBhbmQgMSBpdCBtZWFucyB0aGF0IHRoaXMgd2lsbCBiZSBnYXJiYWdlIGNv
bGxlY3RlZCB2ZXJ5IGluZnJlcXVlbnRseSBzaW5jZSB0aGUgYWxsb2NhdGlvbiBpdHNlbGYgaXMg
dmVyeSBzbWFsbCwNCj4gYW5kIHlvdSBjb3VsZCBwb3RlbnRpYWxseSBydW4gb3V0IG9mIGZpbGUg
ZGVzY3JpcHRvcnMgaWYgeW91IGtlZXAgb3BlbmluZyBuZXcgZXZlbnQgY2hhbm5lbHMuDQo+IE5v
dGljZSB0aGVyZSBpcyBubyBBUEkgZm9yIHRoZSB1c2VyIHRvIGNsb3NlIHRoZSBldmVudCBjaGFu
bmVsLCBzbyBpdCBoYXMgdG8gcmVseSBvbiB0aGUgR0MsIHdoaWNoIGlzIG5vdCBpZGVhbC4NCj4N
Cj4gVGhlIG1pcmFnZSB2ZXJzaW9uIG9mIHRoZSBldmVudGNobiBsaWIgZG9lcyBwcm92aWRlIGEg
Y2xvc2UgZnVuY3Rpb246IGh0dHBzOi8vZ2l0aHViLmNvbS9taXJhZ2Uvb2NhbWwtZXZ0Y2huL2Js
b2IvbWFpbi9saWIvZXZlbnRjaG4ubWxpLA0KPiBhbHRob3VnaCBpdHMgaW1wbGVtZW50YXRpb24g
anVzdCBsZWFrcyBpdCAodG8gYXZvaWQgdXNlLWFmdGVyLWZyZWUpOiBodHRwczovL2dpdGh1Yi5j
b20vbWlyYWdlL29jYW1sLWV2dGNobi9ibG9iL21haW4vbGliL2V2ZW50Y2huLm1sI0w0Mg0KPg0K
PiBBcmUgZXZlbnQgY2hhbm5lbCBhbHdheXMgZXhwZWN0ZWQgdG8gYmUgc2luZ2xldG9ucywgaXMg
dGhlcmUgYSB2YWxpZCB1c2UgY2FzZSB3aGVyZSB5b3UnZCB3YW50IG1vcmUgdGhhbiAxIGV2ZW50
IGNoYW5uZWwvcHJvY2Vzcz8NCg0KQ2FyZWZ1bCBvbiB0ZXJtaW5vbG9neS7CoCBXZSdyZSBkaXNj
dXNzaW5nIGFuIG9wZW4gL2Rldi94ZW4vZXZ0Y2huIGZpbGUNCmhhbmRsZSwgdXBvbiB3aGljaCBh
biBhcmJpdHJhcnkgbnVtYmVyIG9mIGV2ZW50IGNoYW5uZWxzIGFyZSBtdWxpcGxleGVkLg0KDQpU
aGVyZSdzIG5vIGdvb2QgcmVhc29uIHRvIGhhdmUgbW9yZSB0aGFuIG9uZSBmaWxlIGhhbmRsZSBv
cGVuLCBhbmQNCnRoZXJlJ3Mgbm8gZ29vZCByZWFzb24gdG8gY2xvc2UgaXQgZXhjZXB0IGR1cmlu
ZyBzaHV0ZG93bi4NCg0KU28gMCBhbmQgMSBhcmUgcHJvYmFibHkgdGhlIHJpZ2h0IHZhbHVlcyBp
biB0aGlzIGNhc2UuDQoNCn5BbmRyZXcNCg==

