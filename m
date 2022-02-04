Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20764A985C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 12:25:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265409.458778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFwiO-0003ty-Gb; Fri, 04 Feb 2022 11:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265409.458778; Fri, 04 Feb 2022 11:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFwiO-0003rf-C9; Fri, 04 Feb 2022 11:25:20 +0000
Received: by outflank-mailman (input) for mailman id 265409;
 Fri, 04 Feb 2022 11:25:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+82=ST=epam.com=prvs=4034f0a382=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFwiM-0003rZ-6N
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 11:25:18 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fb93447-85ad-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 12:25:16 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 214BCnkn000943;
 Fri, 4 Feb 2022 11:25:11 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e11uerb1n-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 11:25:11 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7265.eurprd03.prod.outlook.com (2603:10a6:20b:266::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.16; Fri, 4 Feb
 2022 11:25:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 11:25:06 +0000
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
X-Inumbo-ID: 1fb93447-85ad-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GE72b01n+6nYD2ecYad4INC0lHSp7gES93QxxV3jjS8VxUtFxyHFPP2RcH9Fp65Lar1q9FW+Zzjax+SKEsRilrkn+ToajGVg3mAzGg1+iWr8NxwKGfIG6iF5R/OzAjTexR2CvugiFqXb1iy0BIyryDJv0eVe6KWvBzm2IXvi6A/VoWBw5QOZpq2R+XayBVD0XKCQeKrnG3eGajh22uEoMpXNT/dVnumYkApvHVhacaws+GO6Uye5w8+fbDbc+4xvj1HAWLMyUrRP3r9n0saLZdflJcdp+0R2mar6pMFzSLssnsg6a5pM223U0/CXi6E5kR0flc0aRinxiIgm9tAfNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qj3zpZmujP9hb71x77ZPgyJjmC8HFxdi35CoBI/TN6Y=;
 b=Z1BK0Mfv7DTHVrI8ZSGYlmezo7co0uo04F9vYrxcJoFtzxTy2Lm/6v4wexUbfx/dnQjUoUc0qhldiXx7VfGeuiqnngMsSqlMLq2FkS3rVTtjxEg6vUR4jchGt7+AFbnoFgdgezL35SShC/Jkebg5YdE77yGpEvcNIYY2YKN8Z/KP3YAxLaDoTvUYUPrCekKP7Y6UdEpNwHv2GiqVWBypeQmu3lKPMeL2ggeNDDEOjhnwaHx0pbqGYVgyd8rTgcbp47YESzuuUAvyYbaxNZvvFpBn+1lHqlmW8pcGcm/KPxR2Po2RPCODhKyTFtMOPcEkOIVSifBrhdHApOSZ8YjWFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qj3zpZmujP9hb71x77ZPgyJjmC8HFxdi35CoBI/TN6Y=;
 b=aaZ4t3dyaTeLZVjweeB3rfF34LzQAJbDJeAN8JEuNi0IOz+J0jCOlE33KvrJl8WLZexLtwtWGttACZGV7hDBGS9VDHx6RNkoZrOFHCFCU8H5BCaAQmpfhqHeb9PWkfRqmsPBBd3wmSSKXi4HeOdY3XpVpBhRz2zbPQHR4eRiohMhi4iuptmaVUEjahfhnbS+1p6QIpiQNdbbLQ7+eWrmT7hpqs9rRRdTWpd/s0LFmIkCukjhSh7iBCW31p5w4l3ICV98WI7WXVlwh7jmA3rGFKVX5FNMGN2dk704Xq8M2MZw7vL2YLaJRxJOe1wEIG68XhbxXbUjwd3zVm/SxyEzbQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 01/13] xen/pci: arm: add stub for is_memory_hole
Thread-Topic: [PATCH v6 01/13] xen/pci: arm: add stub for is_memory_hole
Thread-Index: 
 AQHYGZFbEg6Erttt1UCNei+XrySHEqyDFYiAgAAC4gCAAAsigIAAAbyAgAAC0oCAAAq4gIAABvIAgAAG0IA=
Date: Fri, 4 Feb 2022 11:25:06 +0000
Message-ID: <111cab0d-b61b-6a93-ba49-f29e4fd16b60@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-2-andr2000@gmail.com>
 <000ac24e-fdac-855d-7fb4-2165a1192ea4@xen.org>
 <19e50632-5865-9a75-756b-88db85007e96@epam.com>
 <d9741ff0-2152-6792-5249-09e3b0960972@xen.org>
 <43cab3d0-1a62-dca0-0d2d-5ea8fe237b21@epam.com>
 <ad90a3df-7049-8ff2-979a-dec3b8c542a1@xen.org>
 <86e51f3c-6ef8-a86d-acf3-38334db430a7@epam.com>
 <e5f0fd5d-b685-c559-6850-c2e06824b7d7@xen.org>
