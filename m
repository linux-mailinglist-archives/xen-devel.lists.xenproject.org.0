Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E227EEA48
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 01:22:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634765.990236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3mcZ-0000c7-6Q; Fri, 17 Nov 2023 00:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634765.990236; Fri, 17 Nov 2023 00:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3mcZ-0000Yo-3c; Fri, 17 Nov 2023 00:22:07 +0000
Received: by outflank-mailman (input) for mailman id 634765;
 Fri, 17 Nov 2023 00:22:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1XSP=G6=epam.com=prvs=568571a16b=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r3mcX-0000Yh-9m
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 00:22:05 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53c70053-84df-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 01:22:02 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AGNfGr6032144; Fri, 17 Nov 2023 00:21:50 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3udn131c3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 00:21:50 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by GV1PR03MB8765.eurprd03.prod.outlook.com (2603:10a6:150:8b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 00:21:42 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7002.021; Fri, 17 Nov 2023
 00:21:42 +0000
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
X-Inumbo-ID: 53c70053-84df-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oa1ycUCChZGRnraBx+HDlqk3vja+tOZoFln559y+JMmG142tLLFzV/S23e8o7qwsdq5eSCVuvtptQGcVuMI7PyoJsqqmt1JbhfwNswiND8IK8MYwrqNtFWac77c7FnQcF+cpNuIx7qXaJ/82otT+KT9m6oL5ZQOx9ZPIFQqjM6eMCIvKJdkBpp69ZzssB43VVU3Fw7XAT0cDV6E19rUgQjZSz6VWHbCILDa5en1evgp1tQFVgeNKd9ADrO2Cs3+UCVO3viMQ0yCteVOO0vJXT5aLhkfNDXqoV2+rbAkpj0cDsSNIzrXs/esNOLQ7HQzW8T/dbXH+wh0CTl5SkUGKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2CESVumfXFNyvQDxUCJVKF0xIMLX7PM1nTgJaEaO8k=;
 b=b8CCM2Buik5t9ZxjNfm2KEvvALtPqxOcNDlsg5VUpQnNkv/neqUJ7961HOBwyARlMcjMSCKJcA9nEvckN/bqmHVUJi4ziTNHoQl2SGsifB1N60YF0qd9ji2ZIKKwoRx0SzJr08jMtf0aHmNtKf4RTW/t73Q0KDaMizuapMnKzcPzeG9nV8uCybo0G7XBZeUWq71tdWYBtSOwvuY8fOT71D8peWdcsyPEho4hIewWRJ7dhSgqJ48+ibSnvrXGvXWL4zVDo4Trgt9xJ+nk7FeJIlloT/cyRnR94bi2LP7zz5N7mvywzo7heC4ydzZnbHapYCRIO7dF38xvui75jTCZSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2CESVumfXFNyvQDxUCJVKF0xIMLX7PM1nTgJaEaO8k=;
 b=TxICenmudVs75KsRLTFjCj1JtT7Qvm69qzWNTvm74aZYr9IXVjMyXQwbaqsNDSYu1763Ot4brldWf5YLbHDsqcLparmAoMClXGJkmnC/O9xtJweQxt8LrWrnpznlPqb2/AmvYM29zIcnr/wTFz/4DCmQc3wSYJD5TXT3pUgefpTgbI6fPYKk5gJ2HY3PtClZfn8lSwhdFT59Hos0vk0KJfJ+/80KPdbLWQGL864GkuyBo6kHZj6bu1TLNOyAmeIFgt5pRohCk/zTOzbbFDa6DxuIcmrqIbbsIsLtNHtHtFqib37peLXcOWBs2TJTpv6zhnah4BYYb1zI9qWdr+9otA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>,
        Stewart Hildebrand
	<stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
Thread-Index: AQHZ/Vi+wP3QsyKZ0EartcLXqtnBRLB9UyCAgAB7YgCAAAiUAA==
Date: Fri, 17 Nov 2023 00:21:41 +0000
Message-ID: <87o7ft44bv.fsf@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-14-volodymyr_babchuk@epam.com>
 <d6a58e73-da51-40f1-a2f7-576274945585@xen.org>
 <alpine.DEB.2.22.394.2311161513210.773207@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2311161513210.773207@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|GV1PR03MB8765:EE_
x-ms-office365-filtering-correlation-id: 7c87b553-a08a-4482-a090-08dbe7032c7d
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7XndYnl8UHih3gyz5GVi2fZPi/dN2FbDuMTpn5wBvFDVarYgOcsdojucrE3HkCPH2j5o6YLSXlNPw/LqGV8+aP+8HbDkK82xUfmlYrcTlyuSAJdkRqLemytWsQZWnBLFgPO8z6rYaAU5yodNnFXUL2SXWL0todEbjih0vGqiMMPHu6oXAuedd7xLZcVR7Z7HaJy7W6d3MA6jCsliExLZ20x9HhaNMfCVf4U9cczfZAG1WevPbhVzR/sUHrQTbiPRyYZ0P9JzVYRTmR82SIZo0RIbhaVi/BngDzxwOEkPEnaGaDPN4+uU5TCyZTHz1O3woB5T9/QeP8YaBFXFzTVUZe3hr1bQCGBcf/vHbi4aYEN2P84OF+G2hItVDdPZzEH4OzKHRfBJCrfzxXHhU4Fse+XliVsb0ZSWrcdiIiHU123nuH3b55lPxSjxxQ/p1yYEfQhz49kwQT2PTAafwdAT785EzeCj4/6FmkSfOhWqHwhL7COvKW3VwpfpGZPMMzllvyVqC1atcD+l4424fkbgnJg3fN28mMzEDR7yIreKEJhK8AvvTVDzV0w6vvoPaY6tacHGj196e207rYFQFsnssSzxuFDujr0RNYYpvT8GcDlT6hvx339+t1orV6zUovfk
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(346002)(136003)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(55236004)(71200400001)(478600001)(83380400001)(2616005)(6512007)(6506007)(26005)(6486002)(6916009)(316002)(66946007)(66899024)(76116006)(66476007)(66446008)(64756008)(54906003)(66556008)(91956017)(8676002)(8936002)(38070700009)(5660300002)(38100700002)(2906002)(86362001)(4326008)(41300700001)(122000001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?9IN9cbGlZlSgpHWrnkmZQ+3CVpfkFEvHGYdCPOnRSR+Dlxi+CvHq4kVGEC?=
 =?iso-8859-1?Q?1ghvnx08c19Ge4lcyatCK9J6fC/NH+X0+QyqajnnB0lh766IHoMrdYWROH?=
 =?iso-8859-1?Q?kL+zarZFbwBTo0pZJa7RsC5fjYyQKDs6xpDAQkB3EmPp27hzTJwMDvdiz6?=
 =?iso-8859-1?Q?zB9CcG6hp7Sn6BwyWtAxEYnBrwH7Q0fJuQNvmSuA7PYYwxJxFyepNUmH7R?=
 =?iso-8859-1?Q?MhFrxVP4xFuerrK9DqIklLL3UpOe1oTV4SHT/GcdTsr+RmRw7SwYDriWYu?=
 =?iso-8859-1?Q?nOJ9hLqDSiWIQgmt2TAc+tR82vNFkThOapq/GLifb1fzUld0tHxNlkYUWQ?=
 =?iso-8859-1?Q?D1fDZs1nNwKg8PSjgCkAhgcOH6dnrx6pd642M8iRONyw4Uc8cF1Prwc6rC?=
 =?iso-8859-1?Q?/BwjbS3gwLyQYVbDRUN8KbNr49NvZmei5IoafNQcBJhkuW+mwmrBl5Pb0v?=
 =?iso-8859-1?Q?bp9PyYBUghzQYUnGnLInuzwOICvlFH1o2UL+mfvL9LoWO435KvEpGL1HMs?=
 =?iso-8859-1?Q?Np9AMFRSmYGPPa2+yCgIhGOmdhNXL91d/EWHJkDWQUDcLeuR5EQ7KarlgG?=
 =?iso-8859-1?Q?o9dBUCp4Vp/P3DbAMP0/Zluv42yAwN5h98Oqmi2xiQBrNwxsCIhtJ7xaIU?=
 =?iso-8859-1?Q?mDatg8dnSUniCZvHHVTLLkVId6OHRSUrOHM+AsRxOZ6ucOukpb88yPRXRs?=
 =?iso-8859-1?Q?7SFyuAGmDWJT2fTvKVKz48MHFFaXG7aly0aDooB/X4+3gSpoD6w4P87q/y?=
 =?iso-8859-1?Q?kZI37K7Np40ZAZmJq92a4oq1yD6GWRPZIFgbVrcP9JNg1rYbK2KSy2hiZM?=
 =?iso-8859-1?Q?5vvmA0URQ01Rdk6lBQOPS7PnLlbh0RBVz7yYwTX6AzG68RbKdKTqWXE0xl?=
 =?iso-8859-1?Q?f5LVtvPpUaHN68S8XGqLq46F2fM5j8lO2vfMqYWZKT5U/z/DWAGwSLgWo1?=
 =?iso-8859-1?Q?xjNfXoxmO9uoPWT1lZwuKQ92aDdfmcVA1L8Fn2McYLVv+JBgsPUf4YN4c+?=
 =?iso-8859-1?Q?UruT5A2oNKJquP0fhbmjUujmRNo+SUiMaTEUJI2dZBcFBf2ttxIrfdKG1y?=
 =?iso-8859-1?Q?cX4DPPhBvT+OpNO9V57+ntNoiY3s5hkWfa6k9iO1OOH4C74N2Rd2R2MOFS?=
 =?iso-8859-1?Q?FFUksbjQDZxko1YsWAudMqyjkLuLpsBUkpEIz/z8+/cRdxw1lQQVvfCISX?=
 =?iso-8859-1?Q?JyOYcCGuv3doEzQdng8BnXMiddIDFODWu9uEXpIFqaZ8hSMpEkQa0CL9QX?=
 =?iso-8859-1?Q?VUn0PQOgizkf6n4IBfBNUqvPbdhOU3yLWMjyvBs7PiQVwaraMjZJXIj8UF?=
 =?iso-8859-1?Q?whkWjWJ4fz+GWmiNsjtHQUmWmFNI9wORz/FZ+QNraK7UcXh/N6Nq7LTC32?=
 =?iso-8859-1?Q?FLkUM8yOqMRmnVKPz+6H+FArSGisDz8WJsGZRkTlKmCznRdcWC0asevZOi?=
 =?iso-8859-1?Q?d2mkeMLxKVjMVqYSLIM1pbLAaxmQ11dQmHN1gEB7Femit+fLYzjn6JDOri?=
 =?iso-8859-1?Q?bK3ZX+SDAY/ZBQ1INhPxvaNo3MocvYl59GjaL9INln/Rdnes4kw8P5BgcE?=
 =?iso-8859-1?Q?xZ0S+E/VeOmnVQeG3NroRIOvhcp9XYkK4zrFzbEgFYRx2xuT8wisY54Qqn?=
 =?iso-8859-1?Q?AvRal9vfGimF0IQW4aTKYwQuedCZqvdakuATRADfdBSu3uQ6kqyKFY1w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c87b553-a08a-4482-a090-08dbe7032c7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 00:21:42.0137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KZLzHUEtQloxC4jp5Max3EPB/QW2hKNrNkxqiTzO/QmZllthShrwz8CZCadOI8bqCYu/KTscDCI+7qgihs+ilWIqHyPzrEZYFEiWpxDQSz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8765
X-Proofpoint-GUID: HzLku3FMRAkEJdjMaKfjZ_UPH8rXoV9_
X-Proofpoint-ORIG-GUID: HzLku3FMRAkEJdjMaKfjZ_UPH8rXoV9_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_24,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170000


Hi Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Thu, 16 Nov 2023, Julien Grall wrote:
>> IIUC, this means that Xen will allocate the BDF. I think this will becom=
e a
>> problem quite quickly as some of the PCI may need to be assigned at a sp=
ecific
>> vBDF (I have the intel graphic card in mind).
>>=20
>> Also, xl allows you to specificy the slot (e.g. <bdf>@<vslot>) which wou=
ld not
>> work with this approach.
>>=20
>> For dom0less passthrough, I feel the virtual BDF should always be specif=
ied in
>> device-tree. When a domain is created after boot, then I think you want =
to
>> support <bdf>@<vslot> where <vslot> is optional.
>
> Hi Julien,
>
> I also think there should be a way to specify the virtual BDF, but if
> possible (meaning: it is not super difficult to implement) I think it
> would be very convenient if we could let Xen pick whatever virtual BDF
> Xen wants when the user doesn't specify the virtual BDF. That's
> because it would make it easier to specify the configuration for the
> user. Typically the user doesn't care about the virtual BDF, only to
> expose a specific host device to the VM. There are exceptions of course
> and that's why I think we should also have a way for the user to
> request a specific virtual BDF. One of these exceptions are integrated
> GPUs: the OS drivers used to have hardcoded BDFs. So it wouldn't work if
> the device shows up at a different virtual BDF compared to the host.
>
> Thinking more about this, one way to simplify the problem would be if we
> always reuse the physical BDF as virtual BDF for passthrough devices. I
> think that would solve the problem and makes it much more unlikely to
> run into drivers bugs.

I'm not sure that this is possible. AFAIK, if we have device with B>0,
we need to have bridge device for it. So, if I want to passthrough
device 08:00.0, I need to provide a virtual bridge with BDF 0:NN.0. This
unnecessary complicates things.

Also, there can be funny situation with conflicting BFD numbers exposed
by different domains. I know that this is not your typical setup, but
imagine that Domain A acts as a driver domain for PCI controller A and
Domain B acts as a driver domain for PCI controller B. They may expose
devices with same BDFs but with different segments.

> And we allocate a "special" virtual BDF space for emulated devices, with
> the Root Complex still emulated in Xen. For instance, we could reserve
> ff:xx:xx and in case of clashes we could refuse to continue. Or we could
> allocate the first free virtual BDF, after all the pasthrough devices.

Again, I may be wrong there, but we need an emulated PCI bridge device if w=
e
want to use Bus numbers > 0.

>
> Example:
> - the user wants to assign physical 00:11.5 and b3:00.1 to the guest
> - Xen create virtual BDFs 00:11.5 and b3:00.1 for the passthrough devices
> - Xen allocates the next virtual BDF for emulated devices: b4:xx.x
> - If more virtual BDFs are needed for emulated devices, Xen allocates
>   b5:xx.x
>
> I still think, no matter the BDF allocation scheme, that we should try
> to avoid as much as possible to have two different PCI Root Complex
> emulators. Ideally we would have only one PCI Root Complex emulated by
> Xen. Having 2 PCI Root Complexes both of them emulated by Xen would be
> tolerable but not ideal.

But what is exactly wrong with this setup?

> The worst case I would like to avoid is to have
> two PCI Root Complexes, one emulated by Xen and one emulated by QEMU.

This is how our setup works right now.

I agree that we need some way to provide static vBDF numbers. But I am
wondering what is the best way to do this. We need some entity that
manages and assigns those vBDFs. It should reside in Xen, because there
is Dom0less use case. Probably we need to extend
xen_domctl_assign_device so we can either request a free vBDF or a
specific vBDF. And in the first case, Xen should return assigned vBDF so
toolstack can give it to a backend, if PCI device is purely virtual.

--=20
WBR, Volodymyr=

