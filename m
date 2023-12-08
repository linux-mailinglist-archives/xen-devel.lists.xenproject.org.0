Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202FC80A01F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 11:00:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650536.1016174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXeS-0007UV-CA; Fri, 08 Dec 2023 10:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650536.1016174; Fri, 08 Dec 2023 10:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXeS-0007Rt-9H; Fri, 08 Dec 2023 10:00:08 +0000
Received: by outflank-mailman (input) for mailman id 650536;
 Fri, 08 Dec 2023 10:00:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wu8/=HT=epam.com=prvs=670673ed10=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1rBXeQ-0006Q1-MD
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 10:00:06 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8eaf77c3-95b0-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 11:00:04 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B862YxO032203; Fri, 8 Dec 2023 09:59:53 GMT
Received: from eur02-db5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2104.outbound.protection.outlook.com [104.47.11.104])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uuaysc3rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 09:59:52 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM0PR03MB6276.eurprd03.prod.outlook.com
 (2603:10a6:20b:15b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 09:59:49 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::3776:9f2d:8305:b645]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::3776:9f2d:8305:b645%6]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 09:59:49 +0000
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
X-Inumbo-ID: 8eaf77c3-95b0-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEBWixT5L1lAKLEg8afPhdSltDQ30e14FFJXorHIpA8NZo+IOALeV+NJzMZsLi/JY4V7159FNw2twS9//7lSIKptZeB1lkLtgatk4ogWBSro+72K9mg8eXU/NJRF3HxYPr9O+F1yRdtfjGeGbmzfufI9BrIGrqPI83MZ3QKgEdYq8lho3v29YTCEp9/zFHK04TF9jJrmg9lO9cj7MEpNdH/aVH1zbsIF9/NuTIVJW58NUKrgI/tzvmX9yGXVr9W3xuTQktau5jnw23JfeaFCxruo+0PA9Ndz2cAQ1aHM5C11FB0B8atrV6l0a0vX1vfDB+M4Vtty43OSUk7yNN7qvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1Z4NGrVxo/17WzJ6qKz8BIGrjuk3RC2hZ4XhSwzyzc=;
 b=b+Qybmq0ZxUqVx6dG7cFw/9gd6R8AcsN/bKAeebJfd5LfPU2AlWJfLwZir6L/vGufOspYuh066YNWpuPFPvqcZ42y3+Q+DdQpmlbOAEZiZmdfIP9dnhQJGfEpEdPouzJF89J/clokNPmcJpagedDo75hESG3VkX6Lm/TOGrFLJYLHA04u7oTU+5U/0hD7gJaYoFXqIGVhd0vzNllhMxkxZ1MK6M7Agd9WKBD0wtjVvTNkyqN4gN2rpY1SQcWAwpaj17jyalQPiHzzhuWPriM6uhELSA57LAxhvNMhDhTQVVEHBHO5tWzR2x827yz0a2qoG62aor2tHf7HMFHhack7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1Z4NGrVxo/17WzJ6qKz8BIGrjuk3RC2hZ4XhSwzyzc=;
 b=P1Ik+TXzfXe1zEPq2qMcZ4cOWZFJshduLvnxua+chmY3spC/Thm2nfAyy1klehoVuyYGbT1RLpdkwpeSHVEy56nomMJW1dY/Fl5PjqP6cNPGGVryuU7NVd/8dWLu03AWTO36e7AChxHxn9IS2RqTcUJs8niVN2ZsNCltYWnt42GxGdr7dwAxFucUbKXz3KPqoMx7BE9vLIJyXNi3w1UhDRN3WXL7giy9kCr4Fax2jr4+e+g/k8aLC3Cr5+q9Bsl3ujfm4S8cbQc1CtIDW2wvCrlVbDsbIOADWZKtnn35jrGqTgre4VP3RBnaiDLFBL+oWPv3r/D+CLm69gTxx3rJOA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: David Woodhouse <dwmw@amazon.co.uk>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Vikram
 Garhwal <vikram.garhwal@amd.com>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>
Subject: Adding MSI support for virtio-pci to QEMU as Xen backend on ARM
Thread-Topic: Adding MSI support for virtio-pci to QEMU as Xen backend on ARM
Thread-Index: AQHaKbww0FY6S40rbUa5Jf3nCF0vTg==
Date: Fri, 8 Dec 2023 09:59:49 +0000
Message-ID: 
 <PAVPR03MB10102178A70BF72984FFAF8CD848AA@PAVPR03MB10102.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM0PR03MB6276:EE_
