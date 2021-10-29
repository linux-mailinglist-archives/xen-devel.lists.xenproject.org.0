Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDB543F3EF
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 02:31:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218357.378752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgFme-000412-Fj; Fri, 29 Oct 2021 00:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218357.378752; Fri, 29 Oct 2021 00:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgFme-0003yZ-Bf; Fri, 29 Oct 2021 00:30:12 +0000
Received: by outflank-mailman (input) for mailman id 218357;
 Fri, 29 Oct 2021 00:30:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OkWz=PR=oracle.com=alec.r.brown@srs-us1.protection.inumbo.net>)
 id 1mgFmc-0003yE-Bs
 for xen-devel@lists.xenproject.org; Fri, 29 Oct 2021 00:30:10 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ee2907c-384f-11ec-84be-12813bfff9fa;
 Fri, 29 Oct 2021 00:30:09 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19T021G2020641; 
 Fri, 29 Oct 2021 00:29:21 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3byjkf5r3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 00:29:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19T0Fdvg004874;
 Fri, 29 Oct 2021 00:29:20 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2047.outbound.protection.outlook.com [104.47.57.47])
 by aserp3020.oracle.com with ESMTP id 3bx4gf6g03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 00:29:20 +0000
Received: from DM6PR10MB2986.namprd10.prod.outlook.com (2603:10b6:5:6b::26) by
 DM6PR10MB4171.namprd10.prod.outlook.com (2603:10b6:5:21f::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15; Fri, 29 Oct 2021 00:29:18 +0000
Received: from DM6PR10MB2986.namprd10.prod.outlook.com
 ([fe80::4962:3775:18b3:ccc8]) by DM6PR10MB2986.namprd10.prod.outlook.com
 ([fe80::4962:3775:18b3:ccc8%6]) with mapi id 15.20.4628.020; Fri, 29 Oct 2021
 00:29:18 +0000
Received: from alec-orcl (73.61.222.52) by
 BL0PR1501CA0031.namprd15.prod.outlook.com (2603:10b6:207:17::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Fri, 29 Oct 2021 00:29:15 +0000
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
X-Inumbo-ID: 5ee2907c-384f-11ec-84be-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=9wUGV/buFXwauNHjy4oujs13zhdzLIE363Ppd2jIzmU=;
 b=NkD4bO/cC0B43hQe85eIgleq/weSA/mkroVtewPhRmd65R/XtRyJnYDYeFyzO1Dk42k2
 fHjnIladbSlNYDqWCWz208SypELeKcAKL/NdWZN1NDnPmN0hekTEq2ELWqumGed69MIi
 CKRdiMCeeqzaH8LXTpO2W5v+huc8929mvtI1KUEPvTAT5SlyyKOGPLmsri4BaTsL9eFe
 t7SBF5CqkvJQfbXDhJC1mfimVdFF/UG+u9fFTyJujmQ9wy3UL8gWL/Gxh0BQ7tUxJeNU
 OqO1V3flytl2d5Yf47AsdoCt4Jrc2w8bh8tqv7T202cb7uuNa51UtlJeS+LakFpC7W8A Ow== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neOsaePSKc2m3S0xfO2mE76+tPejnvvMIOMvQjQdHlqCdSpshayZcPhZL4UlInw9UX3qC9kA5f4XwjidOf8TSF4mOtkyXoqtRi8/PoJ+QEqyTdW3MF/qwZGgKotd/1xcJNCD+MzeNr70qCeLrbOThgCWxjXS4Efh2EwM5bIcY3/wVKFcdc4Z8cmn/ZmWrwT5VTDlO549gGEswY0njJVv8sUyjMsdCaMbqLqijxKfPC38SMes6/7wz8/K0mGzVtwgVwiHZ3e0Fit9lt9msyk7rHtnwAnuxJP8qtDVAktGf5DgE7srh0CgHEFzbyhtmud0hwkMDsfxDfWQm59qJyDyYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wUGV/buFXwauNHjy4oujs13zhdzLIE363Ppd2jIzmU=;
 b=F8i7WaaCl173bq70zmVfdXgZ+iX+KtrN9Usg9SP2ZJmWxpeRTyc6hj0iOjDDqJAdB1wIWDi3qZAdBJwgTyypPXB/IBc5Mc9bE0j87af8BNlLV4YuOfdgadKQCvgXo+e7MPhQQb/RBNbQQk594MUeJLeKZYwnbB7joLmjal7d4VemJmL2uoySrs1LiMike/dXGFNovaXPlxy90siE+Z6/7Tus2peBms5m22VBniWg0TvC4CA5mZV+p6sanVGuKqIFkqKkmt3RiJaLX6xWOEwQs0Pfvf9VwaRviGZiAtsq25IEpRh63SPTU8GBXe31y3uGfdbhh81nSGd5vdPKZXav6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wUGV/buFXwauNHjy4oujs13zhdzLIE363Ppd2jIzmU=;
 b=eY2jh/F5MEWl1VxkNV0+qAwXaoKmPK/EFs+5pe4mH8ks59RxdUpO8niDM1d8qBLt+5H/N/fj78v9pduZa2hjSzawYnrSnkHEAN+clE14LE+JjqYuibgFCmm5vJmK7HOWH3ibVVg19V/NlDibqvBSB/F3fq4q7oCR1kErAGJhYRw=
Authentication-Results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=oracle.com;
Date: Thu, 28 Oct 2021 20:29:13 -0400
From: Alec Brown <alec.r.brown@oracle.com>
To: Julius Werner <jwerner@chromium.org>
Cc: "coreboot@coreboot.org" <coreboot@coreboot.org>,
        "grub-devel@gnu.org" <grub-devel@gnu.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "systemd-devel@lists.freedesktop.org" <systemd-devel@lists.freedesktop.org>,
        "trenchboot-devel@googlegroups.com" <trenchboot-devel@googlegroups.com>,
        "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
        "x86@kernel.org" <x86@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Aleksandr Burmashev <alexander.burmashev@oracle.com>,
        "allen.cryptic@gmail.com" <allen.cryptic@gmail.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "ardb@kernel.org" <ardb@kernel.org>,
        "btrotter@gmail.com" <btrotter@gmail.com>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        "dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
        Eric DeVolder <eric.devolder@oracle.com>,
        Eric Snowberg <eric.snowberg@oracle.com>,
        "frowand.list@gmail.com" <frowand.list@gmail.com>,
        "hpa@zytor.com" <hpa@zytor.com>,
        "hun@n-dimensional.de" <hun@n-dimensional.de>,
        "james.dutton@gmail.com" <james.dutton@gmail.com>,
        "javierm@redhat.com" <javierm@redhat.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        Kanth Ghatraju <kanth.ghatraju@oracle.com>,
        Konrad Wilk <konrad.wilk@oracle.com>,
        "krystian.hebel@3mdeb.com" <krystian.hebel@3mdeb.com>,
        "leif@nuviainc.com" <leif@nuviainc.com>,
        "lukasz.hawrylko@intel.com" <lukasz.hawrylko@intel.com>,
        "luto@amacapital.net" <luto@amacapital.net>,
        "michal.zygowski@3mdeb.com" <michal.zygowski@3mdeb.com>,
        "mjg59@google.com" <mjg59@google.com>,
        "mtottenh@akamai.com" <mtottenh@akamai.com>,
        "nico.h@gmx.de" <nico.h@gmx.de>,
        "phcoder@gmail.com" <phcoder@gmail.com>,
        "piotr.krol@3mdeb.com" <piotr.krol@3mdeb.com>,
        "pjones@redhat.com" <pjones@redhat.com>,
        "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>,
        "rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Ross Philipson <ross.philipson@oracle.com>,
        "sjg@chromium.org" <sjg@chromium.org>,
        "trini@konsulko.com" <trini@konsulko.com>,
        "tyhicks@linux.microsoft.com" <tyhicks@linux.microsoft.com>,
        "ulrich.windl@rz.uni-regensburg.de" <ulrich.windl@rz.uni-regensburg.de>,
        "wvervoorn@eltan.com" <wvervoorn@eltan.com>,
        "xypron.glpk@gmx.de" <xypron.glpk@gmx.de>,
        "rharwood@redhat.com" <rharwood@redhat.com>
Subject: Re: [External] : Re: [SPECIFICATION RFC v3] The firmware and
 bootloader log specification
Message-ID: <YXtAWTHgN6o39Jwj@alec-orcl>
References: <DM6PR10MB2986A960E859A744FDC3875ABCDE9@DM6PR10MB2986.namprd10.prod.outlook.com>
 <CAODwPW-bbHp3Nxbr9VRt0hZMX0xRnwbGb07PS=8uysXEKFs61w@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwPW-bbHp3Nxbr9VRt0hZMX0xRnwbGb07PS=8uysXEKFs61w@mail.gmail.com>
X-ClientProxiedBy: BL0PR1501CA0031.namprd15.prod.outlook.com
 (2603:10b6:207:17::44) To DM6PR10MB2986.namprd10.prod.outlook.com
 (2603:10b6:5:6b::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be0430f2-c87a-48eb-e40f-08d99a7324fc
X-MS-TrafficTypeDiagnostic: DM6PR10MB4171:
X-Microsoft-Antispam-PRVS: 
	<DM6PR10MB41719F5A0A6F15424086305EBC879@DM6PR10MB4171.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nRnDl7rzvUiwShsMEJHN207ZiC0/2wlhIwGYWvF3FEnOGJZbDwt2HXxIHmqeDh4WZGRr4C6ZxyNZx8/WVdY5k9B3Kvur6IMNXRfN7rWtTPMIqGAb6+WuJfJz9eBNr0AuC5Vjw7kytVet+A8HC3uhIa6yu3ztWQMGQ1sEsScBqcW1EdkUB53yHLenEZs8kEKWYVOWiKaHzIzNkn++OMiGNNZnRj+baLhNkF65BbeSXwJOMFVZFEE9uhHviSlS0uMtkQy7Vp1Wy9zCBkfxHlfnpmwmcptecqNbJzMB2E6je/BFPKYaEuLuNXOexsuZ6wZU7bXjTMCpszuSm6kDb84kiMW6zFOxhB39QU2kD/pzVh0G+NpbUL4DS2rMaor15ahNjgnR8cGuPoQUjn/N0WAExvuC2XHP+GPXIQSShtLplxZNLrenHYpr5tbalCeoOqt2EZabRDvKzPBq80i9vvIXnrE+V50Uog4QkyU5bUDRrFowmxZlDGA9oIYQIjL9gVbKlMSt3iulzCFm8prArsL0XKP4slG8cZ17Bl+Y+vl+iTwTdfbPTknAY1ggvF6fri3ixX2Gv08p4LEk8sIBoqK4fdqDarz+43X6T8/efxZoeJyoD6Q3B82i1zkOJewUhyMkxm22WLGUO5koyE//WtW/Pg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2986.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(26005)(9686003)(55016002)(186003)(38100700002)(83380400001)(66556008)(66946007)(66476007)(956004)(6916009)(8676002)(7416002)(316002)(8936002)(6496006)(86362001)(4326008)(33716001)(54906003)(5660300002)(7406005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3P6oqVrydYTje+cOyHXO3l/3o9KCV0snOBLUPOPu1f5/sVX6jRPJMyNliBSP?=
 =?us-ascii?Q?nPrax4ups8U/VC1fB10Nu3672baVY+HDrI6WKSv0g+sPwUaZes3/1oN2op4C?=
 =?us-ascii?Q?b9O8RDaHnfMAcrO0gk4q3t58YVbdE6rnEAdehL07kWa9USdS+mSDjMi3Wkk6?=
 =?us-ascii?Q?hqsykvLshfZKIKmNGWI9cR3kYmSihcysbwpYdNiTv69eC+ApbsJ6yAgK9wVC?=
 =?us-ascii?Q?F5RYORecuX/wZl6D8iHDrsm7BfHO9k+FRvBb20wWtyn8IZmAOz+4t0YSOZeJ?=
 =?us-ascii?Q?rKdNK1Hsqo82/xZtZjco26aCBCGKZWqWvaS9O2drk3wA2OmaTeV7D3B2LFET?=
 =?us-ascii?Q?NuNRAjspI8CiW1wJVGashDbqRM328RrN9xPRMInMGP2Xr49fBlGCsvBbY9Om?=
 =?us-ascii?Q?TZ4jHBfQL7heVFP31toOEoLxNp3ir59bfhupG0Fd6xIMLpyPsGQL2CQOOgAu?=
 =?us-ascii?Q?dC+/Dl6ehUGHjggpRbHnNaf2h9erN9dce5Y7OfhlypOTBTAVktw9k9BbeIOL?=
 =?us-ascii?Q?FzzMrVqUS6OmjN50mYiwFLTK+rMfEbxw35ygz1pQBbx0+TrmfQIKz9yvYhjW?=
 =?us-ascii?Q?AikTYSxFZxfMAQYc7KXV73OU0+XImORg1qGJdYmhonsaER4OFulv2Bfov7u0?=
 =?us-ascii?Q?9fqtJTRt17dupm/Um13D/o7gOccsXgfsGTnnmZVGxTsfVad/axqNI8GtAX85?=
 =?us-ascii?Q?sJr186xYV/LVVL2qQnewzuNPenEyb9Gi5AI3rIObvH/ApHiFktr5pkpzJL8L?=
 =?us-ascii?Q?IcrNnNw3VmEGrfHwUUfSN5XLpxzybHpkVKEvQ/yDs0cAEEpGrQtisyBc8eP3?=
 =?us-ascii?Q?lje8KVaYwYzpF29d5JdsK0T61JcWIQRw6usyEXIJIwzMMle/dNZuCaZDJW0v?=
 =?us-ascii?Q?51JXJhuQi8q7Eoht/1CGJBWR9yHyy9lYmTWJFfxh5oYfBLwS+t1hPaXZujQA?=
 =?us-ascii?Q?s4RtoROozyl1sVE3L3w+/qLg27fjoL3tQzK4Sl+OwZaPjrX2hBB5IHZAk1HI?=
 =?us-ascii?Q?OuvFQd/sLI5kv3KQst1xDxuyWVax0fYrSecuk4QUMHtLi1aekLFErtMdk3Aw?=
 =?us-ascii?Q?OdQXvPFXM3IFPSp7Nmc7F/FzZjVyPBxM32Rf4RRx0v+d9H2L0/6ec6VoKXoS?=
 =?us-ascii?Q?WSdkZxrCjhuy7V6OphUzhK8c3Krk9J7kpUe6Yny0TX3t26d5leB8n9Y3UlPP?=
 =?us-ascii?Q?iygGditpIgnDJYN9uTTjZtF1DGopB5xaalbs/eIOw3cmYdoEFExdoPfbGY2H?=
 =?us-ascii?Q?YAYTnFBabSJajSWmXyUayQix6HXuzLNfee5SKAVt7710/j/YlSCzc2kL1DSb?=
 =?us-ascii?Q?kgknopJNkuhcvCkoSt4dXxOzoN4H3blPkCD755GJL2F+E7XXv1aHuaKoXVdc?=
 =?us-ascii?Q?R4RMVhwAFdGyFzJPClO7NtefpWoKNxjHoMQ7suRJUpDnJkpTrWP6ahh0TaKL?=
 =?us-ascii?Q?HHtLTIjEtki7ka3Q/l6Y/fChbhykZZXq/Z7ZkSfE04al8t7OJuV/vBdOAw0n?=
 =?us-ascii?Q?RPwqpbJNVdHWvHHZ5Eg+PD4bxMm6boeBocXmDMt22PC8blEjokBqmRiaWcz5?=
 =?us-ascii?Q?BSg4MrvaX7h8YDHQE+HESWyaqWnOlYmO4IFJX0q9AvUEQvztZS5WNe+pD4wE?=
 =?us-ascii?Q?M27wkTPnVdxL0liTZFY89i8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be0430f2-c87a-48eb-e40f-08d99a7324fc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2986.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 00:29:18.5473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K62zotkXHxCdifU2M+TY5iXEzTqCyLa098SCEH8c1QiVWVgBjaVJDMtlTqryPrdudBoUi6fMfhAixhKeDCorRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4171
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10151 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110290000
X-Proofpoint-ORIG-GUID: oZt1Bea1WYvCpkCBK5SynMwh49YipoXc
X-Proofpoint-GUID: oZt1Bea1WYvCpkCBK5SynMwh49YipoXc

On Tue, Sep 21, 2021 at 03:07:25PM -0700, Julius Werner wrote:
> > Since it doesn't seem possible to have each boot component using the same log
> > format, we added a log_format and log_phys_addr fields to give flexibility in
> > how logs are stored. An example of a different log format that can be used is
> > the cbmem_console log format used by coreboot:
> 
> I am not exactly sure how you expect this interoperability you seem to
> be suggesting here to work. Are you saying that your bf_log_header can
> sometimes point to the bf_log_buffer structure you define, and
> sometimes to a coreboot CBMEM console buffer? But that's a completely
> different format that requires a different reader implementation, how
> is that supposed to work? If this proposal is just "we define a
> wrapper structure that points to everyone's custom firmware log
> implementation", then I don't really see the point (the only benefit
> still left then might be discovery of the log buffer, but that's the
> part you leave open in your design while all those other
> implementations already have working discovery mechanisms of their own
> anyway).
>

Depending on the preferred logging format by the boot component, bf_log_header
can point to our bf_log_buffer, a Coreboot CBMEM console buffer, or some other
preferred logging format. We are looking at ways to pass all logs through one
mechanism to make it simpler to discover all logs along the boot chain. From our
understanding, the CBMEM console is passed to the OS via a CBMEM table stored in
lower memory in a forwarding entry and is discovered by a user space tool
looking through /dev/mem. Is this correct? We aren't entirely sure how other
implementations of log buffers accomplish this, but we think that an explicit
mechanism can be beneficial. This is something we'll need to expand upon in the
specification.
 
> For the other structures you have defined, the same feedback that I
> think was already mentioned on the last iteration of this thread still
> applies: it seems incredibly bloated for a simple firmware logging
> mechanism. You have a whooping 24+n bytes of overhead *per line* which
> probably comes out to somewhere between 30-50% of total space wasted
> on overhead for the average log buffer. I guess there are just
> fundamentally different opinions on how featureful a firmware log
> mechanism needs to be so we're probably not gonna find a format that
> makes everyone happy here, but at least for the coreboot project I see
> little reason for us to implement something like this when we already
> have a well-working existing solution with tooling and wideranged
> support.

Since, the logging format we are proposing won't be the best for each boot
component environment, we are giving the option for boot components to use other
logging formats that best suits their environment.

