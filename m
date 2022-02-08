Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A45794ADAED
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 15:14:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268404.462235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHRFu-0005hv-6G; Tue, 08 Feb 2022 14:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268404.462235; Tue, 08 Feb 2022 14:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHRFu-0005fa-37; Tue, 08 Feb 2022 14:14:06 +0000
Received: by outflank-mailman (input) for mailman id 268404;
 Tue, 08 Feb 2022 14:14:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHRFs-0005fU-MG
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 14:14:04 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 134bcaf0-88e9-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 15:11:59 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 218ChTnD015156;
 Tue, 8 Feb 2022 14:13:59 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3rqqrx8r-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 14:13:58 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB5784.eurprd03.prod.outlook.com (2603:10a6:20b:f5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 14:13:54 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 14:13:54 +0000
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
X-Inumbo-ID: 134bcaf0-88e9-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gpn4eeNjvCSArVWQ9L34tULGg7C2yLYd9N0xKeWbGXPPviw38dljg2pz0pmozWgvjWGaODG3xIwXmksJ7pkvPqiNnPaHraRjCom99ZPvqO5CvVhDtR9JlBhcOXU66Hs1CaXBEkveEW7aWXFIO2TbvBmie5doMjk3cxAjTFoYgZ4u+fPJRj8YjjMYAwB0DKCmCt8cTH6NV2tjX9z7KXYelvVnAwSI/iouPrwLnzMAGJLiql9Cgq8SWdCEnvoXM/RZERVKySQ7tM5I3M0oQtQkPfIqkbNkh8XBC4FkVZnmPDldBl+Q+/4aaSzJjJPpUTNekwWgJw4pVvyoNh06QiUznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7g1OeJIVUcCeiee2FCYq/5GYMQLHwoVPUoeZuPMLXmc=;
 b=eR5rRT25PmK9Ldua3I/RXaKC+xAnXg5bWABqHy7FQD42L4qmwY8wYQ6TGjwl87Xv0ICfzshbUOGPNgrd90htpRAK7KzD+UNGSpHDvVi6t7z/QcmjdnBbYJlKn3Ej223YrOA+PceL0fAbTU9edSmrtePtANGCiM8jAv2PpFWsnYSxR1lGwroo/ed9YtrrUvCbxM2AQ9Ry3fjv5J311BJZBEzKYxDI4vnD8zsfkcxa+BgqK2lXJ9nAl+zmG6xDZbCkGChAI5kYG/+J1mmfS+wvpArxslAPne/SNaaevF4oyXrtARBwAiQRawdoxsgRQ3NyKCfCD4vneIvwckMwecTodA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7g1OeJIVUcCeiee2FCYq/5GYMQLHwoVPUoeZuPMLXmc=;
 b=KHKi8RUFgXi2hY8PFxK0T7sXSd2b37gRNcj0GrmLTCpHcF4QT9pEL7lmE//RN7owEi155n9Jz3eyKSwzTX14PyEudWpRvYMCoxoHYOEkNzFNMfEhkmg+XsM1nsnfcD4VNU6c1EyPxRf2XFGaH0W6ON63P7y0Z0zftPrYjlIVJPwM28eMcxiwUd++pEHVDCrd3LdDsOd6N/qthu0yB8DnyMnpWZqYVziKxT/GfxT1kDEpDQeCvyL74QyG9dCcgDNCa94vQuj/oHUnnJUUkdaysetijyof2RM+EK0Y0ufpcRciYQNFXZTF7QkqThg/TcDdqjoa3Afa7cL5TPhca4fMIg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Index: 
 AQHYGZFfEau2yoVfs02TXHZP7JM5E6yDcw0AgAXhW4CAABY4AIAAAW6AgAAD24CAAAHYgIAAFHwAgAAEyQCAACy5AIAAAVKA
Date: Tue, 8 Feb 2022 14:13:54 +0000
Message-ID: <168356f6-fa7f-6d9f-290d-3eccb1e769a0@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-10-andr2000@gmail.com>
 <7df2379e-1c30-c362-3106-c7ef23af5c73@suse.com>
 <0ff2a524-9a65-861a-df87-cf3f682862d7@epam.com>
 <140e163c-87d0-2ae8-d57b-7ebc6757de9e@suse.com>
 <08d02313-349d-9ad4-926d-0d1419866363@epam.com>
 <186b7264-1190-3df2-415d-f1ec73a7c03f@suse.com>
 <ccaaa9b8-8ed9-054e-b724-70ca07401be9@epam.com>
 <YgJP/jMhWBrLOpb2@Air-de-Roger>
 <ec27927e-6c05-0e61-c0b8-c28bfd4d3d5e@epam.com>
 <YgJ5hmxtTXz9XDdr@Air-de-Roger>
In-Reply-To: <YgJ5hmxtTXz9XDdr@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac29e80f-8730-4488-fa89-08d9eb0d3d78
x-ms-traffictypediagnostic: AM6PR03MB5784:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB5784762BD0F29A7976DFBD66E72D9@AM6PR03MB5784.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sLzig4bB1elRV1diiWEiwC8OgpjJthFUddh/+y13ZPbc4qekHoD5LEJzpS/VC690jqzG4c6Bl+H5FAWSsDUNYFdJj6O1jNNohEVK1Go7TfMo92e6+4OkSZJrRVvvi14Khn2baLj975PJS5aT44H0VFcLIuv74K/aF7wwVxTEYIELKxVPUR5EwUzEuHB5gk7w6yy2entLpHWoXzMsUnFbUMYk9gYOudfxBnn4oK0DZo1fC/Q55PkQgm5rYEzeCDwNrIxhymSET+tGfxCk/7bL1J+uaRGx5vMVseT6mfPSxZYkGWklX8d/6rV/czChyYQIAPrMD+ci0qRbTEaqWz26Afdpp6eYGfA6DVTJyuD5/+KIGs12BeZiQX62IwBSUdWmKeCezTHaYirrXZ9dhqIoFwcdLcF2mqMIDkNqrWhleLpzxydFZi9of7c/qwrZKgW7p1reoyTlmCUoiYrrPMAtI2PjBK5ygZ4fs3Ucoa62zkU/AAqmsfoSY6CktA2sMnOpO+p4WWitejwGXe0avT8gisdJbHNei5SVp+lLzDRA3w/KZ7f1lxEQGet0FoogrQNf/MM4WWM9bGbJeCGtLyKRil9PB+j7isfKQpsPVQdLP6PKEbqlYrwIlMyC1MhGXlUACtq0WnD6XAQME5GLFGth5h7HceXx9thpHnbhwIO9pHk6SKMkXA1wJG0XQJyeMweMeIO8zWtMSjzxpBXSM/qJHE0fENpzDzLcjgkZYimC3SamVmr/2X4LkaiPD3RSFRh8
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66446008)(76116006)(66476007)(83380400001)(55236004)(53546011)(38070700005)(86362001)(122000001)(66556008)(508600001)(8936002)(66946007)(64756008)(38100700002)(8676002)(5660300002)(4326008)(91956017)(54906003)(6486002)(6506007)(7416002)(26005)(6916009)(316002)(2906002)(107886003)(2616005)(6512007)(186003)(31696002)(31686004)(36756003)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RHBQTzRxamt4T3hqT3RLamY3TERVTzliYjdrWlArRGNFSXZveXBMOGozYUVm?=
 =?utf-8?B?c1JCMmNtKzhLbis4R2NRMDRaMUxXcXQ1Z3BOSHk0WUNEaDE5WnRhKzBjbndy?=
 =?utf-8?B?WEVJK2JxcE15RHJlVmJwOHh2NE5XR2theUtna1lVMlYwYmVBdmkyQ1Vmajlv?=
 =?utf-8?B?SVJrMEZnWGpaKzU1UC9SWU1iV0xndHhKRWpyVDIrT2F4UVJteWd0MWxubStE?=
 =?utf-8?B?OTRKQkR6d20ySDA1Y0tUMzVEamFoNkxwbi8wakRtajlvNlcyNFdMcXcxSVpE?=
 =?utf-8?B?YktOVXFUS3VQWThEZ3RHTGlGdTN3Vmt0Q0FPVWdOUlNVMm1jUE9TYytFSkcw?=
 =?utf-8?B?TlJtVHNmWjJaK1ZqOVFUL0huMk1WbDlFdnVJS3A0bWFYSkNSWVNXL09QSjRP?=
 =?utf-8?B?dUJWNi85ZWkvOFZXMGJNUjk3MGNOZnNTMXpWOXR1OE1uY0pxVHZVeHk1UmdR?=
 =?utf-8?B?dFh4YVgrREF0UFd6OXQ4RnNxK2tzNlA4TmV4OGFHUURoQnEyYmR5QlhabnFZ?=
 =?utf-8?B?R2RJcmdMcFFoTnBVT21RWlpCc1FMVHlaNkJ5elk3ZU1FcXAxL0dtaUYvQzVC?=
 =?utf-8?B?bi9pRVZVYUt4K2xvN2FQZ2RocDBheDlwK1BvZTk0OHFOdTdVYk93UzVETnJO?=
 =?utf-8?B?QlZiSC9Fa2RLdUp4L3pqTjkyWC84UVlHSU8xWDhIbVlGNTRYS0M3YjlveFhQ?=
 =?utf-8?B?VG8yOFNyL3FrRmlScGgxR0xZdGQxdlV4SDVWQjZFUlFSVVpDdnVKSlhuTGJh?=
 =?utf-8?B?a1pubmtGWjYvSEVTQ2MzTnpIZ1YrOXZnS2t0bkplSHVheHhwYTAyNkltb3RK?=
 =?utf-8?B?ckdNRHB5ZDFuc3VwNkZvT29GRk80VlM4UVJSM2FyLzRnUmMrY0xQT3F4M0Yr?=
 =?utf-8?B?K0QwRFRpNC9IMEVJUThBeHR2UnU4M3F2ZEE2RnRDcDQvZkp4RHYyWDBna3pV?=
 =?utf-8?B?dk5zL2gyd2JqWEhCQXhNM01Zb0Q1V3g5MzFXdnNVamRVc1pHdDQyWlBQekkw?=
 =?utf-8?B?V1VjV0JKK3c5UHFmcS8rRDdSSGNMc1R5VndJMCs0YnlYQ3BubGNpZmhPZ0xW?=
 =?utf-8?B?V0hlZGxUQVlqMzlGTWRuUW50VXk4ZWxscnhIY2VXK0V3Q3RGbWxkNEhTcVVy?=
 =?utf-8?B?MzE4ZWpqZXBKazhOaUI0azVlSnUyMzlrME5CQlQrbDhWZk84eFAvYlFxUzZj?=
 =?utf-8?B?RWJDUUJZZW1YdDZMeVc4L1FEUWJ0VEhMU2lWQmhKU2tWM0l6WFVITnhqUWdi?=
 =?utf-8?B?M2d0RXhnbkdXbGgzSjIzR3U0aXZJUW5aWUtNbENRM3hSckcxUUUzQ3BxR0F1?=
 =?utf-8?B?MzZsV3N6bjVpaWlvYWRVVEd4NWhCWEhIS3JtQVNGMWhRT1RpajdaSlM3bVll?=
 =?utf-8?B?TmlyYVVGc3hIZUlZSk4ybVhueXJtVnVueGxXTE5BSE9KeTl6VjNldHVyVTV0?=
 =?utf-8?B?Qlg4LzUwa3ArZWZ3WFBla05sb253OFQyazExUVFCN2w2SE0vR2ZRZ01uNEkr?=
 =?utf-8?B?THhONHplWE5qb3IzQkFOcitKc1dJclpJd1F3VUhTSEtJUWVoVS9SanplbkFr?=
 =?utf-8?B?ZkhpMUJSL29UaTU2bDBIUHdhODNTSHc0ZlRwczNndkE3SUt0WlFJWS9BYzFh?=
 =?utf-8?B?dXlTNlAvcFAyekJKdHhUMWlIQUpXb1JNQXBEUndFNmtXMVdIVmYzanp3WkRL?=
 =?utf-8?B?YlZDZGpRVVl6b2pUUVRTVnE4NEVGb0crZnJpeGdmNVpKOGNQblZXTjVwQjNI?=
 =?utf-8?B?YUdCYXIwc1ZIVEhSWlB0WS81WmVzaU40eFJ1MVR2aURzdjZubWVQdU0wYnlK?=
 =?utf-8?B?ZzdndE1qZ3pPQ2NEREovd0kyYTlGRXVvNWtoZ3lTYjZ1b0JmWmhFc0Ivd2xD?=
 =?utf-8?B?L3BGVEw3K2RaYTNOM3lCVWl6ckRqMDNKVEN3eXQvV2pHdXQwdGd2WU9uTkdV?=
 =?utf-8?B?T3NWVjFDVjNXc1RSdXZYaTJWSlA4dWIwTXlicVJEdmNaY3JaUm1HclNkZzdI?=
 =?utf-8?B?WmJXYk15QzBlUHF2eXZBRGtUVHRuTTYrblB2VEphWVUzM1Rnc09tam5XT21I?=
 =?utf-8?B?STFLblJrU1NNeEJJREZrbWMzTDZXWk5Xd2dQMzNZdWk0VkJGWnRzZUNlOW02?=
 =?utf-8?B?dW5YZDNnTEU3clI0ZjNFbWJ2VHdORkpRNVM5Vjh5OFg0UDBDMlBCbm8wcFRI?=
 =?utf-8?B?UjVIekVwZ3lTVk9HUnZPbFVYbE8wSURWMDM4V2NoaVF5Nm91ck5OQ0xMSUo1?=
 =?utf-8?B?dnY1ejQ5M0dheXBZRXA0WmpmYjIxVzVhZVhBUTZobU5oYngyYmtFZ2RMZGc5?=
 =?utf-8?B?TlB5UmgxcEZSdktFZGM0NXBmREdCZFpZdEo1bVVGK0tlRXl4SWxXU3hUT3ZQ?=
 =?utf-8?Q?2kllhoszxJ9nt9S8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DEAF4A66F6ECD49AE262A3922109F48@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac29e80f-8730-4488-fa89-08d9eb0d3d78
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 14:13:54.6983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 30iN1ygJbX+fLpL4J0TSMeBBy3AemMjUwlaQXPYyRX02xa3AKNSzTrg1olVVTlduceq7KJ5JsW4gcjeNcMbbrV2sCWsjITkF57Tpf3TfVKrYKVd5VAMKcw8Ie9v7oMRp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5784
X-Proofpoint-ORIG-GUID: BhKfJQdL0bmpqinHT2PFr2sCHwPTrHur
X-Proofpoint-GUID: BhKfJQdL0bmpqinHT2PFr2sCHwPTrHur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_04,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0
 mlxlogscore=816 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080089