x-ms-office365-filtering-correlation-id: c450d0ff-ff61-4505-136f-08dbf7d46a4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kDTE8UBcSDZaQ3P0HXk3Gszkg/4mR79RojZnRYqk2BEoKKRWX12FmqssOm8UbNiTugrd0e27DGRuChj7d0C1qvGgOrIGe9HHM31P4KkqNXXqKH7LQk644TxfTIyy1cvk9qW7tG3fnqXjQzejZPupko1htCNthv2iopO/pbZiNUuZbbjoS2fHLLZXAEIs3B6+W7amgaYbR56ED94S56hDr6Zkpqgps7FCC2SkvaZ5Gw1dc47ovfMS49z0PcAJcZ+PmhSnh88gmM9zk0xAT7q2TDvHJBAO01yCWAs3Fby4akaRNMGHpo3knojRY4xLrvCoEnhEC39gIYoXV2krTuGnT6/96yi5MvBOLP/1tQyunTlY0sXumnBxhDVyTqqpux7rO4va6/cwzvQHCho+gMceAlQCToeWKgS5y8BRoIvp0vtCPwoTXymaCoHyHrDCaQ1ONyiFwmUeiQZb+Nw2/XgG9T6rC9mRo+zO9z768OUG5+wlQFYHBKwlmmilAcMsc/enzL0WvGxi74oTJ3ow77AWTTEvvBac3FfsfET/fLTgdpZBHeAcGH2a7RIiQli6Ls++CUXvzFuOOETrF/FPY5afxWT/bEcdtGePM3fYm1OSxiKwT/iYTxX+B8tpIMCbtzwm
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(376002)(396003)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(41300700001)(33656002)(2906002)(4744005)(38070700009)(107886003)(6506007)(478600001)(9686003)(54906003)(6916009)(64756008)(66946007)(66556008)(91956017)(66476007)(76116006)(66446008)(122000001)(86362001)(52536014)(316002)(55016003)(4326008)(8676002)(8936002)(71200400001)(5660300002)(7696005)(38100700002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?yZFKfuY8tybgC0yMP3Gd05XlJ+ksfTuARQYNFiQkjDzyu6E1BBNmPHeEf3?=
 =?iso-8859-1?Q?jesUvpvyQoXi5mpvM7jXoFc50YFY/9X2ybVlJwkwQoMuHPgBiJxYkGKo2Z?=
 =?iso-8859-1?Q?RCTu/15S+My4X9UNjAgru0awz8fBcMUCihrHdYnIgX3jnRTp/S/BBhUhgT?=
 =?iso-8859-1?Q?zd6eCUvlKi+QWy9EGronRJddv4vK0UqZPTD51wvuu/G2mCNPlliWZNxHtt?=
 =?iso-8859-1?Q?RedDMOvaAQiLi4bjthf6UHEhnr0uZZRGhMLyY8pbNGZ1VdKxQZdKy0M82e?=
 =?iso-8859-1?Q?pNyTclpltMOZOVyUHUrgWIWEbJRMBL05VF3YX0wUWte71szhakA4R1twen?=
 =?iso-8859-1?Q?FTGzA4KVl8xuGiqjN0URgElT+hT5ZUXXYxMkG2aV1XvJAyc/by+Ny0qRtz?=
 =?iso-8859-1?Q?Yy5f2GJ/hoCfqouJtmz5+cctoPBe6pC7s8sVUWkFGVI+o1+0ZBAoLKe+QO?=
 =?iso-8859-1?Q?taC5ZgkJofx5MM+xf9ASg9UDGBFqMfwOez+B/RFga1WUH1TDqFTKjOZfOS?=
 =?iso-8859-1?Q?MeIfGmkb4WahKuc/KXP0Rug6eyXGxnqID+RIuuMj0QdTc4RaoOnuAp9v/7?=
 =?iso-8859-1?Q?aatwgIk6dtjyuaLtt1IzlQQNv1QbikpXiTPlFuXW7H8+0M0bMN7D7XMRPJ?=
 =?iso-8859-1?Q?coZueXtrhjBs9mFJAfKL9g4WHp3A7GFcu4hPZFe86A1RjZk8mfACiUgl+d?=
 =?iso-8859-1?Q?+RNhW7hPE/WfvvStxQkDFT/zXZbvmuDOJkSqC7qUC3hYsWiPZgJVigRuT+?=
 =?iso-8859-1?Q?6dyEm80dC5elNWya/re1pUADRLPI73IXwisyuE/9BaFFO7P/Cep3z9UByf?=
 =?iso-8859-1?Q?OX8PvWiTqwZ3QAdJ5lxX+fLhaNSszAzCUR4gnmmfcvMP84n3KOFZUp7rLF?=
 =?iso-8859-1?Q?gsugRB43Nd0j6st+FMM9sfSR78rmQavr2kOKr3M83EugsqIkOFi9SeCO9z?=
 =?iso-8859-1?Q?6/Yi2TLVsZsuBsOvm9SLVLc4st0tIhtuqn9RuTMdwkFbxoEX5lr/8j30cQ?=
 =?iso-8859-1?Q?U3nbvLJ+50FpcuT4OI9jRA6oti6T7UL9w9oHc7EB57b6EGdXVfC5f25LOl?=
 =?iso-8859-1?Q?SzmWZQpmTewnIabnEqCecvrIwCLKr43u3Tr1Qkg2O+NcuYDwHDttfE5w0f?=
 =?iso-8859-1?Q?v+OJ85nxPLrD4fswogs9Ggl34mBZVd5MMNXRNvDUBmCFZ9COTJUL4cYDZz?=
 =?iso-8859-1?Q?O1dHEKNi2csGq/2ae0RRwd71yTUvY0oK/ugYzia+ZJW4uUVmenNWq158la?=
 =?iso-8859-1?Q?O1bh9TvN0TDRIrS8R/3ipcydP2W/KOgFXjkuA+hJwVaHnuWpe3GAhANRgg?=
 =?iso-8859-1?Q?AJ7zKV+Yq/RyPiXkZtRqJrto2H+/Bu5ikuH7OF3v1XojBBiqpqP+YYIYws?=
 =?iso-8859-1?Q?OaQtKccJ82HYa9Qo6z2E3nsq3oasuuUqba9Gnx0gYnvWMO7wjFpVfrVk0D?=
 =?iso-8859-1?Q?fFgTGNJ4IKNVFbj4SecX8SPxZUzUIRcGI6Yer3tqr9PObF91pk40smMkDs?=
 =?iso-8859-1?Q?aV230DcYx3J8UzDaNF54p+KQPzhbMBg6uPd3+UWfWsYS30mQE/HFzGBCD0?=
 =?iso-8859-1?Q?Dz/0qzaeNJxX4rwIFKmTO6DkDKWgUPecLd5LQLYe/6govWnX1VjYrJFCMt?=
 =?iso-8859-1?Q?9IwNPHg5v7B70dBBkT4hKZWoHg8rNXMrUT?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c450d0ff-ff61-4505-136f-08dbf7d46a4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2023 09:59:49.1371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ls5OQYgTtOkwGKsAcEEW1CYzhQlao6M8e6KDfHrO6+gSSDTFpfy6AXX/nM/FHWjWyaSYymN97CFPij44WEZaUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6276
X-Proofpoint-ORIG-GUID: _o3xShd1H533WOdEa7oUNR4aCllM6rL0
X-Proofpoint-GUID: _o3xShd1H533WOdEa7oUNR4aCllM6rL0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_04,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=337 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 clxscore=1011 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312080082

Hello everyone,=0A=
=0A=
I am currently working on adding MSI support to virtio-pci on ARM with Xen.=
=0A=
As far as I understand QEMU Xen ARM machine that is used for virtio-pci dev=
ice emulation does not initialize any interrupt controllers. And that makes=
 it somewhat unclear what is the best approach to adding the MSI support. S=
o, I would appreciate some thoughts on this.=0A=
To trigger the MSI interrupt in Xen guests we basically need to call a sing=
le DMOP, which I am also implementing.=0A=
=0A=
So far, I have come up with 3 possible approaches:=0A=
1. Hooking up the existing GIC code to the Xen Arm machine and extending it=
 with the DMOP call.=0A=
2. Writing some new barebones GIC implementation with only the required met=
hods (something similar to xen_apic.c).=0A=
3. Just hooking up the DMOP call to the existing PCI code based on xen_enab=
led() check.=0A=
=0A=
Maybe there is something else that is better that I have missed.=0A=
=0A=
Best regards=0A=
Mykyta=0A=

