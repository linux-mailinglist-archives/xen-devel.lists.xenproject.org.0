Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE4A4AD244
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 08:36:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267608.461357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHL2X-0006ne-Bs; Tue, 08 Feb 2022 07:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267608.461357; Tue, 08 Feb 2022 07:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHL2X-0006lg-8V; Tue, 08 Feb 2022 07:35:53 +0000
Received: by outflank-mailman (input) for mailman id 267608;
 Tue, 08 Feb 2022 07:35:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHL2W-0006la-3p
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 07:35:52 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbe3553e-88b1-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 08:35:49 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2185hYvW027891;
 Tue, 8 Feb 2022 07:35:43 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e3j920d7a-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 07:35:41 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by PA4PR03MB7101.eurprd03.prod.outlook.com (2603:10a6:102:eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 07:35:34 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:35:34 +0000
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
X-Inumbo-ID: bbe3553e-88b1-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hvnnp+L4K/qFR7pncIsp8AUH9T+wNVdBAbwwdgB7KLGQN8zGvtx1yuV4JvYjYj7mhs/zaEXDxn0wzbKRR/LYHz34SWjRZ2TjuNnsKNO7WOqPmPPcL+HvSuWhbG3I//93JA+cmPEF9AiJidvUgNrKkYQK8kT9rFVlOGWA+LMy93x5KVadTMzzrPAJq8CK/7Wsiov5WNNmFM3SZkmPeDJdPx5XxsQVrB4/nm2cSEotDY0KdgYoCuNCner0d+31sbZtJQsq8mZgxMwxP9i1pyx9+2SBjWMWfy2Nw1BtpIiFkuckUicyOHXO+RKt9V0cFnOjmoXXy3yMuomJh5SWOcAJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pn9nzzHmCPMZQ330jOvkVVzAhCffJTjMHNM9mARK4fM=;
 b=XFyUYvZVTxzc3Q0Hog8iRYpG+QaA4p9ba3uYsPvqxNCWU1AGka9MCDCqB6ajv5m23u9BCsD/6NS4+TUHtHmGL9pgZ0vbJUX2sodW+lHqocmYV9upKxb71WvSfDu2FPpHBU4TyKeBimLdIXbDbSi2tWtDb9h5gTV17I+fSN3MMTuS5Z2RTxR6SNIqpWDYNkAZxTrULlLY4fOB96P4LzhXlVnZB0gV9WA3lqsg3tuC02T6gyHIEqagACmFwvxWWsnpoIjN2oVBIKMX5UoNlP8v7rCeEKPlc6OnT+Z58TJ6mgg84+elBCVf/DW5U3tR70o0umFFYi0fWhaYOBWLRYrBvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pn9nzzHmCPMZQ330jOvkVVzAhCffJTjMHNM9mARK4fM=;
 b=JLWL8pprazAqmvxhG9/Bp5K1O5m6fPDrYCiZDtvWHPig/k2Qh9XVZQuURNUu6tPwQibn7BtDfO9DvcNx0iddfUG8t7MDjnLtFaD0y7k1UbZratjOSmwsCxo2DlA9skvY7oPzCNqJl5sBTEi2n2D7fdt8iTn2P3rdi4+YaQXY3xcuGFyCln3L1BHS2yA+V43yz5wbKJpAzPf7Rz+Hyu9sBflZ2ZjKoAbdzo1ULuokq/ix9YXlZ8yxtt2YnqCHWvboj7eBnIi1kJ9uNtzll3kRJf/MJvQ6Hxx/kf7uIxfirlz4+VvXiHCypwMyf3CgYhs1aNdA2HyHSNMGtdj3N+7P7A==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
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
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABnuAgAAQvgCAAAMCAIAAAY4AgAADxICAABrnAIAABAgAgAR3CoCAABt5gIAAEpuAgAAE5ICAAASKAIAAAiiAgAAKNYCAAARNAIAAC1wAgAACRYCAAAGVgIAABJiAgAAB5wCAAPjsgA==
Date: Tue, 8 Feb 2022 07:35:34 +0000
Message-ID: <e91965c5-0802-adf8-0c17-522f86ebf231@epam.com>
References: <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
 <YgEsRuckQJIQlkzf@Air-de-Roger>
 <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
 <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
 <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
 <4276fe72-558b-7d95-6430-d4330989dbe8@epam.com>
 <ad985f4a-10f0-4a2d-df02-cde915fea3f1@suse.com>
 <f7669670-8eeb-9966-5ba3-e8f9c03ce3d3@epam.com>
 <73e08285-6bb1-5842-899f-bd6502406e49@suse.com>
 <be3f4222-6580-4c89-a202-c003b6feb9b4@epam.com>
In-Reply-To: <be3f4222-6580-4c89-a202-c003b6feb9b4@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5a4f32a-0a2a-4c3d-e14d-08d9ead597b7
x-ms-traffictypediagnostic: PA4PR03MB7101:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB71015945297DFB2543CB5B97E72D9@PA4PR03MB7101.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 12Bw5VdoT4J4TLCSOU8KqM56qvJ6LXwVYiwxccWNMQ64tsY3+idB6Umhk1cNE3a/GGzdouDpMYvPFUo5rzQTKyUJeSruqCRxaXmO36yH7Wa8Ezt6I/cpgXDSRBa9CkdwE4Gyqmhvh9Q7xVpUdjUZQYrpsEa9q4tIxrwJV1Xif6dPv1Cn521MhXh7Pjb3ckIBm3tlfGBF9+352Vz6IGFnMgu9S9r8fyYJ0/9cMU24xSG4S7dmimtrWuk9Eo3PmuXDR7UtPrFFIOOfsGprYN0Ih6YfavtDM/Q1yUGiMQyd0M5mgm8gYKo32PRNKgtYav0/lt3kTmW3DDjk1eWAsOIpp7HRUPhLQx4S8SZ58clNjUpQKiS2qzMF8bCCnuFvYecHlSW+ED2EsEqaueyj6FmvJ7f+SQnaHEzCb+e4REXsmf/WMp7oL+SktAnJGesqXjzJhKMALrHmwDpAjTuJS9pylDRmHIKTC89PyUy9whz0bQA+uZJQSTbFMCAx0QfwVj+VX9Z0pl6RPjbAa473sKPZAm8VSRBDIglJqNHnr/ek1vvQG6qX2w8ApILoh8CcK0YaPqLsxF2XGJBm6JGHZ8NwuV596VI9EKmMOuRiZI65W3olnd/JUiZhFj6pHh/JBim/lZ8FRmY+1qqf5pN0mopvvI2khawitIu223PkKWONBc3YfpFZotWl8i4/J613zbm35gQA46To1bP31tjffIeXv9K1HBvvTD4ayrwmfMrFWBygyc3sDpTq+6FGWovAQH1Ko5cE0hKEcdkwVVRm6nPxDU34GYw1mlE9a3N5ZIr9MeRdmHiBFGOIBw2pPNuTH5Rz
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(66446008)(31686004)(316002)(2616005)(8676002)(66946007)(66556008)(66476007)(76116006)(31696002)(6506007)(91956017)(64756008)(8936002)(4326008)(6512007)(53546011)(71200400001)(110136005)(54906003)(508600001)(7416002)(83380400001)(86362001)(5660300002)(186003)(36756003)(122000001)(26005)(966005)(2906002)(38070700005)(6486002)(55236004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RTRienhpaFFTcUJrM3FlWlBmQUh4bjBJUzFES0RRc2JWTFpmamhsOHBVaklr?=
 =?utf-8?B?MjlONTVLMXFQSTZrNWhwRVhFR2FvdE05c2FNWGRVRG1yQUk3WTRVWi93QUVi?=
 =?utf-8?B?OGdPcjgwNS94Q1I0cStEVDQ1U29VS2V3YlZ5a3hGU016dXBVU1lKa1RQU1Ew?=
 =?utf-8?B?YU1vSWtRd201RjYyYy94cXRpTmFPV2x1V2hOOTFsRlFmYnVXQVlYRU9QWVV3?=
 =?utf-8?B?L1V3OXVUSVlEbTl3ZElTM3VGdXVkMmVQeUlxSElmQjUyNmVlOHBHRkdBTWN3?=
 =?utf-8?B?OXJaVkswOWZqMDdiblRab3RjQmdlR0hiVnlOZUY3N2JFWTBOOWFUeEltOWNQ?=
 =?utf-8?B?ZTZEV0ZSU1ZibkM3cGxWRFBMRTlmZC9HTzdGamp1L1ZlQkZ2bmpraWFteDFU?=
 =?utf-8?B?cEpKeDVKM3M0aTFWN0xUb0h1aDlIR3NzQVpucHBVRnZBLzBlQmJZMjY0cFY4?=
 =?utf-8?B?NEFhUUJ0MUhtNGdBLy83WUptaWRRSUxqVktwc1R4bkZ0cmVuZDdINnpqUnU0?=
 =?utf-8?B?WlJxZ2N4eGxTdit0YStZb0E3WlZ0SURCZEdoUDJKTVZJT05GUzNpWnExOGJw?=
 =?utf-8?B?Nmhwa1l1MFpQM3B5UnFST0IrU2taUURVandkcFlIY2pHVG9OQlpFRzB2NnFS?=
 =?utf-8?B?eU1VN0psUi9rQjJaSVpiQmlFYkZsZENqK0VLUnhUZVRWQ1FmcEtmSkg1aWs0?=
 =?utf-8?B?djQwZXMxVGVSajMvMmhINXE1ZzNiSGhvV2hnUlJYM1VkYXV0YmZqVXRkSUY1?=
 =?utf-8?B?aXIyRmd4bXJFay9LWFMrOW1oR0puYS92a3BnZmlGRHlDU0MvdEVhaU5VTytw?=
 =?utf-8?B?bVZUa1RjU2ExeWZKRWM2QUZva1V4SjNwQWNUU2Zzb0toano4S09RTW1ib25a?=
 =?utf-8?B?UktjTnhHenNxZjNVODd1N1RuQ2ZGL0dGS2NodzRYL1YzN0FOMWxKWU1MeVJQ?=
 =?utf-8?B?b1Q4WHJQcTlZcjNjV2xtLy9LUEJJUS8vV2JZUkhKN3BMUmRzN1RlVjlvSk9S?=
 =?utf-8?B?d1hJMWR3MEw1d2lOVnByLyswcmxmYXZqUlBheDZYSVZtWGxZWXZqSUh1SXNJ?=
 =?utf-8?B?NW9NMldjSHNMR3M5YmMwKzk0ejZ2bGo3NjJITklZT3dDU0lWT1lhWlppSXdO?=
 =?utf-8?B?dHJadEY0YUtxMzN5OHZPVkNWcWtxay9KM2FSWEZGK1NZaXYyakRtaTd3MENq?=
 =?utf-8?B?K2FoZDFwQUtrT2ZIQjJ6eU9yK0lFMGN0OWN5aTdUd2t2ZWxvMkpVcWNhYkly?=
 =?utf-8?B?Qnl1eVBGY29ENUZkR1U1YUhpK3psSkxBUnZtYXY0MUZBNkc2amNiVm9KVisw?=
 =?utf-8?B?c21VVCtRcUZUbkY0UDFxcmYvOE9SdXAzNWZaVjJwWXpLcDVCQWZZVWZNNEZF?=
 =?utf-8?B?MkREYW1jSDczdWZUUjhDM0w2czRQVUlkMmZGVWY5S3k5cmRFZFg4RmZwS245?=
 =?utf-8?B?Z25oRmo5WGJrYlZrTnFCY29lRW0ydEdzdVpMdytFUDQyYm1KVVk2K01rMWZC?=
 =?utf-8?B?cTJzbmVoMGlFWFV3c2hudjhSMGFnTUtEZDlFajliRlJIZktOSWpVNE4yaSt6?=
 =?utf-8?B?b0gvV2FrNWRTWnZzVFdjRW9vUTJkR2svVzc3NGJxbmJLcnkrbDdCTGtiWndt?=
 =?utf-8?B?VGhyT2VReDJZeFdEU29zU1lQbHVHdmJGb1QrVVg3YWRFY1NPUzExd3lLMVV5?=
 =?utf-8?B?dWxlamk3Z0psdkE5RVdLWW9JY2NqMTdNMVQ4QjRmc29WbTJoc0oySVF4dk4r?=
 =?utf-8?B?NmNpcVNIdkU1ZVdBKysxRTQ4dmpzZFFMYXBGaEtRUmJlVWN2U2h0Tkk4MlE1?=
 =?utf-8?B?VDBYcEVieGVROElIZWN3ZG5WTENtN0FnY0Zsek1pMHluVE5xbUV6K3FCR2Vt?=
 =?utf-8?B?NWJyTFJTdGEwZzZ4c3A0OTNVWVZzbUFnWXRSMEM1dFkwZ0pPK3lCZFZYdXk0?=
 =?utf-8?B?Njd0NXVLZkVZb2ZkWWM5bjIvd09MR21vb0NwNGF6R1VSUG55ZzZQNFgwZVlO?=
 =?utf-8?B?Um9nNHJaQys1bzFJTkkvVjZxTyswbVo2dlpyV2JWRVgwTUEvMllWalpzMmJC?=
 =?utf-8?B?OEhyaW1NZmloMThjODM3WkQ4VVdXTFV4VUlmS2tqR1IzbXQ2WGVFblpXOStD?=
 =?utf-8?B?SHlUa1hrK2R4WjRJeHRxSGZhdUFuUzIzU0tUbWFhQytKWUU2QU9zVGxIa0Mw?=
 =?utf-8?B?WGhZRU5lSUMxZ2U4NU4yRUtLOVdjMWhxM3V2ZnU1L2t5bEdyZTFQUjVtdjI3?=
 =?utf-8?B?Y0pVZHhuSEJGMnVFUFI1cUdVZU9nT1V5ZnVickRnYVdHeUp0eS9la0JmL21v?=
 =?utf-8?B?cjlsVkxDbGlZc1Z4Z3FSMFF1eXVmdThGZkNOb3g1OTN2dnZEQUkrYkVlZ1dL?=
 =?utf-8?Q?CFuiQJ1tXMKObmc8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACCE32CC8F033E4384E4D9C3A5F41170@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a4f32a-0a2a-4c3d-e14d-08d9ead597b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 07:35:34.2573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozckva1syKEq+LXqBCdewNMTP1d7OCPpwQfOStm0HvOAMXCV3rSyEihl87oaE4Za25r1+ssgYoGKfv4Y3EWYOvcGA1Z0jhRTbhAcA4IIbeBro2Jy5mPpGFSAReKQHpZB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7101
X-Proofpoint-ORIG-GUID: -BRspPAzALk10VXHnAUDbmuZdIwAGWvq
X-Proofpoint-GUID: -BRspPAzALk10VXHnAUDbmuZdIwAGWvq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202080039

DQoNCk9uIDA3LjAyLjIyIDE4OjQ0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4N
Cj4gT24gMDcuMDIuMjIgMTg6MzcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDcuMDIuMjAy
MiAxNzoyMSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4gT24gMDcuMDIuMjIg
MTg6MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAwNy4wMi4yMDIyIDE3OjA3LCBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+IE9uIDA3LjAyLjIyIDE3OjI2LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+Pj4+PiAxYi4gTWFrZSB2cGNpX3dyaXRlIHVzZSB3cml0ZSBsb2Nr
IGZvciB3cml0ZXMgdG8gY29tbWFuZCByZWdpc3RlciBhbmQgQkFScw0KPj4+Pj4+IG9ubHk7IGtl
ZXAgdXNpbmcgdGhlIHJlYWQgbG9jayBmb3IgYWxsIG90aGVyIHdyaXRlcy4NCj4+Pj4+IEkgYW0g
bm90IHF1aXRlIHN1cmUgaG93IHRvIGRvIHRoYXQuIERvIHlvdSBtZWFuIHNvbWV0aGluZyBsaWtl
Og0KPj4+Pj4gdm9pZCB2cGNpX3dyaXRlKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJl
ZywgdW5zaWduZWQgaW50IHNpemUsDQo+Pj4+PiAgICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHVpbnQzMl90IGRhdGEpDQo+Pj4+PiBbc25pcF0NCj4+Pj4+ICAgICDCoMKgwqAgbGlz
dF9mb3JfZWFjaF9lbnRyeSAoIHIsICZwZGV2LT52cGNpLT5oYW5kbGVycywgbm9kZSApDQo+Pj4+
PiB7DQo+Pj4+PiBbc25pcF0NCj4+Pj4+ICAgICDCoMKgwqAgaWYgKCByLT5uZWVkc193cml0ZV9s
b2NrKQ0KPj4+Pj4gICAgIMKgwqDCoCDCoMKgwqAgd3JpdGVfbG9jayhkLT52cGNpX2xvY2spDQo+
Pj4+PiAgICAgwqDCoMKgIGVsc2UNCj4+Pj4+ICAgICDCoMKgwqAgwqDCoMKgIHJlYWRfbG9jayhk
LT52cGNpX2xvY2spDQo+Pj4+PiAuLi4uDQo+Pj4+Pg0KPj4+Pj4gQW5kIHByb3ZpZGUgcncgYXMg
YW4gYXJndW1lbnQgdG86DQo+Pj4+Pg0KPj4+Pj4gaW50IHZwY2lfYWRkX3JlZ2lzdGVyKHN0cnVj
dCB2cGNpICp2cGNpLCB2cGNpX3JlYWRfdCAqcmVhZF9oYW5kbGVyLA0KPj4+Pj4gICAgIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2cGNpX3dyaXRlX3QgKndyaXRl
X2hhbmRsZXIsIHVuc2lnbmVkIGludCBvZmZzZXQsDQo+Pj4+PiAgICAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBzaXplLCB2b2lkICpkYXRh
LCAtLS0+Pj4gYm9vbCB3cml0ZV9wYXRoIDw8PC0tLS0tKQ0KPj4+Pj4NCj4+Pj4+IElzIHRoaXMg
d2hhdCB5b3UgbWVhbj8NCj4+Pj4gVGhpcyBzb3VuZHMgb3Zlcmx5IGNvbXBsaWNhdGVkLiBZb3Ug
Y2FuIGRlcml2ZSBsb2NhbGx5IGluIHZwY2lfd3JpdGUoKSwNCj4+Pj4gZnJvbSBqdXN0IGl0cyAi
cmVnIiBhbmQgInNpemUiIHBhcmFtZXRlcnMsIHdoZXRoZXIgdGhlIGxvY2sgbmVlZHMgdGFraW5n
DQo+Pj4+IGluIHdyaXRlIG1vZGUuDQo+Pj4gWWVzLCBJIHN0YXJ0ZWQgd3JpdGluZyBhIHJlcGx5
IHdpdGggdGhhdC4gU28sIHRoZSBzdW1tYXJ5IChST00NCj4+PiBwb3NpdGlvbiBkZXBlbmRzIG9u
IGhlYWRlciB0eXBlKToNCj4+PiBpZiAoIChyZWcgPT0gUENJX0NPTU1BTkQpIHx8IChyZWcgPT0g
Uk9NKSApDQo+Pj4gew0KPj4+ICAgIMKgwqDCoCByZWFkIFBDSV9DT01NQU5EIGFuZCBzZWUgaWYg
bWVtb3J5IG9yIElPIGRlY29kaW5nIGFyZSBlbmFibGVkLg0KPj4+ICAgIMKgwqDCoCBpZiAoIGVu
YWJsZWQgKQ0KPj4+ICAgIMKgwqDCoCDCoMKgwqAgd3JpdGVfbG9jayhkLT52cGNpX2xvY2spDQo+
Pj4gICAgwqDCoMKgIGVsc2UNCj4+PiAgICDCoMKgwqAgwqDCoMKgIHJlYWRfbG9jayhkLT52cGNp
X2xvY2spDQo+Pj4gfQ0KPj4gSG1tLCB5ZXMsIHlvdSBjYW4gYWN0dWFsbHkgZ2V0IGF3YXkgd2l0
aG91dCB1c2luZyAic2l6ZSIsIHNpbmNlIGJvdGgNCj4+IGNvbW1hbmQgcmVnaXN0ZXIgYW5kIFJP
TSBCQVIgYXJlIDMyLWJpdCBhbGlnbmVkIHJlZ2lzdGVycywgYW5kIDY0LWJpdA0KPj4gYWNjZXNz
ZXMgZ2V0IHNwbGl0IGluIHZwY2lfZWNhbV93cml0ZSgpLg0KPiBCdXQsIE9TIG1heSB3YW50IHJl
YWRpbmcgYSBzaW5nbGUgYnl0ZSBvZiBST00gQkFSLCBzbyBJIHRoaW5rDQo+IEknbGwgbmVlZCB0
byBjaGVjayBpZiByZWcrc2l6ZSBmYWxsIGludG8gUENJX0NPTUFORCBhbmQgUk9NIEJBUg0KPiBy
YW5nZXMNCj4+IEZvciB0aGUgY29tbWFuZCByZWdpc3RlciB0aGUgbWVtb3J5LSAvIElPLWRlY29k
aW5nLWVuYWJsZWQgY2hlY2sgbWF5DQo+PiBlbmQgdXAgYSBsaXR0bGUgbW9yZSBjb21wbGljYXRl
ZCwgYXMgdGhlIHZhbHVlIHRvIGJlIHdyaXR0ZW4gYWxzbw0KPj4gbWF0dGVycy4gTWF5YmUgcmVh
ZCB0aGUgY29tbWFuZCByZWdpc3RlciBvbmx5IGZvciB0aGUgUk9NIEJBUiB3cml0ZSwNCj4+IHVz
aW5nIHRoZSB3cml0ZSBsb2NrIHVuaWZvcm1seSBmb3IgYWxsIGNvbW1hbmQgcmVnaXN0ZXIgd3Jp
dGVzPw0KPiBTb3VuZHMgZ29vZCBmb3IgdGhlIHN0YXJ0Lg0KPiBBbm90aGVyIGNvbmNlcm4gaXMg
dGhhdCBpZiB3ZSBnbyB3aXRoIGEgcmVhZF9sb2NrIGFuZCB0aGVuIGluIHRoZQ0KPiB1bmRlcmx5
aW5nIGNvZGUgd2UgZGlzYWJsZSBtZW1vcnkgZGVjb2RpbmcgYW5kIHRyeSBkb2luZw0KPiBzb21l
dGhpbmcgYW5kIGNhbGxpbmcgY21kX3dyaXRlIGhhbmRsZXIgZm9yIGFueSByZWFzb24gdGhlbi4u
Li4NCj4NCj4gSSBtZWFuIHRoYXQgdGhlIGNoZWNrIGluIHRoZSB2cGNpX3dyaXRlIGlzIHNvbWV3
aGF0IHdlIGNhbiB0b2xlcmF0ZSwNCj4gYnV0IHRoZW4gaXQgaXMgbXVzdCBiZSBjb25zaWRlcmVk
IHRoYXQgbm8gY29kZSBpbiB0aGUgcmVhZCBwYXRoDQo+IGlzIGFsbG93ZWQgdG8gcGVyZm9ybSB3
cml0ZSBwYXRoIGZ1bmN0aW9ucy4gV2hpY2ggYnJpbmdzIGEgcHJldHR5DQo+IHZhbGlkIHVzZS1j
YXNlOiBzYXkgaW4gcmVhZCBtb2RlIHdlIGRldGVjdCBhbiB1bnJlY292ZXJhYmxlIGVycm9yDQo+
IGFuZCBuZWVkIHRvIHJlbW92ZSB0aGUgZGV2aWNlOg0KPiB2cGNpX3Byb2Nlc3NfcGVuZGluZyAt
PiBFUlJPUiAtPiB2cGNpX3JlbW92ZV9kZXZpY2Ugb3Igc2ltaWxhci4NCj4NCj4gV2hhdCBkbyB3
ZSBkbyB0aGVuPyBJdCBpcyBhbGwgZ29pbmcgdG8gYmUgZnJhZ2lsZS4uLg0KSSBoYXZlIHRyaWVk
IHRvIHN1bW1hcml6ZSB0aGUgb3B0aW9ucyB3ZSBoYXZlIHdydCBsb2NraW5nDQphbmQgd291bGQg
bG92ZSB0byBoZWFyIGZyb20gQFJvZ2VyIGFuZCBASmFuLg0KDQpJbiBldmVyeSB2YXJpYW50IHRo
ZXJlIGlzIGEgdGFzayBvZiBkZWFsaW5nIHdpdGggdGhlIG92ZXJsYXANCmRldGVjdGlvbiBpbiBt
b2RpZnlfYmFycywgc28gdGhpcyBpcyB0aGUgb25seSBwbGFjZSBhcyBvZiBub3cNCndoaWNoIG5l
ZWRzIHNwZWNpYWwgdHJlYXRtZW50Lg0KDQpFeGlzdGluZyBsaW1pdGF0aW9uczogdGhlcmUgaXMg
bm8gd2F5IHRvIHVwZ3JhZGUgYSByZWFkIGxvY2sgdG8gYSB3cml0ZQ0KbG9jaywgc28gcGF0aHMg
d2hpY2ggbWF5IHJlcXVpcmUgd3JpdGUgbG9jayBwcm90ZWN0aW9uIG5lZWQgdG8gdXNlDQp3cml0
ZSBsb2NrIGZyb20gdGhlIHZlcnkgYmVnaW5uaW5nLiBXb3JrYXJvdW5kcyBjYW4gYmUgYXBwbGll
ZC4NCg0KMS4gUGVyLWRvbWFpbiBydyBsb2NrLCBha2EgZC0+dnBjaV9sb2NrDQo9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KTm90
ZTogd2l0aCBwZXItZG9tYWluIHJ3IGxvY2sgaXQgaXMgcG9zc2libGUgdG8gZG8gd2l0aG91dCBp
bnRyb2R1Y2luZw0KcGVyLWRldmljZSBsb2Nrcywgc28gcGRldi0+dnBjaS0+bG9jayBjYW4gYmUg
cmVtb3ZlZCBhbmQgbm8gcGRldi0+dnBjaV9sb2NrDQpzaG91bGQgYmUgcmVxdWlyZWQuDQoNClRo
aXMgaXMgb25seSBnb2luZyB0byB3b3JrIGluIGNhc2UgaWYgdnBjaV93cml0ZSBhbHdheXMgdGFr
ZXMgdGhlIHdyaXRlIGxvY2sNCmFuZCB2cGNpX3JlYWQgdGFrZXMgYSByZWFkIGxvY2sgYW5kIG5v
IHBhdGggaW4gdnBjaV9yZWFkIGlzIGFsbG93ZWQgdG8NCnBlcmZvcm0gd3JpdGUgcGF0aCBvcGVy
YXRpb25zLg0KdnBjaV9wcm9jZXNzX3BlbmRpbmcgdXNlcyB3cml0ZSBsb2NrIGFzIGl0IGhhdmUg
dnBjaV9yZW1vdmVfZGV2aWNlIGluIGl0cw0KZXJyb3IgcGF0aC4NCg0KUHJvczoNCi0gbm8gcGVy
LWRldmljZSB2cGNpIGxvY2sgaXMgbmVlZGVkPw0KLSBzb2x2ZXMgb3ZlcmxhcCBjb2RlIEFCQkEg
aW4gbW9kaWZ5X2JhcnMNCg0KQ29uczoNCi0gYWxsIHdyaXRlcyBhcmUgc2VyaWFsaXplZA0KLSBu
ZWVkIHRvIGNhcmVmdWxseSBzZWxlY3QgcmVhZCBwYXRocywgc28gdGhleSBhcmUgZ3VhcmFudGVl
ZCBub3QgdG8gbGVhZA0KIMKgIHRvIGxvY2sgdXBncmFkZSB1c2UtY2FzZXMNCg0KMS4xLiBTZW1p
IHJlYWQgbG9jayB1cGdyYWRlIGluIG1vZGlmeSBiYXJzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KSW4gdGhpcyBjYXNlIGJv
dGggdnBjaV9yZWFkIGFuZCB2cGNpX3dyaXRlIHRha2UgYSByZWFkIGxvY2sgYW5kIHdoZW4gaXQg
Y29tZXMNCnRvIG1vZGlmeV9iYXJzOg0KDQoxLiByZWFkX3VubG9jayhkLT52cGNpX2xvY2spDQoy
LiB3cml0ZV9sb2NrKGQtPnZwY2lfbG9jaykNCjMuIENoZWNrIHRoYXQgcGRldi0+dnBjaSBpcyBz
dGlsbCBhdmFpbGFibGUgYW5kIGlzIHRoZSBzYW1lIG9iamVjdDoNCmlmIChwZGV2LT52cGNpICYm
IChwZGV2LT52cGNpID09IG9sZF92cGNpKSApDQp7DQogwqDCoMKgIC8qIHZwY2kgc3RydWN0dXJl
IGlzIHZhbGlkIGFuZCBjYW4gYmUgdXNlZC4gKi8NCn0NCmVsc2UNCnsNCiDCoMKgwqAgLyogdnBj
aSBoYXMgZ29uZSwgcmV0dXJuIGFuIGVycm9yLiAqLw0KfQ0KDQpQcm9zOg0KLSBubyBwZXItZGV2
aWNlIHZwY2kgbG9jayBpcyBuZWVkZWQ/DQotIHNvbHZlcyBvdmVybGFwIGNvZGUgQUJCQSBpbiBt
b2RpZnlfYmFycw0KLSByZWFkZXJzIGFuZCB3cml0ZXJzIGFyZSBOT1Qgc2VyaWFsaXplZA0KLSBO
TyBuZWVkIHRvIGNhcmVmdWxseSBzZWxlY3QgcmVhZCBwYXRocywgc28gdGhleSBhcmUgZ3VhcmFu
dGVlZCBub3QgdG8gbGVhZA0KIMKgIHRvIGxvY2sgdXBncmFkZSB1c2UtY2FzZXMNCg0KQ29uczoN
Ci0gPz8/DQoNCjIuIHBlci1kZXZpY2UgbG9jayAocGRldi0+dnBjaV9sb2NrKSArIGQtPm92ZXJs
YXBfY2hrX2xvY2sNCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09DQpJbiBvcmRlciB0byBzb2x2ZSBvdmVybGFwIEFCQkEsIHdlIGlu
dHJvZHVjZSBhIHBlci1kb21haW4gaGVscGVyDQpsb2NrIHRvIHByb3RlY3QgdGhlIG92ZXJsYXBw
aW5nIGNvZGUgaW4gbW9kaWZ5X2JhcnM6DQoNCiDCoMKgwqAgb2xkX3ZwY2kgPSBwZGV2LT52cGNp
Ow0KIMKgwqDCoCBzcGluX3VubG9jayhwZGV2LT52cGNpX2xvY2spOw0KIMKgwqDCoCBzcGluX2xv
Y2socGRldi0+ZG9tYWluLT5vdmVybGFwX2Noa19sb2NrKTsNCiDCoMKgwqAgc3Bpbl9sb2NrKHBk
ZXYtPnZwY2lfbG9jayk7DQogwqDCoMKgIGlmICggcGRldi0+dnBjaSAmJiAocGRldi0+dnBjaSA9
PSBvbGRfdnBjaSkgKQ0KIMKgwqDCoMKgwqDCoMKgIGZvcl9lYWNoX3BkZXYgKCBwZGV2LT5kb21h
aW4sIHRtcCApDQogwqDCoMKgwqDCoMKgwqAgew0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KCB0bXAgIT0gcGRldiApDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB7DQogwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHNwaW5fbG9jayh0bXAtPnZwY2lfbG9jayk7DQogwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggdG1wLT52cGNpICkNCiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4NCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCiDC
oMKgwqDCoMKgwqDCoCB9DQoNClByb3M6DQotIGFsbCBhY2Nlc3NlcyBhcmUgaW5kZXBlbmRlbnQs
IG9ubHkgdGhlIHNhbWUgZGV2aWNlIGFjY2VzcyBpcyBzZXJpYWxpemVkDQotIG5vIG5lZWQgdG8g
Y2FyZSBhYm91dCByZWFkZXJzIGFuZCB3cml0ZXJzIHdydCByZWFkIGxvY2sgdXBncmFkZSBpc3N1
ZXMNCg0KQ29uczoNCi0gaGVscGVyIHNwaW4gbG9jaw0KDQozLiBNb3ZlIG92ZXJsYXAgZGV0ZWN0
aW9uIGludG8gcHJvY2VzcyBwZW5kaW5nDQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KVGhlcmUgaXMgYSBSb2dlcidzIHBhdGNo
IFsxXSB3aGljaCBhZGRzIGEgcG9zc2liaWxpdHkgZm9yIHZwY2lfcHJvY2Vzc19wZW5kaW5nDQp0
byBwZXJmb3JtIGRpZmZlcmVudCB0YXNrcyByYXRoZXIgdGhhbiBqdXN0IG1hcC91bm1hcC4gV2l0
aCB0aGlzIHBhdGNoIGV4dGVuZGVkDQppbiBhIHdheSB0aGF0IGl0IGNhbiBob2xkIGEgcmVxdWVz
dCBxdWV1ZSBpdCBpcyBwb3NzaWJsZSB0byBkZWxheSBleGVjdXRpb24NCm9mIHRoZSBvdmVybGFw
IGNvZGUgdW50aWwgbm8gcGRldi0+dnBjaV9sb2NrIGlzIGhlbGQsIGJ1dCBiZWZvcmUgcmV0dXJu
aW5nIHRvDQphIGd1ZXN0IGFmdGVyIHZwY2lfe3JlYWR8d3JpdGV9IG9yIHNpbWlsYXIuDQoNClBy
b3M6DQotIG5vIG5lZWQgdG8gZW11bGF0ZSByZWFkIGxvY2sgdXBncmFkZQ0KLSBmdWxseSBwYXJh
bGxlbCByZWFkL3dyaXRlDQotIHF1ZXVlIGluIHRoZSB2cGNpX3Byb2Nlc3NfcGVuZGluZyB3aWxs
IGxhdGVyIG9uIGJlIHVzZWQgYnkgU1ItSU9WLA0KIMKgIHNvIHRoaXMgaXMgZ29pbmcgdG8gaGVs
cCB0aGUgZnV0dXJlIGNvZGUNCkNvbnM6DQotID8/Pw0KDQo0LiBSZS13cml0ZSBvdmVybGFwIGRl
dGVjdGlvbiBjb2RlDQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQ0KSXQgaXMgcG9zc2libGUgdG8gcmUtd3JpdGUgb3ZlcmxhcCBk
ZXRlY3Rpb24gY29kZSwgc28gdGhlIGluZm9ybWF0aW9uIGFib3V0IHRoZQ0KbWFwcGVkL3VubWFw
cGVkIHJlZ2lvbnMgaXMgbm90IHJlYWQgZnJvbSB2cGNpLT5oZWFkZXItPmJhcnNbaV0gb2YgZWFj
aCBkZXZpY2UsDQpidXQgaW5zdGVhZCB0aGVyZSBpcyBhIHBlci1kb21haW4gc3RydWN0dXJlIHdo
aWNoIGhvbGRzIHRoZSByZWdpb25zIGFuZA0KaW1wbGVtZW50cyByZWZlcmVuY2UgY291bnRpbmcu
DQoNClByb3M6DQotIHNvbHZlcyBBQkJBDQoNCkNvbnM6DQotIHZlcnkgY29tcGxleCBjb2RlIGlz
IGV4cGVjdGVkDQoNCjUuIFlvdSBuYW1lIGl0DQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KDQogRnJvbSBhbGwgdGhlIGFib3Zl
IEkgd291bGQgcmVjb21tZW5kIHdlIGdvIHdpdGggb3B0aW9uIDIgd2hpY2ggc2VlbXMgdG8gcmVs
aWFibHkNCnNvbHZlIEFCQkEgYW5kIGRvZXMgbm90IGJyaW5nIGNvbnMgb2YgdGhlIG90aGVyIGFw
cHJvYWNoZXMuDQoNClRoYW5rIHlvdSBpbiBhZHZhbmNlLA0KT2xla3NhbmRyDQoNClsxXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvNUJBQkE2RUYwMjAwMDA3ODAwMUVDNDUyQHBydjEtbWgu
cHJvdm8ubm92ZWxsLmNvbS9ULyNtMjMxZmIwNTg2MDA3NzI1YmZkODUzOGJiOTdmZjE3NzdhMzY4
NDJjZg==

