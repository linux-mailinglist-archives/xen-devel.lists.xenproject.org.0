Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C5D968DB1
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 20:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788403.1197903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slBzD-00040K-5s; Mon, 02 Sep 2024 18:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788403.1197903; Mon, 02 Sep 2024 18:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slBzD-0003xP-2a; Mon, 02 Sep 2024 18:41:11 +0000
Received: by outflank-mailman (input) for mailman id 788403;
 Mon, 02 Sep 2024 18:41:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HNBS=QA=epam.com=prvs=597514010e=artem_mygaiev@srs-se1.protection.inumbo.net>)
 id 1slBzB-0003xI-Bi
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 18:41:09 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e97bb61d-695a-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 20:41:06 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482EXVRw019208;
 Mon, 2 Sep 2024 18:40:54 GMT
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazlp17013012.outbound.protection.outlook.com [40.93.64.12])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 41df7v8jkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Sep 2024 18:40:54 +0000 (GMT)
Received: from AM9PR03MB7680.eurprd03.prod.outlook.com (2603:10a6:20b:41d::24)
 by PAXPR03MB7998.eurprd03.prod.outlook.com (2603:10a6:102:21d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 18:40:50 +0000
Received: from AM9PR03MB7680.eurprd03.prod.outlook.com
 ([fe80::5d8b:ec56:b7cf:8c4c]) by AM9PR03MB7680.eurprd03.prod.outlook.com
 ([fe80::5d8b:ec56:b7cf:8c4c%7]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 18:40:50 +0000
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
X-Inumbo-ID: e97bb61d-695a-11ef-a0b2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBT8PNXFCOISjSJLWjuM/OAqsgvXXSrTiTxj2hWmG1hjpDdI30JHQLIjvZnSDvxJHEWe6ogEFLQys1mV5bZeZQOqolYL2FDG6lV6KHKP2qNV/kQLkAyE2BnIoZ+kkzFZkYt65ZaUX3JoMRlh+YlYIcJXvWxRS2q8dDZaPuNmuaucZ/neflMRzYXj/xbLTYncK1ctjXxrChnbfbPDjj3Z02j8Fy2hPzIr5B060stBjgtQZlxpsPSXq2GJvivnmCm4MdF71Vttz+GvH9VfxgQMiw781D9afoMPZq4g+i6SrwbeR0pX8Tscvvh6xmyTh0H9VLefJVODd08bJluk13ZTGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enUvfgEjFVXYONnpXObTv6r57hsEY8Z+YAfc23vAJF0=;
 b=EVaSign1ydHszGjlP5RzTPb5xhwkC5DpdgsKztQWMyHsJkRYRi8N4TSxER1GwFScI9dLqGEZtFx58sCAgNVJVM6M0JSMeUrSEvw0E5hxGJ3xd0/7+UL1UEWKNxy/ex5eDIAgAvItAqB1VIsNwXF4T/RyPhMsblb2nSSHOia75Jq+gR+yR2ZdnFZin2EnfvRG1/C76dJcWZ/27upW8452HlmbiqlZGy3AJmH2+uiNt8AmqHFR3QSnm/UyAkACaxmtawnS0ukBH4cBP7cinH/ssnpiPbjTrjFGYfSfu3gcP7U6SWWEIxgo374rNCWVIfgj+OawQGodD9ZXGZd4QTwsjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enUvfgEjFVXYONnpXObTv6r57hsEY8Z+YAfc23vAJF0=;
 b=bNWn35vgyXtdNgxmy7VMBS/My/b2A0gE9BkWCk5OJwmTdB+xCzgRdoBx+wmzfTIOrSDVehrwdbAzHagopyN8lqReCFdS8eAUm8CbauhyjE/9CXJLCUwvrK3OKL3bJaTa8IMOGQqKpmN/zGpiZjX2i69y3Es5lcuBPJ3dU6QRreLdNed7RVuWaB1NtPfB09RGm7A2UO+PErXD9rvwXbysIfHc/ZbrS6M7i7e9ybEY+UV0VH+d0S1wkuoJiPVsj7P8aeWr3MFSc4XtrbIaQk7bjQ5UeTv9K2q2D1oFK3dQWSg64lOT9IsrPoFNsPtowD5Gl26y7eTA+28knL8BeG+s3A==
From: Artem Mygaiev <Artem_Mygaiev@epam.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "bertrand.marquis@arm.com"
	<bertrand.marquis@arm.com>,
        "michal.orzel@amd.com" <michal.orzel@amd.com>,
        "julien@xen.org" <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/3] docs: Introduce Fusa Requirement and define
 maintainers
Thread-Topic: [PATCH v3 1/3] docs: Introduce Fusa Requirement and define
 maintainers
Thread-Index: AQHa6B4zV7H33y0wnUOPwFqbHhJFSLJE/mB9
Date: Mon, 2 Sep 2024 18:40:50 +0000
Message-ID:
 <AM9PR03MB7680ECF1DDEBEF2DA1D0F9A1F4922@AM9PR03MB7680.eurprd03.prod.outlook.com>
References: <20240806163157.2850636-1-ayan.kumar.halder@amd.com>
 <20240806163157.2850636-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20240806163157.2850636-2-ayan.kumar.halder@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7680:EE_|PAXPR03MB7998:EE_
x-ms-office365-filtering-correlation-id: 2693bcd9-f884-48f2-aed8-08dccb7ec4bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?R1vKz0FtVwB04+3js5CYiKYq/i9+tYhFYqbVgLVFyq03Je+fr28fnhgy5I?=
 =?iso-8859-1?Q?2aK6kMZ8qknbwxdjNOzJMAGem6jHtbsPzCx6KsI4YmaKYA0ZYmRsgJSr8u?=
 =?iso-8859-1?Q?UmPx9hLrzXdIOrdP1EBrJc+iqMpq+SJxIVX+QkYyyRlEYnEE6jOjsgAG2m?=
 =?iso-8859-1?Q?blCB+BlciJt00v4bYyVCb1WlNJ86CWnGAw1mVAVrJ3KN5h7QFskDDvwnFn?=
 =?iso-8859-1?Q?gkFSUbrwHV3SNQ2de3Ff8tUzJeHlmHL1L4ZD/+lhrFYrrwjivuMn+N1vni?=
 =?iso-8859-1?Q?gY7Szv1Aqa7L7SXqv4HbbBntUbxP5wlOxCjY6ED2ES31u+xcP89hFZVoWX?=
 =?iso-8859-1?Q?FEibAbL2uOd+bOVuo4J4VF54KPFnmNxgbqO0O6+wt6JuvmhKU1rCIrHR4j?=
 =?iso-8859-1?Q?PlRVf4mH+ykc/9F8/8THulzXQlJmQpXcDWPdDb2p4YpwBG/BwDlHQOOq8z?=
 =?iso-8859-1?Q?ItOXtMEnJh4rjH6BkWEBKSwmUlh7CZ+yWTAQlJRp+jNa1PUj6wRYSmy1Pn?=
 =?iso-8859-1?Q?LgUkLcMXqJSDTAxKE8xUo26x95soI9KjTk8+I8CE4rJ5nldtQph9Q80qB4?=
 =?iso-8859-1?Q?zZddZo+INu5QzQe4Sen1WrWW3u1WA/MIhsITTYYNNcDyTZZB+R3nyM0Arl?=
 =?iso-8859-1?Q?AS9Qsrnr0Ce6LMVgwEIdQQuXivAGpCqtr3Qks0FHrj0knTCBkNYFEA6NPM?=
 =?iso-8859-1?Q?34wYIDWWltndrtffsZ32Mm8F2SunD1vz/CBxo11HueOLKnBIDLJ0v0tHCU?=
 =?iso-8859-1?Q?18MWScRjuazpuUw2xYMoEvNqHtJwlJc7NAAGzLWrDm/Tgek+5YGH+YSiUk?=
 =?iso-8859-1?Q?GKWH7islA97mIZ50Pu6Ge8xRtuhWjEEjVbDwmGWD7x6pl99DATdekawFeW?=
 =?iso-8859-1?Q?oK7UhB9KIaDYxlBiR2lsITGJuFLfbpb8Lc6j51We5ayeRgGeYOw2/1bLk6?=
 =?iso-8859-1?Q?NHI4gniHHmxPxmMnWSA8bQB8XIT0tcjZWDK0Q6LOgWPZj30U2iQe/nvY38?=
 =?iso-8859-1?Q?itdkf8ZHYsWdZ82MeSJzkDRc37V2/7vjJpxrOS9zwrGqrIlOYhbunJMVjh?=
 =?iso-8859-1?Q?vIzkabg65ZEdwhRTIyD7gAYQ3kL2IPrlSt4UhtFql+aqZJIRGv7/ebqF4+?=
 =?iso-8859-1?Q?humZc4QQv8pXzLSlIOTYNBpKfCXjkeLysNO9Hp7UkeXWqSxhFNdAUv6d+0?=
 =?iso-8859-1?Q?QPmWlnvZYsiDfslG/Ya3BLHVX/vfQ8wzAvPPiIMrGssiwbnNjw2+R7byaY?=
 =?iso-8859-1?Q?aXWBip+CI3/CUMyii6gn9rN3/j1wL2OOLzX2EKqMBt/HlM7HWzxYW/1mvZ?=
 =?iso-8859-1?Q?vvTVjwCUoem+iO7mo/4DKg5PEjaoNLXC8hmViOMMBwta9ks8bQ7naFhxE/?=
 =?iso-8859-1?Q?Dk1nldfPr0t/KM2Dgg7hU7aAri9r9Ih/uMcJ/RTXgp/eB0h+THs1E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7680.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?r8Z5VRU82aENHPzxb1YbBV8ilEvgUIRPapp5cxF6d8DT2LUVy+8tQuSGtp?=
 =?iso-8859-1?Q?/iFnWWPm72xLdQ9+UH60kpscBPRosEcNMYAjdU8gaOK5Y6qNOhcrjTtGER?=
 =?iso-8859-1?Q?zzMRT9foEemkhkMOS5QbFjqW0F6lR1I8Dzsa46Husj7GurNeSYaTMWFI+s?=
 =?iso-8859-1?Q?1qpONTSU7sVpp1wo4uMoAj66jM4yyfxyTCPeidB0GSIwSu999kBMCfnpc7?=
 =?iso-8859-1?Q?g6oVkRNXnHppswaR3h3zDoyprbAfTo2XwDwybkvlsPJLA/9SVfSemdLC5/?=
 =?iso-8859-1?Q?QswBo0HOZ2odMVwJE/LaH4n68hHRKU7QZITOvCU1y0k4PHqKv6sk22HCnk?=
 =?iso-8859-1?Q?cbR7pwkKwXOj2kABufz8vT2f/fSsZ/+Zt4cM90ybjG6lxU8Ah8aAE//BNc?=
 =?iso-8859-1?Q?1DdXImtG9pr9zPIx9VOqbHjCpD4bAmxfs0bSdehbqXxIfz3d56E6KM5pW6?=
 =?iso-8859-1?Q?edW4/vN4+a2qcobGkFviydM1+1VZ6YX8z1GERc47yRQXo6X0P2Aolz9b0z?=
 =?iso-8859-1?Q?rnlFGf93TC8ca8W2rLS4PG8kNkMYLrwvWKMaUZoBObQOsSEir+bF9fVZ7K?=
 =?iso-8859-1?Q?Jjk7k6H5YOa0534W5BZ7LpKUsyvnJM42ObVyaHZd/ogl53812HlcIBO7XT?=
 =?iso-8859-1?Q?o091yDPhD4LGPWkenLwa+3KD7U+yHUSeEtXpfgoK2yBXQm9BtTpVZWSlJT?=
 =?iso-8859-1?Q?y3uXMA9Q4Vq3RPwOARcuZvy0d0mGFhY32tfdNPknV5kGanLLsl+C3He1LY?=
 =?iso-8859-1?Q?oi1duCvqH6Q8fm4VDgne3zi/h8iYK2PhEZXbaNVRjf4HI9VV9ldAtVt7A9?=
 =?iso-8859-1?Q?YCIep/gKAInsceBOe+sQHQvoXI7H4siI1PBnrPAfE3fMYeh/qQU2mkr84q?=
 =?iso-8859-1?Q?MSeaMI+P9hJEAGRRfHrnAm3qVSI31/ZNCp3qojngjP6AY6YLMMUJVeOYWf?=
 =?iso-8859-1?Q?Gejlvz/5+n40sZgEQ5/hddNuSe9ln1P58cdq2Pn7f+4MlSy7o/iz8NMwLm?=
 =?iso-8859-1?Q?PXpZP1POV746DhH7MktsW9RdFSflsDHLklnxgqnEdM5yZXaE9FQveZZwne?=
 =?iso-8859-1?Q?6S5xkWK49A3kAnUsmxq6Ey9qjCq7AFsYJv6XNR/khr5cLFqN09FQKWehaa?=
 =?iso-8859-1?Q?eBkg3solDORs1Kj3yNM575eHPoORve+V5uJGYwdQ78wSeRC6PTZ5ctpPfl?=
 =?iso-8859-1?Q?4fQM4YuqFPoJ0TmIrOLhoRGHoxL0AyBk4xb7HIhGqNU2DMB2GeSTZR2E7X?=
 =?iso-8859-1?Q?QgVmFUG0aBqbQt5z0/FJUI3gxPoSGquYbIieGma4GRZCqUpcYGZwkw7S7l?=
 =?iso-8859-1?Q?cOTWtmIakSAN22HdEYPxs8OSLG+8K8mRk0qT+92odZYGakMUh2pBV00cmf?=
 =?iso-8859-1?Q?mbtr9PG0CrQxfrx8XYBvC2iBpM+BhezuQDZBWEDxi48ul9ACMvV6l88EF/?=
 =?iso-8859-1?Q?QBMDKq8zFMoQXZAGEv5GXX64ke7/uWy5JX7kZemt2BfJgb/0FTnYvXcKY9?=
 =?iso-8859-1?Q?VWk3yxJQBuVdxE7W9Bv0wzVPJenQte9udJJ7MKzfpxA802bz703oMoOjid?=
 =?iso-8859-1?Q?sDcx5QWMaTM9/aaEOnZhFaHbFMFO0q7hTQHNke5LWiu5IX3P3d5K7FDM70?=
 =?iso-8859-1?Q?DHBO5o0SHghy8qiIUdGsvZeTLmeuQatvPR?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7680.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2693bcd9-f884-48f2-aed8-08dccb7ec4bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 18:40:50.6532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pC6E+EBQCasi5OUEEk6GE1NnIjV7GvcmkP3KEdSyQM7RTcuiH167VBTe/TSc194pBhwYJtV1tiD/1PVmfE9Azw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7998
X-Proofpoint-GUID: xRQ51itKbYxFcUffO_9ta72QwxIQkw07
X-Proofpoint-ORIG-GUID: xRQ51itKbYxFcUffO_9ta72QwxIQkw07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_04,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409020148

Hi Ayan=0A=
Sorry for delay - I was ill and=A0then off for the whole August=0A=
=0A=
Just for the record:=0A=
Acked-by: Artem Mygaiev <artem_mygaiev@epam.com>=0A=
=0A=
Best regards,=0A=
-- Artem Mygaiev=0A=
=0A=
________________________________________=0A=
From:=A0Ayan Kumar Halder <ayan.kumar.halder@amd.com>=0A=
Sent:=A0Tuesday, August 6, 2024 19:31=0A=
To:=A0sstabellini@kernel.org <sstabellini@kernel.org>; bertrand.marquis@arm=
.com <bertrand.marquis@arm.com>; michal.orzel@amd.com <michal.orzel@amd.com=
>; ayan.kumar.halder@amd.com <ayan.kumar.halder@amd.com>; Artem Mygaiev <ar=
tem_mygaiev@epam.com>; julien@xen.org <julien@xen.org>=0A=
Cc:=A0xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
Subject:=A0[PATCH v3 1/3] docs: Introduce Fusa Requirement and define maint=
ainers=0A=
=A0=0A=
The FUSA folder is expected to contain requirements and other documents=0A=
to enable safety certification of Xen hypervisor.=0A=
Added a intro to explain how the requirements are categorized, written=0A=
and their supported status.=0A=
Also, added index.rst for inclusion in build docs.=0A=
=0A=
Added maintainers for the same.=0A=
=0A=
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>=0A=
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>=0A=
Acked-by: Michal Orzel <michal.orzel@amd.com>=0A=
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>=0A=
---=0A=
Changes from :-=0A=
=0A=
v1 - 1. Added a comment from Stefano.=0A=
2. Added Ack.=0A=
=0A=
v2 - 1. Renamed README to intro and changed the format from MD to RST=0A=
(as the majority of files are in RST format and it gets picked during=0A=
building of the docs).=0A=
However, the actual contents hasn't changed so I am keeping the acks.=0A=
=0A=
2. Added SPDX license identifier to the intro file.=0A=
=0A=
=A0MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 9 +++++=0A=
=A0docs/fusa/index.rst=A0=A0=A0=A0=A0 |=A0 9 +++++=0A=
=A0docs/fusa/reqs/index.rst |=A0 9 +++++=0A=
=A0docs/fusa/reqs/intro.rst | 86 ++++++++++++++++++++++++++++++++++++++++=
=0A=
=A04 files changed, 113 insertions(+)=0A=
=A0create mode 100644 docs/fusa/index.rst=0A=
=A0create mode 100644 docs/fusa/reqs/index.rst=0A=
=A0create mode 100644 docs/fusa/reqs/intro.rst=0A=
=0A=
diff --git a/MAINTAINERS b/MAINTAINERS=0A=
index 7c524a8a93..0d328e065c 100644=0A=
--- a/MAINTAINERS=0A=
+++ b/MAINTAINERS=0A=
@@ -314,6 +314,15 @@ F: xen/arch/x86/include/asm/x86_*/efi*.h=0A=
=A0F:=A0=A0=A0=A0=A0 xen/common/efi/=0A=
=A0F:=A0=A0=A0=A0=A0 xen/include/efi/=0A=
=A0=0A=
+FUSA=0A=
+M:=A0=A0=A0=A0 Stefano Stabellini <sstabellini@kernel.org>=0A=
+M:=A0=A0=A0=A0 Bertrand Marquis <bertrand.marquis@arm.com>=0A=
+M:=A0=A0=A0=A0 Michal Orzel <michal.orzel@amd.com>=0A=
+M:=A0=A0=A0=A0 Ayan Kumar Halder <ayan.kumar.halder@amd.com>=0A=
+M:=A0=A0=A0=A0 Artem Mygaiev <artem_mygaiev@epam.com>=0A=
+S:=A0=A0=A0=A0 Supported=0A=
+F:=A0=A0=A0=A0 docs/fusa/=0A=
+=0A=
=A0GDBSX DEBUGGER=0A=
=A0M:=A0=A0=A0=A0=A0 Elena Ufimtseva <elena.ufimtseva@oracle.com>=0A=
=A0S:=A0=A0=A0=A0=A0 Supported=0A=
diff --git a/docs/fusa/index.rst b/docs/fusa/index.rst=0A=
new file mode 100644=0A=
index 0000000000..13bf4e8e23=0A=
--- /dev/null=0A=
+++ b/docs/fusa/index.rst=0A=
@@ -0,0 +1,9 @@=0A=
+.. SPDX-License-Identifier: CC-BY-4.0=0A=
+=0A=
+Functional Safety documentation=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=0A=
+=0A=
+.. toctree::=0A=
+=A0=A0 :maxdepth: 2=0A=
+=0A=
+=A0=A0 reqs=0A=
diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst=0A=
new file mode 100644=0A=
index 0000000000..78c02b1d9b=0A=
--- /dev/null=0A=
+++ b/docs/fusa/reqs/index.rst=0A=
@@ -0,0 +1,9 @@=0A=
+.. SPDX-License-Identifier: CC-BY-4.0=0A=
+=0A=
+Requirements documentation=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=0A=
+=0A=
+.. toctree::=0A=
+=A0=A0 :maxdepth: 2=0A=
+=0A=
+=A0=A0 intro=0A=
diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst=0A=
new file mode 100644=0A=
index 0000000000..d67b18dd9f=0A=
--- /dev/null=0A=
+++ b/docs/fusa/reqs/intro.rst=0A=
@@ -0,0 +1,86 @@=0A=
+.. SPDX-License-Identifier: CC-BY-4.0=0A=
+=0A=
+##################################=0A=
+Requirements Introduction Document=0A=
+##################################=0A=
+=0A=
+This folder contains a set of requirements describing Xen and its implemen=
tation=0A=
+in a form suitable for a safety certification process.=0A=
+=0A=
+The status is experimental and it is maintained on a best effort basis. Th=
e=0A=
+requirements may get slightly out of sync with the code. We are actively w=
orking=0A=
+on a process to keep them updated, more details to follow.=0A=
+=0A=
+The requirements writing style is inspired from the ANSI/IEEE guide to Sof=
tware=0A=
+Requirements Standard 830-1984.=0A=
+=0A=
+The requirements are categorized as follows :-=0A=
+=0A=
+1. Market requirements - They define the high level functionalities of the=
=0A=
+hypervisor without going into concepts specific to Xen. Those should allow=
 a=0A=
+system architect to understand wether Xen is providing the functionalities=
 it=0A=
+needs for its system. This is the top level of the requirements.=0A=
+=0A=
+2. Product requirements - They define the Xen specific concepts and interf=
aces=0A=
+provided by Xen without going into implementation details. One or several =
of=0A=
+those requirements are linked to each market requirement. An Architect can=
 use=0A=
+them understand how Xen fulfils a market need and design how Xen should be=
 used=0A=
+in his system.=0A=
+=0A=
+3. Design requirements - They describe what the software implementation is=
 doing=0A=
+from a technical point of view. One or several design requirement together=
=0A=
+define how product requirements are fulfilled technically and are linked t=
o=0A=
+them. An implementer can use them to know how to write or understand the X=
en=0A=
+code.=0A=
+=0A=
+The requirements are linked using OpenFastTrace=0A=
+(https://urldefense.com/v3/__https://github.com/itsallcode/openfasttrace/b=
lob/main/doc/user_guide.md__;!!GF_29dbcQIUBPA!3MNZCxyEF3Nx0ElHxeOSL8GQue43w=
rSJ410vOujPqaM4D7gWoONkKa85oOiyDfxDy9iQ7xY4oyYT0DQ9nIPopGcKGbkI$ [github[.]=
com]).=0A=
+OpenFastTrace parses through the requirements and generates a traceability=
=0A=
+report.=0A=
+=0A=
+The following is the skeleton for a requirement.=0A=
+=0A=
+Title of the requirement=0A=
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=0A=
+=0A=
+`unique_tag`=0A=
+=0A=
+..=0A=
+=0A=
+=A0 Each requirement needs to have a unique tag associated. The format is=
=0A=
+=A0 req_type~name~revision.=0A=
+=0A=
+=A0 Thus, it consists of three components :-=0A=
+=A0 requirement type - This denotes the category of requirement. Thus, it =
shall=0A=
+=A0 be 'XenMkt', 'XenProd' or 'XenSwdgn' to denote market, product or desi=
gn=0A=
+=A0 requirement.=0A=
+=A0 name - This denotes name of the requirement. In case of architecture s=
pecific=0A=
+=A0 requirements, this starts with the architecture type (ie x86_64, arm64=
).=0A=
+=A0 revision number - This gets incremented each time the requirement is m=
odified.=0A=
+=0A=
+=0A=
+Description:=0A=
+This shall describe the requirement in a definitive tone. In other words,=
=0A=
+the requirement begins with 'Xen shall ...'. Further, the description is=
=0A=
+expected to be unambiguous and consistent.=0A=
+=0A=
+Rationale:=0A=
+This describes a rationale explaining the reason of the presence of the=0A=
+requirement when this can help the reader. This field can be left blank.=
=0A=
+=0A=
+Comments:=0A=
+This describes the use cases for the requirement when this can help the=0A=
+reader. This field can be left blank as well.=0A=
+=0A=
+Covers:=0A=
+This denotes the unique_tag of the parent. This field is non existent for =
the=0A=
+market requirement as it is the top level.=0A=
+=0A=
+Needs:=0A=
+This denotes the requirement type of its children. This field is non exist=
ent=0A=
+for the design requirements as there are no subsequent requirements linked=
 to=0A=
+them.=0A=
+=0A=
+=0A=
+The requirements are expected to the technically correct and follow the ab=
ove=0A=
+guidelines.=0A=
--=0A=
2.25.1=0A=

