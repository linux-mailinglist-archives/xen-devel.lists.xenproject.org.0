Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E247EFB51
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 23:23:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635440.991322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r47Ea-0003TG-20; Fri, 17 Nov 2023 22:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635440.991322; Fri, 17 Nov 2023 22:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r47EZ-0003QO-Uy; Fri, 17 Nov 2023 22:22:43 +0000
Received: by outflank-mailman (input) for mailman id 635440;
 Fri, 17 Nov 2023 22:22:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1XSP=G6=epam.com=prvs=568571a16b=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r47EY-0003QI-W1
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 22:22:43 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d126c215-8597-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 23:22:40 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AHMEQjQ019207; Fri, 17 Nov 2023 22:22:34 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ue4n2trnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 22:22:34 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DB5PR03MB10073.eurprd03.prod.outlook.com (2603:10a6:10:4a0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 22:22:30 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 22:22:30 +0000
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
X-Inumbo-ID: d126c215-8597-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4MU0ArhOwmAJUPQynPHWBDdRZLS6GPEDV8eUp4OkYF7lyBfFJpVWqg51RNrBS1DS9LP1iHTh3w74sofLZBMFi7cD5qJ2/TdvXes5ijomEO2XgLZMvgJnRVxlCPH4GlecJZDTJv3MY/CRO1rwh/nxWwvTEzeNWVcSFwH2lAqSZ3vSEhQg4ib2W1Q/DR7sBDXk3O2kG4SCS4/akq6+ZIbBi6sVHb+1GE8Ka1uPhs/jlsa210ntuNb1G0tyWXqMWH20Mf1dk1gfucV/UKASQp19lW0tSUPEMcl9r83vK5zdYl80Db3j4m1RqmOfFXpQIUS0WGReQk86Bjrdl6c2TFT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FqHYIBCmIUVYNTi3k8KIt0QsjH65j22jk28JKOxZcQ=;
 b=YHKJez3MV6W0AWoDj/scP7kfrL7IMPp7cri+fHL6l2TVZFUdrBeSDetv2MNUhLr+GTTTvxwv9dncTwBJ0fO2wWplExPu9OPUzlGJNxTWczbgpYKrJlU9RBmrkXfUfy8Mj0OUUkTt8pSJ15J95/NcpMhbNdLg6lYBIt21tqxsZlEHUk1ziqnyD137UpWLrOBVuAuJDbJ3fFveffCL8/vw5u4Zbc5OYfzRRG5pyRTdjDsJ9qqKTzBn+JEs6dr+hgbtx8DBFfE4mXd5ugMF2Unh6HH0EPTh4i/RjeAGrOq1R9vyLk+P2zAyYKw7vHkjhdXi6oht2dhaatrdvQo3+5yNeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FqHYIBCmIUVYNTi3k8KIt0QsjH65j22jk28JKOxZcQ=;
 b=DIFTd8UEU05Kdbvr4mKnDnccOn+0w06HASYcbrZAF6m5KJayU71kIMOBvGQgvOUAQh0+6Xv/26mNU7C2xIgA0nJPT17A1mWZ6aV85KZ6X5H7t7H1g0tmA8y2m7D3WmDAr74hOn+NYw4x4rDxI4VDdTj++YPiS2EGvmqOFwncb/hkdWc60GweJ/hYZZcbwyI5AdImg7C2FMDFN8s8sWu2GuXf4A+kEhwQhQPO4FE/eZZnm3fAeux2c1fcAM0xWxdPFgH2RFagXKsozLyQta+7cZ2WGrEvqt7u7b7FL9tlJnvMq0wHa/w5geTR7f9OeTztgD0CxHRZM8Z7rkdr7jDgmQ==
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
Thread-Index: 
 AQHZ/Vi+wP3QsyKZ0EartcLXqtnBRLB9UyCAgAB7YgCAAAiUAIAAEHKAgADZXQCAAEyPgIAAGSwAgAAczgCAAAOwAA==
Date: Fri, 17 Nov 2023 22:22:29 +0000
Message-ID: <87edgo2f6j.fsf@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-14-volodymyr_babchuk@epam.com>
 <d6a58e73-da51-40f1-a2f7-576274945585@xen.org>
 <alpine.DEB.2.22.394.2311161513210.773207@ubuntu-linux-20-04-desktop>
 <87o7ft44bv.fsf@epam.com>
 <alpine.DEB.2.22.394.2311161651090.773207@ubuntu-linux-20-04-desktop>
 <87a5rc4gk7.fsf@epam.com> <770aaef8-09f4-480a-95b8-cc0448ad07ff@xen.org>
 <8734x43zxi.fsf@epam.com>
 <alpine.DEB.2.22.394.2311171339010.773207@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2311171339010.773207@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DB5PR03MB10073:EE_
x-ms-office365-filtering-correlation-id: 1ec0bf62-4dcf-4678-c12c-08dbe7bbaff0
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RwDxlEajkPfwNmA2t02GG6x4xRuJ95s8SobD5s+i4CaAYrmmrEQI2BIWPp87dp99KTBgWvvK6X+VZj9nbQh85giOiQSf9lJf1+O0IwfTHkVHHZhq74CSHbm5xqgcXVPbMrZgUgglZjLe4QK6Q6IV/q0ax0K42sNJGw8/Gtv2SHP8FXoFsotXGGTzWQJkFZYo/OTJx3BePKAClL/ZUY1ntQUgsWFKZ3d8RzV8aa9InEWQ51p+x0F46N7U5OQdXDgx3gJYBJr0CXPv9VwzB2UsjQ1+CHJgO6hIxqhKsQmG7zqtZCYT8uacyj0StD22KNalNetTeTBO9P7JUzy7R1muS5JD5yQWBnoTFaARLPNEYVewyeAZOgudFIEyd/xb+WvM1yQ+S7bQvhqlAHGWgVn0lofVDC6a9p8SmP0hKg3g7LO7Ugc2TZgVRavI60qLc/+xv7unMvHdyNw3JRv+IZB0EMax0NlKJaR4jYOyFwVsPacqvYYyyDPEoGPWHERHPLlGm9FhtJGP3APmjRje4gLywsxegmWJ3zAL/evMbGlswPU0r/afQl6wTTYWb8Cnxh5fxFPvyqDG/iePsON6NYnTTkxvTfy/wC2Oy6iIKxSa9Do55QNMhxafKjDhFCdVALVw
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(376002)(366004)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(64756008)(41300700001)(8676002)(8936002)(86362001)(5660300002)(4326008)(53546011)(55236004)(6506007)(6486002)(316002)(66556008)(66946007)(76116006)(6916009)(54906003)(122000001)(36756003)(38100700002)(2906002)(66476007)(66446008)(83380400001)(91956017)(26005)(38070700009)(66899024)(2616005)(6512007)(478600001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?0iK4t1YnVj2GUyJz1ElVuWwEMwyDCYuWvkry0Pxwjq0LKUipByC8g60lhu?=
 =?iso-8859-1?Q?92ScJ/bLBeYJ3XnSxJYtAdG4i+1P9hmayc7qTL15O3cDJV0KWFlSTx4UCh?=
 =?iso-8859-1?Q?5OOINwdZUYJIkQa9+EiBJZZdI1uuOrvt75M8BZ9a31xwPMip0iczceXQ2D?=
 =?iso-8859-1?Q?pAhXOkR7yHKX19MqHkt2giioJ41oJOjBMV/grtbjXpbPyyV8enS7B/26d/?=
 =?iso-8859-1?Q?VPUPvraD7OhygxwxauUBCHxLR7xzDFaaiASZeCd+5eJuiysqrAFjBFWile?=
 =?iso-8859-1?Q?SN1mm60yBAclzDAbTLRJgH+dOwSRXv4A2N4RojXzrCvAVfFxrACXrU6cT0?=
 =?iso-8859-1?Q?vvBR1bc1LUYs2rVRWseI7sPwAv1WWeEINHVLzZvWBzKvA6ZyAVDchd+c+5?=
 =?iso-8859-1?Q?EVjh7xmwbvWsjYIWYKuhzMimCMiPqVNapwFQUWVn+OllltSVqXBpSFUyIr?=
 =?iso-8859-1?Q?bpYr42aesTAIPnGR4zAKwa7XJTaElUnFGIvOHPCyhdr4Ysljf4QuZtE2In?=
 =?iso-8859-1?Q?PahuSrnV8Y4zAuhQuns+XY1RquMXUA1sNvjV/hkflRcFLhVqYXRBWLU3cR?=
 =?iso-8859-1?Q?dpIHGp0FHHLdr64QqtzYLxX6DwGBIW/lQim/swRSaUcLTLu5PgQ5lsC/kW?=
 =?iso-8859-1?Q?iqMXUHoRh5dOK5KAfAhSVy9sghlNZsiTsNp91Sy+ycvPFZuz8kW8zgBXxd?=
 =?iso-8859-1?Q?pDafQxSZVYSYr6S1aHvFpqG3srl4LRi0ooSBkMmPqkdwtAJykiR6AvFj9P?=
 =?iso-8859-1?Q?RNwmUmmfPUuwjfjdOtq6zElF1RMKvf/I3/k26syH018VxVEH4MvztkfQjE?=
 =?iso-8859-1?Q?ue26sxS+ji1HzItw6TlPP7Ecjh2LK/aH4+Az9RZxWeHObGwO6+HHhnfogC?=
 =?iso-8859-1?Q?S5aRi4oei/GMkPvYDP6/+uC2y1SAk3jfg7GZlHtlSkS8sAdU2KVX1x1MNL?=
 =?iso-8859-1?Q?dBLsqHnmIL8ZLNaNGo0vhGFBhuwPlnYLL44yxa+/UWA6WQKP0hPg9ynOdm?=
 =?iso-8859-1?Q?uM1ztcSSTiz9GLveaJjHSD1CA4QqOxuTl0cLx/yY65+nZZ8mdQ3YuSYTEm?=
 =?iso-8859-1?Q?aKrrGQqhOTwWR3SEt6ydiwJObBxox09O08FArAl+UP7Xds1IDAB2YhM5xW?=
 =?iso-8859-1?Q?TlUIGyKV67kYVA4ur7FHvvHHZLTVEN6Ata/ddDR03mGyP6iIameGDU6Wlu?=
 =?iso-8859-1?Q?k69lVRXqkcxsscq9zaNuym2k0h9Gnafx0BJsnKLApT6RyW908hm0ZsYre+?=
 =?iso-8859-1?Q?7sJGZchDnUyk7748EPE/VqWxr8mCux4V8jnm2cCeyhl5buCkROXTcwAJNu?=
 =?iso-8859-1?Q?IvrJIGJVIIRebk7td8cGh/wn7fal8IWBzWymlgRr6dKduqYHgbveRKLemq?=
 =?iso-8859-1?Q?cPs4gOWcMU1BTrokKebWXx71I/S4tB6dy/Re1/L2F4M+JV1PgJEvP8yXWT?=
 =?iso-8859-1?Q?b7/3Y95mBXX1Kg/6BDBOEcQDIPvtj/WglqEc9WOOEl2po/TnCbkFjLVfju?=
 =?iso-8859-1?Q?FjWXdxll+oemPFkDALf/1BjnvFA9XQTn9KdQcPlfjINn28M3blznKxeaVQ?=
 =?iso-8859-1?Q?sq8RDDEiyj9BFJ1JQL5nWh3ee+LUTZhl56JHQFtNFzvdNw/S0b6MMYjFAe?=
 =?iso-8859-1?Q?HPwWNlCKEAs/yFT6zHo6N/hbuXhM74gOBfblIYqxljj7acyV7nIea9Ag?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec0bf62-4dcf-4678-c12c-08dbe7bbaff0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 22:22:29.9601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ca53XgKNk6UQXXT/jZHAOD4f7Twak9458pQAiwulyZI24rY7SLs7wvGj9aSNX3QP8YQEzmFp/tiLEAWCFP4Utn12AzNfvb9yWFzTYq4klcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR03MB10073
X-Proofpoint-ORIG-GUID: g9e8EuLQZk6MuJoiUdmR68Mc9IfqtIUB
X-Proofpoint-GUID: g9e8EuLQZk6MuJoiUdmR68Mc9IfqtIUB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_21,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170168


Hi Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Fri, 17 Nov 2023, Volodymyr Babchuk wrote:
>> Hi Julien,
>>=20
>> Julien Grall <julien@xen.org> writes:
>>=20
>> > Hi Volodymyr,
>> >
>> > On 17/11/2023 14:09, Volodymyr Babchuk wrote:
>> >> Hi Stefano,
>> >> Stefano Stabellini <sstabellini@kernel.org> writes:
>> >>=20
>> >>> On Fri, 17 Nov 2023, Volodymyr Babchuk wrote:
>> >>>>> I still think, no matter the BDF allocation scheme, that we should=
 try
>> >>>>> to avoid as much as possible to have two different PCI Root Comple=
x
>> >>>>> emulators. Ideally we would have only one PCI Root Complex emulate=
d by
>> >>>>> Xen. Having 2 PCI Root Complexes both of them emulated by Xen woul=
d be
>> >>>>> tolerable but not ideal.
>> >>>>
>> >>>> But what is exactly wrong with this setup?
>> >>>
>> >>> [...]
>> >>>
>> >>>>> The worst case I would like to avoid is to have
>> >>>>> two PCI Root Complexes, one emulated by Xen and one emulated by QE=
MU.
>> >>>>
>> >>>> This is how our setup works right now.
>> >>>
>> >>> If we have:
>> >>> - a single PCI Root Complex emulated in Xen
>> >>> - Xen is safety certified
>> >>> - individual Virtio devices emulated by QEMU with grants for memory
>> >>>
>> >>> We can go very far in terms of being able to use Virtio in safety
>> >>> use-cases. We might even be able to use Virtio (frontends) in a Safe=
OS.
>> >>>
>> >>> On the other hand if we put an additional Root Complex in QEMU:
>> >>> - we pay a price in terms of complexity of the codebase
>> >>> - we pay a price in terms of resource utilization
>> >>> - we have one additional problem in terms of using this setup with a
>> >>>    SafeOS (one more device emulated by a non-safe component)
>> >>>
>> >>> Having 2 PCI Root Complexes both emulated in Xen is a middle ground
>> >>> solution because:
>> >>> - we still pay a price in terms of resource utilization
>> >>> - the code complexity goes up a bit but hopefully not by much
>> >>> - there is no impact on safety compared to the ideal scenario
>> >>>
>> >>> This is why I wrote that it is tolerable.
>> >> Ah, I see now. Yes, I am agree with this. Also I want to add some
>> >> more
>> >> points:
>> >> - There is ongoing work on implementing virtio backends as a
>> >> separate
>> >>    applications, written in Rust. Linaro are doing this part. Right n=
ow
>> >>    they are implementing only virtio-mmio, but if they want to provid=
e
>> >>    virtio-pci as well, they will need a mechanism to plug only
>> >>    virtio-pci, without Root Complex. This is argument for using singl=
e Root
>> >>    Complex emulated in Xen.
>> >> - As far as I know (actually, Oleksandr told this to me), QEMU has
>> >> no
>> >>    mechanism for exposing virtio-pci backends without exposing PCI ro=
ot
>> >>    complex as well. Architecturally, there should be a PCI bus to whi=
ch
>> >>    virtio-pci devices are connected. Or we need to make some changes =
to
>> >>    QEMU internals to be able to create virtio-pci backends that are n=
ot
>> >>    connected to any bus. Also, added benefit that PCI Root Complex
>> >>    emulator in QEMU handles legacy PCI interrupts for us. This is
>> >>    argument for separate Root Complex for QEMU.
>> >> As right now we have only virtio-pci backends provided by QEMU and
>> >> this
>> >> setup is already working, I propose to stick to this
>> >> solution. Especially, taking into account that it does not require an=
y
>> >> changes to hypervisor code.
>> >
>> > I am not against two hostbridge as a temporary solution as long as
>> > this is not a one way door decision. I am not concerned about the
>> > hypervisor itself, I am more concerned about the interface exposed by
>> > the toolstack and QEMU.
>
> I agree with this...
>
>
>> > To clarify, I don't particular want to have to maintain the two
>> > hostbridges solution once we can use a single hostbridge. So we need
>> > to be able to get rid of it without impacting the interface too much.
>
> ...and this
>
>
>> This depends on virtio-pci backends availability. AFAIK, now only one
>> option is to use QEMU and QEMU provides own host bridge. So if we want
>> get rid of the second host bridge we need either another virtio-pci
>> backend or we need to alter QEMU code so it can live without host
>> bridge.
>>=20
>> As for interfaces, it appears that QEMU case does not require any change=
s
>> into hypervisor itself, it just boils down to writing couple of xenstore
>> entries and spawning QEMU with correct command line arguments.
>
> One thing that Stewart wrote in his reply that is important: it doesn't
> matter if QEMU thinks it is emulating a PCI Root Complex because that's
> required from QEMU's point of view to emulate an individual PCI device.
>
> If we can arrange it so the QEMU PCI Root Complex is not registered
> against Xen as part of the ioreq interface, then QEMU's emulated PCI
> Root Complex is going to be left unused. I think that would be great
> because we still have a clean QEMU-Xen-tools interface and the only
> downside is some extra unused emulation in QEMU. It would be a
> fantastic starting point.

I believe, that in this case we need to set manual ioreq handlers, like
what was done in patch "xen/arm: Intercept vPCI config accesses and
forward them to emulator", because we need to route ECAM accesses either
to a virtio-pci backend or to a real PCI device. Also we need to tell
QEMU to not install own ioreq handles for ECAM space.

Another point is PCI legacy interrupts, which should be emulated on Xen
side. And unless I miss something, we will need some new mechanism to
signal those interrupts from QEMU/other backend. I am not sure if we can
use already existing IRQ signaling mechanism, because PCI interrupts are
ORed for all devices on a bridge and are level-sensitive.

Of course, we will need all of this anyways, if we want to support
standalone virtio-pci backends, but for me it sounds more like "finish
point" :)

--=20
WBR, Volodymyr=