In-Reply-To: <e5f0fd5d-b685-c559-6850-c2e06824b7d7@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40a39077-18c9-4c84-b3e8-08d9e7d0fee2
x-ms-traffictypediagnostic: AM9PR03MB7265:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB72658E64CBEA1EFA508B3B47E7299@AM9PR03MB7265.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LjQRL+qkQcwZoYoK8efZcBP9HggWmwxeouC+P26TEgVDzrSglLBIr29lZ4SAK2Tme8Se9Phd0pKKoYIsCcI+YckEiUm2WT4v4axln57gN8g2RfC1A44HbL24OezN4/zMKBzbaR8BG2qq9eHq+vN43xAbif1y+BiQYGvFZ3WCsqmFfwznmGm8aUcebLMuAKYW7q2XuTLjQ4ZdUMwQLW7lh5PN3kVklaq3aEBb1nZhu6n+DNzfpoGrAwVx12OAImGpsdyd9q4kCM0kB4OFptanE8a3H/kPyJkGi79a+JQEPijzQGptFDn6P/EeedmDwfYc5uUl2P43jF63VCZB8L8BWHJ+Q3QkKKr6JeqhVC+ajemnY9rnFblFqDZo0wMTg66bA8/gNZ/+OcIk+En43L7CvaaxPtNqErirt9bA/Ovlsz4dlUJMWmiNqJ68kC8N6BZvZ9HxqCo4IXDcPO96WFr0yqQ/+dkBBBYwd5+PfMc6XYOudSLn2A6NK+G42V16ugwFMMzufkwhCNU5jNsIcKcZAtbsJ8M/25A+Sk5+Z+dTVUIMN7LcbugRLL8JHPHBpWQ19BzlGgeUnH/YDXdo97/2a805GA/oHQ1NMz5x3JTbQKZLYwK/UMyMhYKOQVmhRJ55KmRvYQ1bGC1o8y8BDC8U25dwlRDhtTiOfl4esLTVc6w+UhcSaTtbP41DNeRSXAN5QW3s7M15+g6qJJspdAzhA0qjwEHHSr2ZdVYIy6SVSVS+PbIpABEu6M6uiV9uIpwT
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(5660300002)(7416002)(31696002)(2906002)(107886003)(71200400001)(36756003)(6486002)(508600001)(31686004)(316002)(38100700002)(122000001)(38070700005)(26005)(186003)(110136005)(86362001)(53546011)(6506007)(2616005)(54906003)(6512007)(76116006)(8936002)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(91956017)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dmZPYWQvNkppV0JGa2JHSWg0VDQ0ZS9aVXZHSW4rNHlvd3UzZVhTS1F0elgy?=
 =?utf-8?B?RmVaQ1V0NzNKZkx0dVgxcVpqVmNnTWFObHhKZ3NaRFpoTVFSNDhvWk5yQ09S?=
 =?utf-8?B?QUFpQlBEczQvRHRrdUIyWTRaWEd0OWRWRW5SNTRMK1l6c0pSazlVWjFRM2RB?=
 =?utf-8?B?anpxUXNMRERTUjJGeDJOV0ZOaFFUakM4UXVrVTJTQ041S3JQUmlrU2NCSUFh?=
 =?utf-8?B?cHY5TER2VUpYRVVnNUtiTm9DTkNUZU5Qc1ZtMGtYSW9lVkFUT0VLbU1PTHRm?=
 =?utf-8?B?dlROMXk5MU5zdG43TkFNTXJqUVJpV2hRQW9hc2tORnBnbjNuQjFyZ0VuWC90?=
 =?utf-8?B?YU95M2RBbGVYM3l4Sm4zWHByczRNelp2OEtHNUhYQ2kyVXAzODhjSmxmVGdB?=
 =?utf-8?B?dVkzdGhOZHAwVlNtZEpKczZjRmlpVzJuVnpGWmNjb3IyMWNFWTN3aFEzdSs5?=
 =?utf-8?B?RlhmZTlOSVBCb09wVllnblJLT3l1cDRoTWJ6alRMUERKQ0lMTUZVWnluSGlY?=
 =?utf-8?B?cVYrYUpheHpoUUtpOUhIaFlISjR3ZGVlWHJXRm5BRHZjSkVWZFRQdlBKaWt1?=
 =?utf-8?B?U3NaM1FFRkFFTHZaVUsvU2RubGdFNXRXZlJPY0owZXpDVlZrNXFoNnp1cVlN?=
 =?utf-8?B?bTkzZ0JxalN1M25FTkpYalAxUFZkTGVYbGZDTm11Qm8wN0JjeWJ1WUZNRXc3?=
 =?utf-8?B?TVN6aVdpNWpGcG5sZExqRlNwZ3lENnVSaG50ak9TNTlrUzFSNXB6Y1dpRVVt?=
 =?utf-8?B?K2dhY1EyUDJwUUFjTTZNRW5mYjZ4cjdEZXlzU0d0SHQvWGFFcVhRWGN6K1dy?=
 =?utf-8?B?cFg3THcraGxDaEZ4ZFJmNFJwUStrZXdtVzBDcmZ2N0YzYnF2eGJnWU9JaWRJ?=
 =?utf-8?B?Z2ZkUWE3UnhXQVFRRHZNd2VSVEFibHlQYmdMZERuSGV3RVNOU2srRXVTOU93?=
 =?utf-8?B?QVBjemQraXhSZjlTNVRLdmNkdDVZUU5JbUk3aVVOT1UyUVBuNnd0SzdKd3p6?=
 =?utf-8?B?dlk5WGFRN0d4c3pib0ZjZmEyTStNT2tGd0lMY2FxZFdSUWZkQnNTZHZXQ0hL?=
 =?utf-8?B?b1FXQld3c09NdVVFdUVYaDJFRUVxeEhrM0w1aVY3cjJuMnN0bUdBSkhNSW14?=
 =?utf-8?B?UHcxT0xSbFQ3TmxhaVZnR1VPRWJTSFdLSi92L2g2Y0pUeU1hckk3MEVQVXlS?=
 =?utf-8?B?bHdVYzc2VlA0d1Q3cmtheEhqNnVLWWVGeEJZMUkvak93b2NTa2FqRW0vWkRq?=
 =?utf-8?B?ZXFscU85cTQzRC9wMCtURkxlb3lsb3lMZzFVYUxCSjluYWJLSkI0NjhhNklh?=
 =?utf-8?B?NjQwYXRJVTBQVzM1NnlpRS9SSjJkQy9LaGpuTWpQOVkzanZkaFVPaDZjN0Fv?=
 =?utf-8?B?SVZYemhaU1RlUTFlbVVmME51R1o0eDI3bE91OUdFM2RoK0FNbm1valN6dDJB?=
 =?utf-8?B?MXR5VDR3YW9PSnhuWHZ3U283V2N2Y1JTSmdsQ0R3RFJRdmpVc05PeHNSWmFK?=
 =?utf-8?B?Q1RiNDRCQnBhbmVFNTYwbUR5cFJhZ205Z2h5UjVBYmZoN3owbm10b1ZuSWhY?=
 =?utf-8?B?eVIzb2JNWTNkK2pKdUl0RS9sZThQTFRvSzdIZlFBYkg1bDhBQjE1TmhpQlhm?=
 =?utf-8?B?VVovMmVzSmpyemcvRjVNbzJvRTF3STFUR0J5bTFEYjcvWHlXWWc0dmdWKzlx?=
 =?utf-8?B?Wk1FTG9taG5kVTdXYWxEcVd2YXhrQTZVK0lqa3Q1UDdPL1YzSEwvVlBZZjhr?=
 =?utf-8?B?a2FDcVNGUHhJakFMMXowaTRPZXRMK1RjOWJiVDQxYVM3SFgvZTIxeTZYc0h0?=
 =?utf-8?B?TzE0MStFbnhiMXpGaWhGUngwdEhmQUVrTDQ1YzZ6OHhJUXBWcG1XcEo0bUpR?=
 =?utf-8?B?ek9iS1IrOXE4SU56M1hmd0NKUHlUU0VwNkV5dzExd3NsYWNRc3F1R3BNRURy?=
 =?utf-8?B?UUYrZzQ4LzR3OTZKaVhyY0Y3L1lNZXpIT284bldDem16NHdkVFpjZTY0WHpu?=
 =?utf-8?B?RnREU1NxYzJGVkFYcjlwK2FIOHl2MWNKMVFydUQ0VGlBMTNGRWlNc1BsUGNB?=
 =?utf-8?B?YXFhYlJsSGZoeFVSRlFHNlp3Y0Q5ejJoUjRsVU92Q3ZRamllREhxRmNEQUov?=
 =?utf-8?B?eWdyMzViZkc4emlCNTVxSXI3RFVSQ2hxN1lsR20rM2tCbGtrczhoclBVcHdz?=
 =?utf-8?B?TDlMb05ycm9xYWR2QXRHek9Zc3lpcHJXU2xjdkRYWnVhUUNMMTR4N05obThZ?=
 =?utf-8?B?cGlOb2xKb21iZzUxSjZDQUo4L2phMW5Hd3hHOGI4MUJGck1pTnNLd3FaSExI?=
 =?utf-8?B?NmczakN2bjhQUGxYbVhsYkVOeGJONU9YSVdIZTZwNkFvd29PbFY3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C0DCDDD079B004C818428AFBF398156@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a39077-18c9-4c84-b3e8-08d9e7d0fee2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 11:25:06.4182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iFUw7dWdat3c74ZdZAmAixk9ojks/jJNZGAG2UVviAEql2XIQG14tkJfIeHoiQ0JfMn4CipCSo51tWPhaJrUuVQHUaCgIxnf/5zHDU3TzYYKQb0R22mJZj9cPWsP7qI+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7265
