Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D3A4AC0E1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 15:18:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266999.460696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH4q0-00011H-EU; Mon, 07 Feb 2022 14:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266999.460696; Mon, 07 Feb 2022 14:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH4q0-0000yo-BF; Mon, 07 Feb 2022 14:17:52 +0000
Received: by outflank-mailman (input) for mailman id 266999;
 Mon, 07 Feb 2022 14:17:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F54n=SW=epam.com=prvs=403792ff6c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nH4pz-0000yg-5S
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 14:17:51 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b986f9ba-8820-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 15:17:48 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 217EEke8023747;
 Mon, 7 Feb 2022 14:17:45 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e350ur0hx-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 14:17:44 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DU0PR03MB8161.eurprd03.prod.outlook.com (2603:10a6:10:350::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 14:17:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 14:17:36 +0000
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
X-Inumbo-ID: b986f9ba-8820-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHIqcJc84klNqvwajaL8hRkCu6QfTWrEibdgZe5PdBDuDKJXO1DM1x+Rq5fYtWhyHSdMJkgS+qlorblmGXmIvYHrlpWxVgwTB6eH+XAB/m+osPWudRJYZTkSzOHrAyAHqnSAlpu7M7VUHhkfxgbDD3M17QCWB8qj5uYfvYf/1aNClg+vGlsrhOwelSN3zj3+9WGy1DgclSVlbmBIt5peClLZFCjb5JRcSKviVwn6oibpKMHmVuJHpaQ0cBg37wiCxTvwyJm6tlf3S7/f4YBW7vX+NGAJM+uaNzhSdnQU1pA+Z28d3JUAWFqTbxyMTDOW+e3eITGCBPyk/e6uy+kyUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8rpdXTfmATKVvJzL2xVXLPvv37qTKoSS5f1czfgJ8g=;
 b=AL20v3A9+nQIWPe7GFo6B0TCXB22eJn+7MPYtYixNtOroWiw8SzaxygXuSFRi4qP5+/VAtIG081MhAjQRTOpyIHdTTmDPeXMOHjhhXtscucJ+UotVp4SVtnUpvbs3utegdQ/5Wj+Ap5iaAAYs+mZP+/piRSaVKhDxr9RfgEA+iorRv9HxeldAoIPN5dyQ+DR2udsMVIOV/gHKdqYlQQb1tiT9r/R1EmyrBlkDrs8BQf4vIGBk9Gyrpm7A+XQr8s5MPRvX8oDuc6BD4Ylt0z/TlgOLphWJw2xAutWjkqjR3QOiBnM1cs9Wv+H0ZlCnrANtYh/rVCA9Hhcm3DUtoMPIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8rpdXTfmATKVvJzL2xVXLPvv37qTKoSS5f1czfgJ8g=;
 b=D4IwCv/AvG3JGk13Qca4n4fS1aOJzLfjt0K7XtdMXq20QJgVAkpS92bSHCq7gVgBk5aEMSmGkg9m9mNR513ZOrk0SmqgpV+8UQLIAff/WoKP9nNwahAYKRN76nNSs2YCJw5sg0T4DUsWcGADii3CJxm48yKdee9AvBIN1AvcHV34hNGwRv/odLCXxXWTzwdldIPmQBHvMH7hQ+A62wRbcGJEsh+nIgn3SZtnVifY2lghhOBQoFbDAR/M+aT4INEY3dckoQmIaKftcM5EqqmtxbDu3jG6MsVIVdvkFt3h6JFD4IdG010B7uSC1uLMtzXex9uPUKGoI4fX06uNuyYXAw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Topic: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Index: 
 AQHYGZFg3nazYSvfA0G+yHTbxcxX2ayDdFgAgAAB6wCABD+NgIAAQmgAgAAT4YCAAAOjAIAAAPCAgAAXGIA=
Date: Mon, 7 Feb 2022 14:17:36 +0000
Message-ID: <f34cc940-7f5f-aebd-60d9-d1a3d85d1283@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-11-andr2000@gmail.com>
 <96381d7e-dafc-acee-3abf-f9815deb207c@suse.com>
 <ef76faac-f9d3-1cb8-06b5-189ccd299542@epam.com>
 <6f0a015b-c48f-76ed-9a51-39c045ff5927@suse.com>
 <2ad372d4-a181-9307-ef50-a5adb61dae66@epam.com>
 <49380584-0577-96f2-ef1c-a96eabf0d227@suse.com>
 <fbd410d1-84ad-2309-ca05-b9ac7f95f1f9@epam.com>
 <dbef1c95-818c-427c-1963-75d584843cff@suse.com>
In-Reply-To: <dbef1c95-818c-427c-1963-75d584843cff@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2270420e-0a25-48e6-016d-08d9ea449756
x-ms-traffictypediagnostic: DU0PR03MB8161:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DU0PR03MB81610AB7F185F47C3E07918EE72C9@DU0PR03MB8161.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ITngoXg5HGUYZ08FLXHrVLG3fYJlT/i4Osca5NKc741w7zY++9C/CIdxPxdPGvvLhDXTtjv5AouMSWFmXrrBZDNa0i3rulnjZWZy121qoZAg6WCpVjvyf+6bKXBNA2B6slq53bxvcxtq3lx3ntTd/QO+bQj3QXmCSZUioAXt3Tz91nduKSN/wWnPgF5P6GGDXs3zKe/4uvH9h4EQLZZYYES9xoTmp+e46c8WvBbHsHdYMB5QlyAHIP9ruetzVcO8iVy+Y5+EgI1rwiTMrylWd8zk32rOYyUX650FdHi7YKB7kjGOPhUfmN7wzZdeNotaKqWJCtgCBcssMDAepMhuFLb/NbnI1IU8FyvP1YkW3pBTEqRpRMjvjgf5CLZTGqp/bQbgDg2uUvs4lmj/sUBK6NJ5c68n6CLbhclxTIBVVksyKs7gH+hIQa5ADjjO5UDtH2zONR1Nz9uMLdFJa4/zaK5w8+PgOrCgpLZtVh9B4s6LkzWwvGaW33ZpbvoOCvPuKGSNZINgbKQH/0PnpNrSB1sgIcD0rKxu4CtVjO5KokRt2GB1DD+/b9v49ULKuEdgwiBpXDQyCak8Vljuq223ntH8T+SyhXD11v57HXfBYGIqZk3tkpFrf2P6PFiW5Cebus9SKnhdXjF6rspKhuBqLt1qrhCNvPKzQSg9eipl729d+3pE1CBla4XRBRZgRaCufdtmtK5QVP0BRwVABngAUKMeTCD0nZyrJHUv+SED4DFTEfjaeKW2kchMQEc0/bQnbhLPhTqQ7MRpxNI2QborAB7w9Nt+h1/zHG5+2P2ZOKtPg1Xa/o2pwFb/Sxnz9euVT0ITlizpW2d7gtLqKWxl1uWrEY7ynhRhgIgUZTfBF7E=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(31686004)(186003)(83380400001)(2906002)(26005)(6512007)(31696002)(2616005)(122000001)(7416002)(5660300002)(107886003)(508600001)(55236004)(53546011)(38100700002)(86362001)(36756003)(6506007)(66446008)(8936002)(64756008)(66476007)(66556008)(66946007)(91956017)(4326008)(8676002)(71200400001)(6916009)(76116006)(54906003)(6486002)(316002)(966005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OGYwMkV4aWxUd0JJRkllWnR5RStKcEg0Z2krSDErUDZoWUUyb2xlcFFvTEVS?=
 =?utf-8?B?b1FZZDdPQ3BvdkFZNVdVc280N2s3ZFZsR0YwcXNScmg0dTRSSFpZQmJFd1NE?=
 =?utf-8?B?aHJILzlJK1JTbjhSMkVHMnJJS09OR2JDOWhZZ0VPZWQrVEoxSytHMDEyK2JR?=
 =?utf-8?B?Zkd1WGJyWG1TdmtncmxkVmtEUCttWFFFcURxdWhjQmdZSUQ3MWZmUWtXNXBo?=
 =?utf-8?B?S3J3WnZyRTdXRUd1bGdDYW1xT2xEOXppN3I3Nit5RlVkcnpicjNydmFSOUpa?=
 =?utf-8?B?SXhJRTJWdFZBL0pFajA5ZitmWkg3Z1RybHhNRDRyb2srWTBTc2xBaDZuZ0pp?=
 =?utf-8?B?d095QmR4MlkwYTg3RXhlZFI4RHVKQnBZY2VCY1NQMTU5eXBxaTNNcEJzL0Fx?=
 =?utf-8?B?ZEhuTXNHUEdZZjFCeDZsMXRsUVkvMC91dFJXeGhaQ0F2V3F2WkNIUUxVRHVr?=
 =?utf-8?B?L1hiSDBPZnVlbW9RT3BuNG9vV2o5bGJPeFVmMm52OTA4VGFwSmluVTRpY2xW?=
 =?utf-8?B?TjJiUlh5UDZzZlJMTC9WaW5aRTYzWjhiRm1oMWFLZkh2bEZlNkloWGMzRlVj?=
 =?utf-8?B?TXBXSGFxeDZEWHlOYkxZL0NjL29HOEJNdjQ1dkxJOUEwVkkyd2drRHhFdVlO?=
 =?utf-8?B?YS9URktERmxlRHlVNWZqZ3dVS2RHZCt6RjBNSGk1Mys5dFJEdjUvaUdkN0Fq?=
 =?utf-8?B?ZGZhdkJIMUhwZGdLaXBaOTlYVy9HSE9hZ3F1eUJrakZCSnlaeFpKZjlYSDNQ?=
 =?utf-8?B?Tk1PSERRSmsySDh1MkpISVZ2QWVzNzV4UExKTDJsVVZQVkwrN2tFOU5hRWhu?=
 =?utf-8?B?LzF5Z1pPNEVHRkRmRWh2Z29HemFrNjBrNnRnWW1JdkpNZ3dGbGVzRVFiV2Q1?=
 =?utf-8?B?cFdkTmhyZ2ptVVRtVXhkYUMwUmZ0aFIrT2d0MlJsS1U0L1J2QzdUeEZ4N0c3?=
 =?utf-8?B?L0ZJT29DY090WmNPblMxczJFK0IwUU1xK0E5VWRWdnB6b3ZkVFhEdzh6eDJr?=
 =?utf-8?B?VG5jV0FpdkdDNkZnMlVKcnhFcnZjVXVSc0lzdzlrbjZsbllnaTBQaEJudFFr?=
 =?utf-8?B?UXBLWEt2ZXFkOHVGZGpTNmFNd3ZPVXY5ZEhzOW1rMGNOelIvakN2dDF5NTM3?=
 =?utf-8?B?SUIzVHVpdmxQRlRJODJZZmg2VlZVQTlGSkZ6UjM5K0pwc0c2Y3cvbTQvWFlx?=
 =?utf-8?B?UXd3VXlUSXpFbUQvaExBS0Erd2NXVU8wcXAvSWZRN1RWMUxxQVNYVG43N2VF?=
 =?utf-8?B?bngwNVNoeS9LMEdoZzhXNnJGdmRHUTlqUTZFL0l4OU0wdThzTGhSRlpIZlcz?=
 =?utf-8?B?S1RaZTZtZmxobE9vQzRVdXVDT2xNYUo1RlFXMTRqbnJjbUtBYitRUDJJdDZD?=
 =?utf-8?B?a0FYMUNTdldRY0pQOVIxZmpaQmM0WDhwbnBCaUx1UnVQcG9YRjJqc2dUdG9D?=
 =?utf-8?B?dWJXV1AxQlUyUXQ0VXhnWlZGTnZQeGZrZ2xDVDZxaEgzbUZXZ2d6aXlPdGZn?=
 =?utf-8?B?a25BWkdEK3I3ekp6RWlEUTVZQVkwTlY3ZURRc291eldsTnNoL3ozUGZnV0c3?=
 =?utf-8?B?V3dKdklIUmJvTWlDcGJkbW5iVHk2a0tGRythNnEyaVFUQjdQRFlkTlhYeFRB?=
 =?utf-8?B?eHdqWkJud1pxR3J2NnRFTkFGZU5xZUJPL1A5RFFvMmJoT2E3M1J6SXVLeGJx?=
 =?utf-8?B?L29hZ2xnYTIySzk3U0lNaVpGcTJGSWwzNW1tU2oybWwrQWpnNW43N0x3Nk9F?=
 =?utf-8?B?WEZhZnZRN1g3Yy9CejFCY3hDNEl1eGluTzRmeElScmc1TEtyL21OWG1qb3pi?=
 =?utf-8?B?Y2N4dlB2dFZ0ZzVUblM1dzA4MWNWd09NRFlUSG1KTEw2VFJGTWR2MGJ6Ujd1?=
 =?utf-8?B?aVk2ZlREcjZ0bzN5WW91d2kwQ2wzZk5JMGYzUlBMTEJrWFkwbzhKUktmVFFJ?=
 =?utf-8?B?bWRTR01rUDVJZmNTRnVwd08vN3BDa0xzR215MVVJR1hOWmxTcGo3REI3by9u?=
 =?utf-8?B?QWUxZW9Fak84SzJoYWtYTEFhdW04bGJDQnF1TmhSa2QxWjJvd21tVXdKem85?=
 =?utf-8?B?SmJxV0ZiVjFOdnE5dTdtbFdvUmkyYitDK0hGanovQ2gwb3RTZUw5STN6RDds?=
 =?utf-8?B?Z240dVdJbUIrR0RqZ2NiaitKalZ4STBMSUV0TFlGS0J6MzR1OElEc2p4aFR0?=
 =?utf-8?B?THdQQU9lcmttTWF5VytTQ01yZWZwTCtIT2Q2cy9YS3EzR3FBb1JCSk9BWWlZ?=
 =?utf-8?B?dG9oQ1BxaCs1NlhGdE9PZFVaUEdnYmhRUHdOdVdWVytYc2l0NC9rTk9PR2c0?=
 =?utf-8?B?T2cxNjd3ZEhHeUFZWkwvUWp0WlE4ZmJ3OVhwcktCdkhiWmQ0R2Q0Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E68137B4CF247E4D8B60690E507F13D5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2270420e-0a25-48e6-016d-08d9ea449756
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 14:17:36.6057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hvKgFDkiSxlLxvtFYX1iBoANOVKImlsfLvHNvPiTFEHXhmgrvScZyBuaL9hVqAPxQmGTPcdZL0e3pm05ySTYvrGcH0jyQPe5GhaI4RmlTRRuJOKOI+SPGftyXxTJopAH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8161
X-Proofpoint-GUID: CeXT7c2qfJTAXVTt9cCjtMojXV92fRDo
X-Proofpoint-ORIG-GUID: CeXT7c2qfJTAXVTt9cCjtMojXV92fRDo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070092

DQoNCk9uIDA3LjAyLjIyIDE0OjU0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDcuMDIuMjAy
MiAxMzo1MSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDcuMDIu
MjIgMTQ6MzgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjAyLjIwMjIgMTI6MjcsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNy4wMi4yMiAwOToyOSwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAwNC4wMi4yMDIyIDE1OjM3LCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAwNC4wMi4yMiAxNjozMCwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+Pj4+Pj4+IE9uIDA0LjAyLjIwMjIgMDc6MzQsIE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIHdyb3RlOg0KPj4+Pj4+Pj4gUmVzZXQgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgd2hlbiBhc3Np
Z25pbmcgYSBQQ0kgZGV2aWNlIHRvIGEgZ3Vlc3Q6DQo+Pj4+Pj4+PiBhY2NvcmRpbmcgdG8gdGhl
IFBDSSBzcGVjIHRoZSBQQ0lfQ09NTUFORCByZWdpc3RlciBpcyB0eXBpY2FsbHkgYWxsIDAncw0K
Pj4+Pj4+Pj4gYWZ0ZXIgcmVzZXQuDQo+Pj4+Pj4+IEl0J3Mgbm90IGVudGlyZWx5IGNsZWFyIHRv
IG1lIHdoZXRoZXIgc2V0dGluZyB0aGUgaGFyZHdhcmUgcmVnaXN0ZXIgdG8NCj4+Pj4+Pj4gemVy
byBpcyBva2F5LiBXaGF0IHdhbnRzIHRvIGJlIHplcm8gaXMgdGhlIHZhbHVlIHRoZSBndWVzdCBv
YnNlcnZlcw0KPj4+Pj4+PiBpbml0aWFsbHkuDQo+Pj4+Pj4gInRoZSBQQ0kgc3BlYyBzYXlzIHRo
ZSBQQ0lfQ09NTUFORCByZWdpc3RlciBpcyB0eXBpY2FsbHkgYWxsIDAncyBhZnRlciByZXNldC4i
DQo+Pj4+Pj4gV2h5IHdvdWxkbid0IGl0IGJlIG9rPyBXaGF0IGlzIHRoZSBleGFjdCBjb25jZXJu
IGhlcmU/DQo+Pj4+PiBUaGUgY29uY2VybiBpcyAtIGFzIHZvaWNlZCBpcyBzaW1pbGFyIHdheXMg
YmVmb3JlLCBwZXJoYXBzIGluIG90aGVyDQo+Pj4+PiBjb250ZXh0cyAtIHRoYXQgeW91IG5lZWQg
dG8gY29uc2lkZXIgYml0LWJ5LWJpdCB3aGV0aGVyIG92ZXJ3cml0aW5nDQo+Pj4+PiB3aXRoIDAg
d2hhdCBpcyBjdXJyZW50bHkgdGhlcmUgaXMgb2theS4gWGVuIGFuZC9vciBEb20wIG1heSBoYXZl
IHB1dA0KPj4+Pj4gdmFsdWVzIHRoZXJlIHdoaWNoIHRoZXkgZXhwZWN0IHRvIHJlbWFpbiB1bmFs
dGVyZWQuIEkgZ3Vlc3MNCj4+Pj4+IFBDSV9DT01NQU5EX1NFUlIgaXMgYSBnb29kIGV4YW1wbGU6
IFdoaWxlIHRoZSBndWVzdCdzIHZpZXcgb2YgdGhpcw0KPj4+Pj4gd2lsbCB3YW50IHRvIGJlIHpl
cm8gaW5pdGlhbGx5LCB0aGUgaG9zdCBoYXZpbmcgc2V0IGl0IHRvIDEgbWF5IG5vdA0KPj4+Pj4g
ZWFzaWx5IGJlIG92ZXJ3cml0dGVuIHdpdGggMCwgb3IgZWxzZSB5b3UnZCBlZmZlY3RpdmVseSBp
bXBseSBnaXZpbmcNCj4+Pj4+IHRoZSBndWVzdCBjb250cm9sIG9mIHRoZSBiaXQuDQo+Pj4+IFdl
IGhhdmUgYWxyZWFkeSBkaXNjdXNzZWQgaW4gZ3JlYXQgZGV0YWlsIFBDSV9DT01NQU5EIGVtdWxh
dGlvbiBbMV0uDQo+Pj4+IEF0IHRoZSBlbmQgeW91IHdyb3RlIFsxXToNCj4+Pj4gIldlbGwsIGlu
IG9yZGVyIGZvciB0aGUgd2hvbGUgdGhpbmcgdG8gYmUgc2VjdXJpdHkgc3VwcG9ydGVkIGl0IG5l
ZWRzIHRvDQo+Pj4+IGJlIGV4cGxhaW5lZCBmb3IgZXZlcnkgYml0IHdoeSBpdCBpcyBzYWZlIHRv
IGFsbG93IHRoZSBndWVzdCB0byBkcml2ZSBpdC4NCj4+Pj4gVW50aWwgeW91IG1lYW4gdlBDSSB0
byByZWFjaCB0aGF0IHN0YXRlLCBsZWF2aW5nIFRPRE8gbm90ZXMgaW4gdGhlIGNvZGUNCj4+Pj4g
Zm9yIGFueXRoaW5nIG5vdCBpbnZlc3RpZ2F0ZWQgbWF5IGluZGVlZCBiZSBnb29kIGVub3VnaC4N
Cj4+Pj4NCj4+Pj4gSmFuIg0KPj4+Pg0KPj4+PiBTbywgdGhpcyBpcyB3aHkgSSBsZWZ0IGEgVE9E
TyBpbiB0aGUgUENJX0NPTU1BTkQgZW11bGF0aW9uIGZvciBub3cgYW5kIG9ubHkNCj4+Pj4gY2Fy
ZSBhYm91dCBJTlR4IHdoaWNoIGlzIGhvbm9yZWQgd2l0aCB0aGUgY29kZSBpbiB0aGlzIHBhdGNo
Lg0KPj4+IFJpZ2h0LiBUaGUgaXNzdWUgSSBzZWUgaXMgdGhhdCB0aGUgZGVzY3JpcHRpb24gZG9l
cyBub3QgaGF2ZSBhbnkNCj4+PiBtZW50aW9uIG9mIHRoaXMsIGJ1dCBpbnN0ZWFkIHRhbGtzIGFi
b3V0IHNpbXBseSB3cml0aW5nIHplcm8uDQo+PiBIb3cgZG8geW91IHdhbnQgdGhhdCBtZW50aW9u
ZWQ/IEV4dGVuZGVkIGNvbW1pdCBtZXNzYWdlIG9yDQo+PiBqdXN0IGEgbGluayB0byB0aGUgdGhy
ZWFkIFsxXT8NCj4gV2hhdCBJJ2QgbGlrZSB5b3UgdG8gZGVzY3JpYmUgaXMgd2hhdCB0aGUgY2hh
bmdlIGRvZXMgd2l0aG91dA0KPiBmdW5kYW1lbnRhbGx5IGltcGx5aW5nIGl0J2xsIGVuZCB1cCBi
ZWluZyB6ZXJvIHdoaWNoIGdldHMgd3JpdHRlbg0KPiB0byB0aGUgcmVnaXN0ZXIuIFN0YXRpbmcg
YXMgYSBjb25jbHVzaW9uIHRoYXQgZm9yIHRoZSB0aW1lIGJlaW5nDQo+IHRoaXMgbWVhbnMgd3Jp
dGluZyB6ZXJvIGlzIGNlcnRhaW5seSBmaW5lIChhbmQgbGlrZWx5IGhlbHBmdWwgaWYNCj4gbWFk
ZSBleHBsaWNpdCkuDQpYZW4gYW5kL29yIERvbTAgbWF5IGhhdmUgcHV0IHZhbHVlcyBpbiBQQ0lf
Q09NTUFORCB3aGljaCB0aGV5IGV4cGVjdA0KdG8gcmVtYWluIHVuYWx0ZXJlZC4gUENJX0NPTU1B
TkRfU0VSUiBiaXQgaXMgYSBnb29kIGV4YW1wbGU6IHdoaWxlIHRoZQ0KZ3Vlc3QncyB2aWV3IG9m
IHRoaXMgd2lsbCB3YW50IHRvIGJlIHplcm8gaW5pdGlhbGx5LCB0aGUgaG9zdCBoYXZpbmcgc2V0
DQppdCB0byAxIG1heSBub3QgZWFzaWx5IGJlIG92ZXJ3cml0dGVuIHdpdGggMCwgb3IgZWxzZSB3
ZSdkIGVmZmVjdGl2ZWx5DQppbXBseSBnaXZpbmcgdGhlIGd1ZXN0IGNvbnRyb2wgb2YgdGhlIGJp
dC4gVGh1cywgUENJX0NPTU1BTkQgcmVnaXN0ZXIgbmVlZHMNCnByb3BlciBlbXVsYXRpb24gaW4g
b3JkZXIgdG8gaG9ub3IgaG9zdCdzIHNldHRpbmdzLg0KDQpUaGVyZSBhcmUgZXhhbXBsZXMgb2Yg
ZW11bGF0b3JzIFsxXSwgWzJdIHdoaWNoIGFscmVhZHkgZGVhbCB3aXRoIFBDSV9DT01NQU5EDQpy
ZWdpc3RlciBlbXVsYXRpb24gYW5kIGl0IHNlZW1zIHRoYXQgYXQgbW9zdCB0aGV5IGNhcmUgYWJv
dXQgdGhlIG9ubHkgSU5UWA0KYml0IChiZXNpZGVzIElPL21lbW9yeSBlbmFibGUgYW5kIGJ1cyBt
dXN0ZXIgd2hpY2ggYXJlIHdyaXRlIHRocm91Z2gpLg0KSXQgY291bGQgYmUgYmVjYXVzZSBpbiBv
cmRlciB0byBwcm9wZXJseSBlbXVsYXRlIHRoZSBQQ0lfQ09NTUFORCByZWdpc3Rlcg0Kd2UgbmVl
ZCB0byBrbm93IGFib3V0IHRoZSB3aG9sZSBQQ0kgdG9wb2xvZ3ksIGUuZy4gaWYgYW55IHNldHRp
bmcgaW4gZGV2aWNlJ3MNCmNvbW1hbmQgcmVnaXN0ZXIgaXMgYWxpZ25lZCB3aXRoIHRoZSB1cHN0
cmVhbSBwb3J0IGV0Yy4NClRoaXMgbWFrZXMgbWUgdGhpbmsgdGhhdCBiZWNhdXNlIG9mIHRoaXMg
Y29tcGxleGl0eSBvdGhlcnMganVzdCBpZ25vcmUgdGhhdC4NCk5laXRoZXIgSSB0aGluayB0aGlz
IGNhbiBiZSBlYXNpbHkgZG9uZSBpbiBYZW4gY2FzZS4NCg0KQWNjb3JkaW5nIHRvICJQQ0kgTE9D
QUwgQlVTIFNQRUNJRklDQVRJT04sIFJFVi4gMy4wIiwgc2VjdGlvbiAiNi4yLjINCkRldmljZSBD
b250cm9sIiBzYXlzIHRoYXQgdGhlIHJlc2V0IHN0YXRlIG9mIHRoZSBjb21tYW5kIHJlZ2lzdGVy
IGlzDQp0eXBpY2FsbHkgMCwgc28gcmVzZXQgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgd2hlbiBhc3Np
Z25pbmcgYSBQQ0kgZGV2aWNlDQp0byBhIGd1ZXN0IHQgYWxsIDAncyBhbmQgZm9yIG5vdyBvbmx5
IG1ha2Ugc3VyZSBJTlR4IGJpdCBpcyBzZXQgYWNjb3JkaW5nDQp0byBpZiBNU0kvTVNJLVggZW5h
YmxlZC4NCg0KWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9xZW11L3FlbXUvYmxvYi9tYXN0ZXIvaHcv
eGVuL3hlbl9wdF9jb25maWdfaW5pdC5jI0wzMTANClsyXSBodHRwczovL2dpdGh1Yi5jb20vcHJv
amVjdGFjcm4vYWNybi1oeXBlcnZpc29yL2Jsb2IvbWFzdGVyL2h5cGVydmlzb3IvaHcvcGNpLmMj
TDMzNg0KDQpXaWxsIHRoZSBhYm92ZSBkZXNjcmlwdGlvbiBiZSBlbm91Z2g/DQoNCkl0IGFsc28g
c2VlbXMgdG8gYmUgYSBnb29kIG1vdmUgdG8gc3F1YXNoIHRoZSBmb2xsb3dpbmcgcGF0Y2hlczoN
CltQQVRDSCB2NiAwOS8xM10gdnBjaS9oZWFkZXI6IGVtdWxhdGUgUENJX0NPTU1BTkQgcmVnaXN0
ZXIgZm9yIGd1ZXN0cw0KW1BBVENIIHY2IDEwLzEzXSB2cGNpL2hlYWRlcjogcmVzZXQgdGhlIGNv
bW1hbmQgcmVnaXN0ZXIgd2hlbiBhZGRpbmcgZGV2aWNlcw0KDQphcyB0aGV5IGltcGxlbWVudCBh
IHNpbmdsZSBwaWVjZSBvZiBmdW5jdGlvbmFsaXR5IG5vdy4NCj4+IFdpdGggdGhlIGFib3ZlIGRv
bmUsIGRvIHlvdSB0aGluayB0aGF0IHdyaXRpbmcgMCdzIGlzIGFuIGFjY2VwdGFibGUNCj4+IGFw
cHJvYWNoIGFzIG9mIG5vdz8NCj4gV2VsbCwgeWVzLCBwcm92aWRlZCB3ZSBoYXZlIGEgc3VmZmlj
aWVudGx5IHNpbWlsYXIgdW5kZXJzdGFuZGluZw0KPiBvZiB3aGF0ICJhY2NlcHRhYmxlIiBoZXJl
IG1lYW5zLg0KPg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

