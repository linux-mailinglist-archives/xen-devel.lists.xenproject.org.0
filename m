Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FD9455506
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 08:00:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227123.392739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnbOt-0004tO-90; Thu, 18 Nov 2021 07:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227123.392739; Thu, 18 Nov 2021 07:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnbOt-0004rB-5a; Thu, 18 Nov 2021 07:00:03 +0000
Received: by outflank-mailman (input) for mailman id 227123;
 Thu, 18 Nov 2021 07:00:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVvB=QF=epam.com=prvs=1956dce401=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mnbOq-0004ab-Ny
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 07:00:01 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23d7db8a-483d-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 07:59:58 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AI6XuKQ020583;
 Thu, 18 Nov 2021 06:59:55 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cd6gv1mrv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 06:59:55 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7298.eurprd03.prod.outlook.com (2603:10a6:20b:26c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Thu, 18 Nov
 2021 06:59:51 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 06:59:51 +0000
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
X-Inumbo-ID: 23d7db8a-483d-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8YytWdfveFBNF5qIt/a3OqlBkJSvCXOic4vXXaVtxKNZcMyzaHF+Gy9soh8s/hstd5KbChH95udUx1imWv+cVUeiGxEU4Lc75O3zwHxVq+jbTOwpSLtGYyii+mStlDZWggXkcBI9JOAGFIsEqkgJjSDNcLJKFNsSL5iqc7h7dsyeSrk2WOp+BQ7+5xYjw29dXEuf5W/mxBSmuHVVh/yhjc4FVlRwTADIPB0LbXeLbRVdw46+hWt/jAfipwPJHInTM//E3yS4gTZTzWTso73mkm+IHbj0YFcyCKjQTyOxsyUk7NYBwecPqRhLDJHSVyj49h+ZsKAzVYnS0Pn9XTcGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qg7XRTUKILwrI9usAmHhgG7UQvg1vjST346KolD7nw=;
 b=k4rBWFlRe/w9yap4scWrBppaJ/AJFAt63omznbS8JwJQD1tk/kyWbG0evLqp1WFAe+1boXA/TP6UR8d52523Tdb32/ptjIbOYRxygarWMvk6BzqQbX3lPsoYGQStL7QUwKYAbSSkC1McxJbHf7BdFuooXFe+ZKUjN/AamzSWdvdZbpcqbZSm08+DvCquVTi/MH8ywKFBmy8M8njEXoOVgzq++wF7odyNAb7Z0C2eNtF65+SeSu/cooKCxps4Gkuw1+hUKhGXmTWX8GI+ilg8x2f7xb7LxC3BA6ogvxyZUzb956REZgfzOFh3TqwK9vc18NOgb008k+zyIrwdFIL4dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qg7XRTUKILwrI9usAmHhgG7UQvg1vjST346KolD7nw=;
 b=i9UoZKF0QaUW5XMVNdjvAZyftzEOjfDrpN9/FHFde7oTsmKs+MvmbHX/2EPz6ny8GPapPq4vW064H6Y/k92lCp3xJZO+CXuxiO2JmNcA1vRVqnHHLlWML8QemEDHdj4Jn/6ip9CctcSLnutOeue1q/hUbDraQTlxB6BJ/7YZ0Qbc4FP7kGOj/OgtmB10i+vdrjvBgPhU9pke5UQD/zoVVpTY9sG3VTZhBKlFBMNi7tbDnvkWJH50VsdtwpMzAVPK/x+FELCfxO0a6a9MAt0QnnufPU9qlhJHKHfXM8REUWsvcUHoMPy9PKKai9PbDu0m0Z8hPL2to9u30OrX/aqMxQ==
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
Subject: Re: [PATCH v6 5/7] xen/arm: do not map IRQs and memory for disabled
 devices
Thread-Topic: [PATCH v6 5/7] xen/arm: do not map IRQs and memory for disabled
 devices
Thread-Index: AQHX0g8TzX0nJtcMKUqFWH5LUHUR4awGmpkAgAJVCwA=
Date: Thu, 18 Nov 2021 06:59:51 +0000
Message-ID: <ffaabc83-9ca7-1f41-23a9-bf2a1e3828ca@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-6-andr2000@gmail.com>
 <997e2ad5-9b52-73b4-a02d-f255480684d9@xen.org>
In-Reply-To: <997e2ad5-9b52-73b4-a02d-f255480684d9@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99f01b1e-4736-41ef-eab3-08d9aa610499
x-ms-traffictypediagnostic: AM9PR03MB7298:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7298066130417A4B61E6665CE79B9@AM9PR03MB7298.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 I1X7JuB48Vko6rlVsGMaNvHKXTzIMJbxueibXvrhOlZpEcK+e1BJW4V6j8k0K1EL40oavVUyS3aXX+s7az2pDTJkIGtf528f7sd6pIg3zSYuyueMDL/ZPv4ZuV/w9GmbU9WiRCA3pTC4tvc1T8B/jQSLXyENBk7r7GI3roUaKu4D1cONsrXoOVu/8UBwhIm3Qq/aclrK4V39AmUNFTe4jg6SeGeVKGx3bumfNucKsvORLqgKYluf26Y7v2nEkHztAbtsuSIHeDYsQaKXY9h71b2TLBX6MJuylJJyS9IOCGGVFrjNEPGNXC3S/lVhJAZ0CBJWNI2O6EAX6ClYm87znM2tqsDBmmdg+LUwD7G7NRHz4qHgRbGFYA4xC5XKH7jhXAFeXF5TI+VGqVypohgd9oSrddM6LWED0f1Vh7OItwqYVpg4HucWQAe3pX7fNhPTJGPj1nQDizI7YXLZZ1kMQnP6BZjqCRwdPwK9faDun7NwmcPdy77BJ6G0eT7YeYxyIZTcBKC21ldthOeI12mDpqGp37hfXnhJFyZspmTdE8yY2KkSjzW+RwFIOmubsn5OJPAoazkB9yc971Ew5iTcYhKCFPwlc0PV4O0at1nMjb/9uQ0G6H8l2QcuMzAM3WWfpaHEQD8xF/x+QoIN7Xm2xX8qKkFtkRQN8BFNxSUCFmSbBybK+xU0mY5twoiTJCO/LVbvXVf8D98CxWlzBoAdkvhi7nynTwH1Z34HiSqxqDrqq0dDipvg15zwxqeGAErvDZlusgRoJTyQXUmZAG2zUf5/vQ68pS6hV0AQIsDyMFGH9E3TOBRT2D8ZQ4ExjaFOyEwngY+BEEOoyiovaZemBGcHbyCE92R42Qj6rtVwodySIjgnZNvSzYpBMl/I1OOP
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(966005)(186003)(26005)(7416002)(508600001)(110136005)(83380400001)(2616005)(54906003)(107886003)(5660300002)(76116006)(91956017)(6486002)(66946007)(8936002)(64756008)(4326008)(316002)(71200400001)(38100700002)(36756003)(31696002)(31686004)(6506007)(66556008)(122000001)(86362001)(38070700005)(66476007)(2906002)(8676002)(66446008)(6512007)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UmVzNVJaOHhXNFdWUDhVbDVZKy9UbTdnNDF0SUxsSk10bU8yQ2hQQTBObGZ6?=
 =?utf-8?B?UFR2c1VsdkJBeHVFdjR3Qy9VZUJpcGkxNDVYVjlNam9DMWFWVWo2NXVkWGNn?=
 =?utf-8?B?K3RiNFJaVm9FdTh1bkFEM2lYNFFlMjd3ZUpqUjZXSEFvOHpHQ2llQkNXYU9V?=
 =?utf-8?B?WjFqVW5iSDVWb01ZSXBvL3Z3d2VoSEE2bGt0eGhBQVBWNHdJOWphYlJKcGdF?=
 =?utf-8?B?bHB1OWUxdnphcGVDRlcrTlBmVnBRMlRYbUJ2bTIzZi90MUJyKy9KK0N4WkUw?=
 =?utf-8?B?VmRlRmt6WmY4ZFZvaUc2RFk2dVZUVWZ3RkwvemdrMldGMkk2eU9RUkhhbEs2?=
 =?utf-8?B?T2lzVExWblJpalN2ZGx0emJzV24yUDZURXlxUGlZSDZFVUNxZkUvNHdxSHJo?=
 =?utf-8?B?WFMvMndGV1gxMjQ2N1h2R2o0Ulh3Y0MzV0JhSVlhZ09qeXdVMTJQN3N3aXo4?=
 =?utf-8?B?azJZOXI0c1RpSG9xSnQzeDlzWlNVbU0vQ3FhTzZFMDRWNitVOGpuODl0QWt5?=
 =?utf-8?B?dU94V003RSsxb056MlZ3WitSbENsOThRYVkvZ3lXQno1Q1JGNXhnZ2Fub2RY?=
 =?utf-8?B?REczOHpNRG00NVRLczBwVnpDdlByc0JwZWJiQmRVUjNJaG9DNGFxcVd2WHpl?=
 =?utf-8?B?T0ttYkpXYkUxQ08vZFJXSk84ekQvaGdCMkxycVBpRGs3Y3QycTdNdVRpeFFa?=
 =?utf-8?B?SENadVdXR2t1a2RiblIzWDFRSVVlbHVVOTFpcFgvWmFZbWNHZVY5eXBiT2w0?=
 =?utf-8?B?Z2NydXJCRy9XSmJUcHUrK2dHcVVsZFdsNDNmcUFCaHo3QTRueVdMZDRuMVly?=
 =?utf-8?B?YUxWV3NSMkYzZmkrOE5IMDBhM1IybzJZNW03dVgxdXVBa0dOSzBLMHI5QjdQ?=
 =?utf-8?B?ZWRCMDVJZXRoLzRuUlkzYVJoeEl1V3JRS3IrNkNiT2hnaHRyb1NKT09DUGZL?=
 =?utf-8?B?WkFLOFlJcGNQVWx2bHd5Y2ltNUwzVUl4VG9jdlBMVmQwTFNFSDI2L1g1b2dO?=
 =?utf-8?B?RW91M3ZLa2dIT2h2TFZMdnJvMUNVTXdyaWlxYkNPbEZkM3c4TkpIQ3pxR2lp?=
 =?utf-8?B?NjU5dXpVbG15TWdCYVkxS2E2NVJRUUQ0N1h5RTJSYU5ybGh4MTRHbjBtUEpZ?=
 =?utf-8?B?M3RWNEphSWVHOHRrcEEyeDdJR3p1Y3FLejhVeGMybDZpelZZUDZLSUUxM3NB?=
 =?utf-8?B?OFF5WHcyWTVsKzg4T0p6T21rSkQxNWFuekVpYnRrVk1WMDVSdzJOeHhqNXEv?=
 =?utf-8?B?ek5zVkVlMUh1TDhsSTZJUFhVNjd3ZzF5Q1VhaWxTbmtoVGxHYXVHUFB1Z3dv?=
 =?utf-8?B?VlpkVys3R294K2o2U05VMk11M2VUaGQwM3Q0dHlnT0hXVXRIdi8wQU5vY2lR?=
 =?utf-8?B?c2xzMlV1d1pQNmxibG8vOFlFZjZraFpIUlhLR1lNOWk4WXFnV1JjVEhGREY1?=
 =?utf-8?B?RlQxczJpa0kxb3MrTEJpSjV4dU92dUhIR3B4MnRubloyRnZHWWF4aEVZMG05?=
 =?utf-8?B?d2Z2cUZka3NjNmU2WmMwNjkrdm5KWTRZbllzUk9JaG43aFVicXZHbDJtNEly?=
 =?utf-8?B?T3BEZXNENXNkKy9XbXBjUWdWRzB3d3Y2WDRYSjNsWjgwd0lVSmJzQlpkd1Zx?=
 =?utf-8?B?Yktzb1llK1paTi9iZGtmdEJhMzVWWi9Qc2taaS9nOG1Kd3cvWmlIWDRPNHB2?=
 =?utf-8?B?eWFuR2Vra0NUdnEvUGowQStTazhyN3dsZFF3YjNQV0UxUWZ3eXVaZ3h6enY2?=
 =?utf-8?B?YzREVTZFUzVmRVNIanR5Z3JHNjVPeEkzOVY4UTl0OEVxSkhBb0Z0VEhzTzNv?=
 =?utf-8?B?KzlieUlURmVodzBtTG5ZWmpvdllpdlRiRUxvVHJ3NlV3VElIYlZ0WExieVdQ?=
 =?utf-8?B?a095OTYvWDB6OWdwdk9obk11bnM2TE93K1NHWHJSU2VHSEtBVk9sSXppK2pS?=
 =?utf-8?B?UEV3REhzYUh2WHE1dEYrclFTUkVaVVVUdVp0dCsvK01SUm84NXp2YlArYnpo?=
 =?utf-8?B?c3d1bzZWUCszb0VRUEVrZGFYZHZWcnl0c3A0b0U0MFUvbWlxZWgzWVZobFVI?=
 =?utf-8?B?Mkg5Z1FZSTB2aTNURGdYb0FHOC9va25CZ3hIRk1Zc05JUDhjMVBhalhxVEMw?=
 =?utf-8?B?WjY1ZitZM2p3Rng3TldHdnJDcUZ5SnVkS3JoSGt3ek1mc0pLUFRWa24rK2hv?=
 =?utf-8?B?MXcyY1FvaG9kTENIbnJsNDQwejB5MXZRMXdVcGwvYzdnWXQ0ak40aGQ5N2xk?=
 =?utf-8?B?aSsyVzdDcTAxN3BhSlY2eE41RjI1Vjh6cHhTSEVwUmtYZWR6djg3bGd4bWQ0?=
 =?utf-8?B?RDA3ZEJkR1dzSTIvY1JaM3ZJRGk1aUh3MFlUNitpdjN4cjJMNzRyQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2750701F04E77C4B8E7C70D5F36FBEF9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f01b1e-4736-41ef-eab3-08d9aa610499
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 06:59:51.4136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y7KqmL33JAI7m4L1OsMm9BdP49VKqUkeC5cuH5etLlMj5LLcO7C3q92gZBshU+NVVhd4ms7d6+ekPBlZlXEtxw9EYzw89zlV+jvZ0VTaC5soMzTRIT4X6EzNzIs5/cDX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7298
X-Proofpoint-GUID: Fl_1ucox1aIObHw8fR4YlckllZqF4yuc
X-Proofpoint-ORIG-GUID: Fl_1ucox1aIObHw8fR4YlckllZqF4yuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_02,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=684 suspectscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180040

SGksIEp1bGllbiENCg0KT24gMTYuMTEuMjEgMjE6MjIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGkgT2xla3NhbmRyLA0KPg0KPiBPbiAwNS8xMS8yMDIxIDA2OjMzLCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBDdXJyZW50bHkgWGVuIG1hcHMgYWxs
IElSUXMgYW5kIG1lbW9yeSByYW5nZXMgZm9yIGFsbCBkZXZpY2VzIGV4Y2VwdA0KPj4gdGhvc2Ug
bWFya2VkIGZvciBwYXNzdGhyb3VnaCwgZS5nLiBpdCBkb2Vzbid0IHBheSBhdHRlbnRpb24gdG8g
dGhlDQo+PiAic3RhdHVzIiBwcm9wZXJ0eSBvZiB0aGUgbm9kZS4NCj4+DQo+PiBBY2NvcmRpbmcg
dG8gdGhlIGRldmljZSB0cmVlIHNwZWNpZmljYXRpb24gWzFdOg0KPj4gwqAgLSAib2theSLCoMKg
wqDCoCBJbmRpY2F0ZXMgdGhlIGRldmljZSBpcyBvcGVyYXRpb25hbC4NCj4+IMKgIC0gImRpc2Fi
bGVkIiBJbmRpY2F0ZXMgdGhhdCB0aGUgZGV2aWNlIGlzIG5vdCBwcmVzZW50bHkgb3BlcmF0aW9u
YWwsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJ1dCBpdCBtaWdodCBiZWNvbWUg
b3BlcmF0aW9uYWwgaW4gdGhlIGZ1dHVyZSAoZm9yIGV4YW1wbGUsDQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgc29tZXRoaW5nIGlzIG5vdCBwbHVnZ2VkIGluLCBvciBzd2l0Y2hlZCBvZmYpLg0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIFJlZmVyIHRvIHRoZSBkZXZpY2UgYmluZGluZyBmb3IgZGV0YWls
cyBvbiB3aGF0IGRpc2FibGVkIG1lYW5zDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIGEgZ2l2
ZW4gZGV2aWNlLg0KPj4NCj4+IFNvLCAiZGlzYWJsZWQiIHN0YXR1cyBpcyBkZXZpY2UgZGVwZW5k
ZW50IGFuZCBtYXBwaW5nIHNob3VsZCBiZSB0YWtlbiBieQ0KPj4gY2FzZS1ieS1jYXNlIGFwcHJv
YWNoIHdpdGggdGhhdCByZXNwZWN0LiBBbHRob3VnaCBpbiBnZW5lcmFsIFhlbiBzaG91bGQgbWFw
DQo+PiBJUlFzIGFuZCBtZW1vcnkgcmFuZ2VzIGFzIHRoZSBkaXNhYmxlZCBkZXZpY2VzIG1pZ2h0
IGJlY29tZSBvcGVyYXRpb25hbA0KPg0KPiBSaWdodCwgdGhpcyBjaGFuZ2UgZWZmZWN0aXZlbHkg
cHJldmVudCBkb20wIHRvIHVzZSBzdWNoIGRldmljZSBpZiBpdCBiZWNvbWVzIG9wZXJhdGlvbmFs
IGluIHRoZSBmdXR1cmUuDQpPciBkb2Vzbid0LCBzZWUgYmVsb3cNCj4gU28gdGhpcyBzb3VuZHMg
bGlrZSBhIGJpZyByZWdyZXNzaW9uLg0KPg0KPiBIb3cgZG8geW91IHBsYW4gdG8gaGFuZGxlIGl0
Pw0KSXQgZGVwZW5kcyBpZiB0aGlzIGlzIHJlYWxseSBhIHJlZ3Jlc3Npb24gb3IgaXMgb2sgYW5k
ICJieSBkZXNpZ24iDQo+DQo+PiBpdA0KPj4gbWFrZXMgaXQgaW1wb3NzaWJsZSBmb3IgdGhlIG90
aGVyIGRldmljZXMsIHdoaWNoIGFyZSBub3Qgb3BlcmF0aW9uYWwgaW4NCj4+IGFueSBjYXNlLCB0
byBza2lwIHRoZSBtYXBwaW5ncy4NCj4NCj4gWW91IHdyb3RlICJtYWtlcyBpdCBpbXBvc3NpYmxl
IGZvciB0aGUgb3RoZXIgZGV2aWNlcyIsIGJ1dCBpdCBpcyBub3QgY2xlYXIgdG8gbWUgd2hhdCdz
IHdvdWxkIGdvIHdyb25nIHdoZW4gd2UgbWFwIGEgZGlzYWJsZWQgZGV2aWNlIChEb20wIHNob3Vs
ZCBub3QgdG91Y2ggaXQpLiBEbyB5b3UgaGF2ZSBhbiBleGFtcGxlPw0KT2ssIGhlcmUgd2UgZ28u
IEluIHRoZSBTb0MgSSBhbSB3b3JraW5nIHdpdGggdGhlIFBDSWUgY29udHJvbGxlciBtYXkgcnVu
IGluIHR3byBtb2RlczoNClJvb3Qgb3IgRW5kcG9pbnQuIE5vdCBjb25maWd1cmFibGUgYXQgcnVu
LXRpbWUsIHNvIHlvdSBjb25maWd1cmUgaXQgaW4gdGhlIGRldmljZSB0cmVlLg0KVGhlIGFyZSB0
d28gZGV2aWNlIHRyZWUgZW50cmllcyBmb3IgdGhhdDogZm9yIHRoZSByb290IFsxXSBhbmQgZm9y
IHRoZSBlbmRwb2ludCBbMl0uDQpTbywgd2hlbiB5b3Ugd2FudCB0aGUgY29udHJvbGxlciB0byBi
ZSBhIFJvb3QgQ29tcGxleCB0aGVuIHlvdSBwdXQgc3RhdHVzID0gImRpc2FibGVkIg0KZm9yIHRo
ZSBFbmRwb2ludCBlbnRyeSBhbmQgdmlzZSB2ZXJzYS4NCg0KSWYgeW91IHRha2UgYSBsb29rIGF0
IHRoZSBub2RlcyB0aGV5IGJvdGggZGVmaW5lIHRoZSBzYW1lICJyZWciIGFuZCAiaW50ZXJydXB0
cyIsDQplZmZlY3RpdmVseSBtYWtpbmcgaXQgaW1wb3NzaWJsZSBmb3IgbWUgaW4gdGhlIHBhdGNo
IFszXSB0byBhY3R1YWxseSB0cmFwIE1NSU9zOg0Kd2Ugc2tpcCB0aGUgbWFwcGluZ3MgZm9yIFsx
XSBhbmQgdGhlbiwgYmVjYXVzZSB3ZSBhc3N1bWUgImRpc2FibGVkIiBpcw0Kc3RpbGwgdmFsaWQg
Zm9yIG1hcHBpbmdzLCB3ZSBhZGQgdGhvc2UgZm9yIFsyXS4NCg0KU28sIHRoaXMgaXMgcHJvYmFi
bHkgd2h5IGRldmljZSB0cmVlIGRvY3VtZW50YXRpb24gc2F5cyBhYm91dCB0aGUgZGlzYWJsZWQg
c3RhdHVzDQp0byBiZSBkZXZpY2Ugc3BlY2lmaWMuDQoNCkhvcGUgdGhpcyBkZXNjcmliZXMgYSB2
ZXJ5IHZhbGlkIHVzZS1jYXNlLiBBdCB0aGUgc2FtZSB0aW1lIHlvdSBtYXkgYXJndWUgdGhhdA0K
SSBqdXN0IG5lZWQgdG8gcmVtb3ZlIHRoZSBvZmZlbmRpbmcgZW50cnkgZnJvbSB0aGUgZGV2aWNl
IHRyZWUgd2hpY2ggbWF5IGFsc28gYmUNCnZhbGlkLg0KPg0KPiBDaGVlcnMsDQo+DQpUaGFuayB5
b3UsDQpPbGVrc2FuZHINCg0KWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yZW5lc2FzLXJjYXIvbGlu
dXgtYnNwL2Jsb2IvdjUuMTAuNDEvcmNhci01LjEuMy5yYzYvYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL3I4YTc3OWYwLmR0c2kjTDg0Mw0KWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9yZW5lc2Fz
LXJjYXIvbGludXgtYnNwL2Jsb2IvdjUuMTAuNDEvcmNhci01LjEuMy5yYzYvYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3I4YTc3OWYwLmR0c2kjTDg5Ng0KWzNdIGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvcGF0Y2gvMjAyMTExMDUwNjMzMjYuOTM5ODQz
LTUtYW5kcjIwMDBAZ21haWwuY29tLw==