X-Proofpoint-ORIG-GUID: tEeiqVk91TArcxsPTkhJ4pPDZfEX7z5r
X-Proofpoint-GUID: tEeiqVk91TArcxsPTkhJ4pPDZfEX7z5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_04,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 mlxscore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202040062

DQoNCk9uIDA0LjAyLjIyIDEzOjAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+DQo+DQo+IE9uIDA0
LzAyLzIwMjIgMTA6MzUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4NCj4+DQo+
PiBPbiAwNC4wMi4yMiAxMTo1NywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpLA0KPj4+DQo+
Pj4gT24gMDQvMDIvMjAyMiAwOTo0NywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+
Pj4+Pj4gQ291bGQgeW91IHBsZWFzZSBoZWxwIG1lIHdpdGggdGhlIGV4YWN0IG1lc3NhZ2UgeW91
IHdvdWxkIGxpa2UgdG8gc2VlPw0KPj4+Pj4NCj4+Pj4+IEhlcmUgYSBzdW1tYXJ5IG9mIHRoZSBk
aXNjdXNzaW9uICgrIHNvbWUgbXkgZm9sbG93LXVwIHRob3VnaHRzKToNCj4+Pj4+DQo+Pj4+PiBp
c19tZW1vcnlfaG9sZSgpIHdhcyByZWNlbnRseSBpbnRyb2R1Y2VkIG9uIHg4NiAoc2VlIGNvbW1p
dCA3NWNjNDYwYTFiOGMgInhlbi9wY2k6IGRldGVjdCB3aGVuIEJBUnMgYXJlIG5vdCBzdWl0YWJs
eSBwb3NpdGlvbmVkIikgdG8gY2hlY2sgd2hldGhlciB0aGUgQkFSIGFyZSBwb3NpdGlvbmVkIG91
dHNpZGUgb2YgYSB2YWxpZCBtZW1vcnkgcmFuZ2UuIFRoaXMgd2FzIGludHJvZHVjZWQgdG8gd29y
ay1hcm91bmQgcXVpcmt5IGZpcm13YXJlLg0KPj4+Pj4NCj4+Pj4+IEluIHRoZW9yeSwgdGhpcyBj
b3VsZCBhbHNvIGhhcHBlbiBvbiBBcm0uIEluIHByYWN0aWNlLCB0aGlzIG1heSBub3QgaGFwcGVu
IGJ1dCBpdCBzb3VuZHMgYmV0dGVyIHRvIHNhbml0eSBjaGVjayB0aGF0IHRoZSBCQVIgY29udGFp
bnMgInZhbGlkIiBJL08gcmFuZ2UuDQo+Pj4+Pg0KPj4+Pj4gT24geDg2LCB0aGlzIGlzIGltcGxl
bWVudGVkIGJ5IGNoZWNraW5nIHRoZSByZWdpb24gaXMgbm90IGRlc2NyaWJlZCBpcyBpbiB0aGUg
ZTgyMC4gSUlVQywgb24gQXJtLCB0aGUgQkFScyBoYXZlIHRvIGJlIHBvc2l0aW9uZWQgaW4gcHJl
LWRlZmluZWQgcmFuZ2VzLiBTbyBJIHRoaW5rIGl0IHdvdWxkIGJlIHBvc3NpYmxlIHRvIGltcGxl
bWVudCBpc19tZW1vcnlfaG9sZSgpIGJ5IGdvaW5nIHRocm91Z2ggdGhlIGxpc3Qgb2YgaG9zdGJy
aWRnZXMgYW5kIGNoZWNrIHRoZSByYW5nZXMuDQo+Pj4+Pg0KPj4+Pj4gQnV0IGZpcnN0LCBJJ2Qg
bGlrZSB0byBjb25maXJtIG15IHVuZGVyc3RhbmRpbmcgd2l0aCBSYWh1bCwgYW5kIG90aGVycy4N
Cj4+Pj4+DQo+Pj4+PiBJZiB3ZSB3ZXJlIGdvaW5nIHRvIGdvIHRoaXMgcm91dGUsIEkgd291bGQg
YWxzbyByZW5hbWUgdGhlIGZ1bmN0aW9uIHRvIGJlIGJldHRlciBtYXRjaCB3aGF0IGl0IGlzIGRv
aW5nIChpLmUuIGl0IGNoZWNrcyB0aGUgQkFSIGlzIGNvcnJlY3RseSBwbGFjZWQpLiBBcyBhIHBv
dGVudGlhbGx5IG9wdGltaXphdGlvbi9oYXJkZW5pbmcgZm9yIEFybSwgd2UgY291bGQgcGFzcyB0
aGUgaG9zdGJyaWRnZSBzbyB3ZSBkb24ndCBoYXZlIHRvIHdhbGsgYWxsIG9mIHRoZW0uDQo+Pj4+
IEl0IHNlZW1zIHRoaXMgbmVlZHMgdG8gbGl2ZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdGhlbj8g
U28sIGl0IGlzIGVhc3kgdG8gZmluZA0KPj4+PiBhcyBldmVyeXRoaW5nIGFmdGVyICItLS0iIGlz
IGdvaW5nIHRvIGJlIGRyb3BwZWQgb24gY29tbWl0DQo+Pj4gSSBleHBlY3QgdGhlIGZ1bmN0aW9u
IHRvIGJlIGZ1bGx5IGltcGxlbWVudGVkIGJlZm9yZSB0aGlzIGlzIHdpbGwgYmUgbWVyZ2VkLg0K
Pj4+DQo+Pj4gU28gaWYgaXQgaXMgZnVsbHkgaW1wbGVtZW50ZWQsIHRoZW4gYSBmYWlyIGNodW5r
IG9mIHdoYXQgSSB3cm90ZSB3b3VsZCBub3QgYmUgbmVjZXNzYXJ5IHRvIGNhcnJ5IGluIHRoZSBj
b21taXQgbWVzc2FnZS4NCj4+IFdlbGwsIHdlIHN0YXJ0ZWQgZnJvbSB0aGF0IHdlIHdhbnQgKnNv
bWV0aGluZyogd2l0aCBUT0RPIGFuZCBub3cNCj4+IHlvdSByZXF1ZXN0IGl0IHRvIGJlIGZ1bGx5
IGltcGxlbWVudGVkIGJlZm9yZSBpdCBpcyBtZXJnZWQuDQo+DQo+IEkgZG9uJ3QgdGhpbmsgSSBl
dmVyIHN1Z2dlc3RlZCB0aGlzIHBhdGNoIHdvdWxkIGJlIG1lcmdlZCBhcy1pcy4gU29ycnkgaWYg
dGhpcyBtYXkgaGF2ZSBjcm9zc2VkIGxpa2UgdGhpcy4NCk5wDQo+DQo+IEluc3RlYWQsIG15IGlu
dGVudCBieSBhc2tpbmcgeW91IHRvIHNlbmQgYSBUT0RPIHBhdGNoIGlzIHRvIHN0YXJ0IGEgZGlz
Y3Vzc2lvbiBob3cgdGhpcyBmdW5jdGlvbiBjb3VsZCBiZSBpbXBsZW1lbnRlZCBmb3IgQXJtLg0K
Pg0KPiBZb3Ugc2VudCBhIFRPRE8gYnV0IHlvdSBkaWRuJ3QgcHJvdmlkZSBhbnkgc3VtbWFyeSBv
biB3aGF0IGlzIHRoZSBpc3N1ZSwgd2hhdCB3ZSB3YW50IHRvIGFjaGlldmUuLi4gSGVuY2UgbXkg
cmVxdWVzdCB0byBhZGQgYSBiaXQgbW9yZSBkZXRhaWxzIHNvIHRoZSBvdGhlciByZXZpZXdlcnMg
Y2FuIHByb3ZpZGUgdGhlaXIgb3BpbmlvbiBtb3JlIGVhc2lseS4NCk9rLCBzbyB3ZSBjYW4gZGlz
Y3VzcyBpdCBoZXJlLCBidXQgSSB3b24ndCBoYXZlIHRoaXMgcGF0Y2ggaW4gdjcNCj4NCj4gQ2hl
ZXJzLA0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