DQoNCk9uIDA4LjAyLjIyIDE2OjA5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUdWUs
IEZlYiAwOCwgMjAyMiBhdCAxMToyOTowN0FNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAwOC4wMi4yMiAxMzoxMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+PiBPbiBUdWUsIEZlYiAwOCwgMjAyMiBhdCAwOTo1ODo0MEFNICswMDAwLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gT24gMDguMDIuMjIgMTE6NTIsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+Pj4gT24gMDguMDIuMjAyMiAxMDozOCwgT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gd3JvdGU6DQo+Pj4+Pj4gT24gMDguMDIuMjIgMTE6MzMsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+Pj4+PiBPbiAwOC4wMi4yMDIyIDA5OjEzLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3
cm90ZToNCj4+Pj4+Pj4+IE9uIDA0LjAyLjIyIDE2OjI1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+
Pj4+Pj4+PiBPbiAwNC4wMi4yMDIyIDA3OjM0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90
ZToNCj4+Pj4+Pj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+Pj4+
PiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+Pj4+Pj4+Pj4+IEBAIC00NTQsNiAr
NDU0LDIyIEBAIHN0YXRpYyB2b2lkIGNtZF93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRl
diwgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICBwY2lfY29uZl93
cml0ZTE2KHBkZXYtPnNiZGYsIHJlZywgY21kKTsNCj4+Pj4+Pj4+Pj4gICAgICAgfQ0KPj4+Pj4+
Pj4+PiAgICAgICANCj4+Pj4+Pj4+Pj4gK3N0YXRpYyB2b2lkIGd1ZXN0X2NtZF93cml0ZShjb25z
dCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4+Pj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBjbWQsIHZvaWQgKmRhdGEpDQo+Pj4+
Pj4+Pj4+ICt7DQo+Pj4+Pj4+Pj4+ICsgICAgLyogVE9ETzogQWRkIHByb3BlciBlbXVsYXRpb24g
Zm9yIGFsbCBiaXRzIG9mIHRoZSBjb21tYW5kIHJlZ2lzdGVyLiAqLw0KPj4+Pj4+Pj4+PiArDQo+
Pj4+Pj4+Pj4+ICsjaWZkZWYgQ09ORklHX0hBU19QQ0lfTVNJDQo+Pj4+Pj4+Pj4+ICsgICAgaWYg
KCBwZGV2LT52cGNpLT5tc2ktPmVuYWJsZWQgfHwgcGRldi0+dnBjaS0+bXNpeC0+ZW5hYmxlZCAp
DQo+Pj4+Pj4+Pj4+ICsgICAgew0KPj4+Pj4+Pj4+PiArICAgICAgICAvKiBHdWVzdCB3YW50cyB0
byBlbmFibGUgSU5UeC4gSXQgY2FuJ3QgYmUgZW5hYmxlZCBpZiBNU0kvTVNJLVggZW5hYmxlZC4g
Ki8NCj4+Pj4+Pj4+Pj4gKyAgICAgICAgY21kIHw9IFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRTsN
Cj4+Pj4+Pj4+Pj4gKyAgICB9DQo+Pj4+Pj4+Pj4+ICsjZW5kaWYNCj4+Pj4+Pj4+Pj4gKw0KPj4+
Pj4+Pj4+PiArICAgIGNtZF93cml0ZShwZGV2LCByZWcsIGNtZCwgZGF0YSk7DQo+Pj4+Pj4+Pj4+
ICt9DQo+Pj4+Pj4+Pj4gSXQncyBub3QgcmVhbGx5IGNsZWFyIHRvIG1lIHdoZXRoZXIgdGhlIFRP
RE8gd2FycmFudHMgdGhpcyBiZWluZyBhDQo+Pj4+Pj4+Pj4gc2VwYXJhdGUgZnVuY3Rpb24uIFBl
cnNvbmFsbHkgSSdkIGZpbmQgaXQgcHJlZmVyYWJsZSBpZiB0aGUgbG9naWMNCj4+Pj4+Pj4+PiB3
YXMgZm9sZGVkIGludG8gY21kX3dyaXRlKCkuDQo+Pj4+Pj4+PiBOb3Qgc3VyZSBjbWRfd3JpdGUg
bmVlZHMgdG8gaGF2ZSBndWVzdCdzIGxvZ2ljLiBBbmQgd2hhdCdzIHRoZQ0KPj4+Pj4+Pj4gcHJv
Zml0PyBMYXRlciBvbiwgd2hlbiB3ZSBkZWNpZGUgaG93IFBDSV9DT01NQU5EIGNhbiBiZSBlbXVs
YXRlZA0KPj4+Pj4+Pj4gdGhpcyBjb2RlIHdpbGwgbGl2ZSBpbiBndWVzdF9jbWRfd3JpdGUgYW55
d2F5cw0KPj4+Pj4+PiBXaHkgIndpbGwiPyBUaGVyZSdzIG5vdGhpbmcgY29uY2VwdHVhbGx5IHdy
b25nIHdpdGggcHV0dGluZyBhbGwgdGhlDQo+Pj4+Pj4+IGVtdWxhdGlvbiBsb2dpYyBpbnRvIGNt
ZF93cml0ZSgpLCBpbnNpZGUgYW4gaWYoIWh3ZG9tKSBjb25kaXRpb25hbC4NCj4+Pj4+Pj4gSWYg
YW5kIHdoZW4gd2UgZ2FpbiBDRVQtSUJUIHN1cHBvcnQgb24gdGhlIHg4NiBzaWRlIChhbmQgSSdt
IHRvbGQNCj4+Pj4+Pj4gdGhlcmUncyBhbiBBcm0gZXF1aXZhbGVudCBvZiB0aGlzKSwgdGhlbiB0
byBtYWtlIHRoaXMgYXMgdXNlZnVsIGFzDQo+Pj4+Pj4+IHBvc3NpYmxlIGl0IGlzIGdvaW5nIHRv
IGJlIGRlc2lyYWJsZSB0byBsaW1pdCB0aGUgbnVtYmVyIG9mIGZ1bmN0aW9ucw0KPj4+Pj4+PiBj
YWxsZWQgdGhyb3VnaCBmdW5jdGlvbiBwb2ludGVycy4gWW91IG1heSBoYXZlIHNlZW4gQW5kcmV3
J3MgaHVnZQ0KPj4+Pj4+PiAieDg2OiBTdXBwb3J0IGZvciBDRVQgSW5kaXJlY3QgQnJhbmNoIFRy
YWNraW5nIiBzZXJpZXMuIFdlIHdhbnQgdG8NCj4+Pj4+Pj4ga2VlcCBkb3duIHRoZSBudW1iZXIg
b2Ygc3VjaCBhbm5vdGF0aW9uczsgdGhlIHZhc3QgcGFydCBvZiB0aGUgc2VyaWVzDQo+Pj4+Pj4+
IGlzIGFib3V0IGFkZGluZyBvZiBzdWNoLg0KPj4+Pj4+IFdlbGwsIHdoaWxlIEkgc2VlIG5vdGhp
bmcgYmFkIHdpdGggdGhhdCwgZnJvbSB0aGUgY29kZSBvcmdhbml6YXRpb24NCj4+Pj4+PiBpdCB3
b3VsZCBsb29rIGEgYml0IHN0cmFuZ2U6IHdlIGRvbid0IGRpZmZlcmVudGlhdGUgaHdkb20gaW4g
dnBjaQ0KPj4+Pj4+IGhhbmRsZXJzLCBidXQgaW5zdGVhZCBwcm92aWRlIG9uZSBmb3IgaHdkb20g
YW5kIG9uZSBmb3IgZ3Vlc3RzLg0KPj4+Pj4+IFdoaWxlIEkgdW5kZXJzdGFuZCB5b3VyIGNvbmNl
cm4gSSBzdGlsbCB0aGluayB0aGF0IGF0IHRoZSBtb21lbnQNCj4+Pj4+PiBpdCB3aWxsIGJlIG1v
cmUgaW4gbGluZSB3aXRoIHRoZSBleGlzdGluZyBjb2RlIGlmIHdlIHByb3ZpZGUgYSBkZWRpY2F0
ZWQNCj4+Pj4+PiBoYW5kbGVyLg0KPj4+Pj4gVGhlIGV4aXN0aW5nIGNvZGUgb25seSBkZWFscyB3
aXRoIERvbTAsIGFuZCBoZW5jZSBkb2Vzbid0IGhhdmUgYW55DQo+Pj4+PiBwYWlycyBvZiBoYW5k
bGVycy4NCj4+Pj4gVGhpcyBpcyBmYWlyDQo+Pj4+PiAgICAgRlRBT0Qgd2hhdCBJIHNhaWQgYWJv
dmUgYXBwbGllcyBlcXVhbGx5IHRvIG90aGVyDQo+Pj4+PiBzZXBhcmF0ZSBndWVzdCByZWFkL3dy
aXRlIGhhbmRsZXJzIHlvdSBtYXkgYmUgaW50cm9kdWNpbmcuIFRoZQ0KPj4+Pj4gZXhjZXB0aW9u
IGJlaW5nIHdoZW4gZS5nLiBhIGhhcmR3YXJlIGFjY2VzcyBoYW5kbGVyIGlzIHB1dCBpbiBwbGFj
ZQ0KPj4+Pj4gZm9yIERvbTAgKGZvciBvYnZpb3VzIHJlYXNvbnMsIEkgdGhpbmspLg0KPj4+PiBA
Um9nZXIsIHdoYXQncyB5b3VyIHByZWZlcmVuY2UgaGVyZT8NCj4+PiBUaGUgbmV3bHkgaW50cm9k
dWNlZCBoYW5kbGVyIGVuZHMgdXAgY2FsbGluZyB0aGUgZXhpc3Rpbmcgb25lLA0KPj4gQnV0IGJl
Zm9yZSBkb2luZyBzbyBpdCBpbXBsZW1lbnRzIGd1ZXN0IHNwZWNpZmljIGxvZ2ljIHdoaWNoIHdp
bGwgYmUNCj4+IGV4dGVuZGVkIGFzIHdlIGFkZCBtb3JlIGJpdHMgb2YgZW11bGF0aW9uDQo+Pj4g
ICAgc28gaW4NCj4+PiB0aGlzIGNhc2UgaXQgbWlnaHQgbWFrZSBzZW5zZSB0byBleHBhbmQgY21k
X3dyaXRlIHRvIGFsc28gY2F0ZXIgZm9yDQo+Pj4gdGhlIGRvbVUgY2FzZT8NCj4+IFNvLCBmcm9t
IHRoZSBhYm92ZSBJIHRob3VnaHQgaXMgd2FzIG9rIHRvIGhhdmUgYSBkZWRpY2F0ZWQgaGFuZGxl
cg0KPiBHaXZlbiB0aGUgY3VycmVudCBwcm9wb3NhbCB3aGVyZSB5b3UgYXJlIG9ubHkgZGVhbGlu
ZyB3aXRoIElOVHggSSBkb24ndA0KPiB0aGluayBpdCBtYWtlcyBtdWNoIHNlbnNlIHRvIGhhdmUg
YSBzZXBhcmF0ZSBoYW5kbGVyIGJlY2F1c2UgeW91IGVuZA0KPiB1cCBjYWxsaW5nIGNtZF93cml0
ZSBhbnl3YXksIHNvIHdoYXQncyBhZGRlZCB0aGVyZSBjb3VsZCB2ZXJ5IHdlbGwgYmUNCj4gYWRk
ZWQgYXQgdGhlIHRvcCBvZiBjbWRfd3JpdGUuDQpHb29kDQo+DQo+Pj4gSSB0aGluayB3ZSBuZWVk
IHRvIGJlIHNlbnNpYmxlIGhlcmUgaW4gdGhhdCB3ZSBkb24ndCB3YW50IHRvIGVuZCB1cA0KPj4+
IHdpdGggaGFuZGxlcnMgbGlrZToNCj4+Pg0KPj4+IHJlZ2lzdGVyX3JlYWQoLi4uKQ0KPj4+IHsN
Cj4+PiAgICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKCkgKQ0KPj4+ICAgICAgICAgIC4uLi4N
Cj4+PiAgICAgIGVsc2UNCj4+PiAgICAgICAgICAuLi4NCj4+PiB9DQo+Pj4NCj4+PiBJZiB0aGVy
ZSdzIHNoYXJlZCBjb2RlIGl0J3MgSU1PIGJldHRlciB0byBub3QgY3JlYXRlIGFzIGd1ZXN0IHNw
ZWNpZmljDQo+Pj4gaGFuZGxlci4NCj4+Pg0KPj4+IEl0J3MgYWxzbyBtb3JlIHJpc2t5IHRvIHVz
ZSB0aGUgc2FtZSBoYW5kbGVycyBmb3IgZG9tMCBhbmQgZG9tVSwgYXMgYQ0KPj4+IGNoYW5nZSBp
bnRlbmRlZCB0byBkb20wIG9ubHkgbWlnaHQgZW5kIHVwIGxlYWtpbmcgaW4gdGhlIGRvbVUgcGF0
aCBhbmQNCj4+PiB0aGF0IGNvdWxkIGVhc2lseSBiZWNvbWUgYSBzZWN1cml0eSBpc3N1ZS4NCj4+
IFNvLCBqdXN0IGZvciB5b3VyIGp1c3RpZmljYXRpb246IEJBUnMuIElzIHRoaXMgc29tZXRoaW5n
IHdlIGFsc28gd2FudA0KPj4gdG8gYmUga2VwdCBzZXBhcmF0ZSBvciB3ZSB3YW50IGlmIChpc19o
d2RvbSk/DQo+PiBJIGd1ZXNzIHRoZSBmb3JtZXIuDQo+IEkgdGhpbmsgQkFSIGFjY2VzcyBoYW5k
bGluZyBpcyBzdWZmaWNpZW50bHkgZGlmZmVyZW50IGJldHdlZW4gZG9tMCBhbmQNCj4gZG9tVSB0
aGF0IHdlIHdhbnQgc2VwYXJhdGUgaGFuZGxlcnMuDQpNYWtlcyBzZW5zZQ0KPiBUaGFua3MsIFJv
Z2VyLg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

