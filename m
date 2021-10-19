Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A04A433F86
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 21:58:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213436.371646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcvEv-00077s-HS; Tue, 19 Oct 2021 19:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213436.371646; Tue, 19 Oct 2021 19:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcvEv-000765-Cv; Tue, 19 Oct 2021 19:57:37 +0000
Received: by outflank-mailman (input) for mailman id 213436;
 Tue, 19 Oct 2021 19:57:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YfyF=PH=oracle.com=alec.r.brown@srs-us1.protection.inumbo.net>)
 id 1mcvEt-00075f-M5
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 19:57:35 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd43e470-3116-11ec-8324-12813bfff9fa;
 Tue, 19 Oct 2021 19:57:34 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19JJ2aBx027760; 
 Tue, 19 Oct 2021 19:57:06 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bsn7kn01j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 19:57:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19JJon74079452;
 Tue, 19 Oct 2021 19:57:00 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by aserp3030.oracle.com with ESMTP id 3bqmsfb4hm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 19:57:00 +0000
Received: from DM6PR10MB2986.namprd10.prod.outlook.com (2603:10b6:5:6b::26) by
 DM5PR1001MB2396.namprd10.prod.outlook.com (2603:10b6:4:30::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Tue, 19 Oct 2021 19:56:57 +0000
Received: from DM6PR10MB2986.namprd10.prod.outlook.com
 ([fe80::c5da:305e:be30:abac]) by DM6PR10MB2986.namprd10.prod.outlook.com
 ([fe80::c5da:305e:be30:abac%3]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 19:56:57 +0000
Received: from alec-orcl (73.61.222.52) by
 BL1PR13CA0263.namprd13.prod.outlook.com (2603:10b6:208:2ba::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.8 via Frontend
 Transport; Tue, 19 Oct 2021 19:56:55 +0000
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
X-Inumbo-ID: cd43e470-3116-11ec-8324-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=Vm/clMDIfA9tEYzCoD6o89gy6g31+Yrx4MGs463p+uU=;
 b=ZbYPtLFy9Wzci3PLK9LZhZ6JHgBFRQ2ADvRNNrp6HLwQi75AiPzSvVxN9xCBP7l4VmMc
 6e38j2xRYH2dXbnVj0GXlYlBAL52edmES50kvvGzHwOolWOLIob/9ESW6O662DSiw1rw
 TQbRLagKNoZMxAvnJ8tXtNgGY9K9bgNqtyibjXmo/Pk5tewPQa9IRGiBuiDi1cIYkvqV
 s4KRQFpAB0NIbI8bbki4nvpJBAsa9e8VYJaNPfRzLsubRkGMihdX7sdCiDK2+E5+2ZPr
 2TR5pURAa42/HPmjBq4Qx2e7xOmG+yH6FlOhAUTno6D68FpzynQTXMZwtQaziK0gMy80 CA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exlb7lPIRdcuO1Jimpq3h+wSHXNwRYP/5fksNBKa4yg75hJJZD7SeEB52BiVb9pqI0vzsARCVIqhyavV9APAMM5d/3JdUuFJyYir+SICchekgC+PefEMvAcwt+IeyCQDm2aiGiuueywUVsC5tH5U/+eHf0xCAtwKf5PrvcSqblyHy52LM/bT+jV3mREs1l6o3iaQffe6YCKGVzKywkocjQEgDaR6gCM1FWVWTfJfMYVKVARX4gotRxCUPb7vdfi0HCBLoftj4LC+EPUcVwdVoPmjc3//0OJuthJOiF8wcewfzQ5sIIEVekPVuMa02ik3zY09DIhNwHfGepE0TfV5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vm/clMDIfA9tEYzCoD6o89gy6g31+Yrx4MGs463p+uU=;
 b=XTZaveQfOKXoLA+Czm3GAm/Qkpb476O4K1yqvSzvC4UrC/lcAAXqNQ92789RGtaG0MdwSWRdTpFlqTRZn5hoHAO9kflsP+saVdBfGa+7Yz8LplXgfUEDvwzqquEe5gNWsLsvwRBQT3jN7sgFBmdfRyS8j3+tO3mIDIW90PF55XT83XeRE3Me7fUP6IsqXlpfbqbV6bPL8ZFPXo26V/A/+kt3pbkYi7TkWAX/igOTXAclZ2YW+L/C3bhS2IBN7EXR4ap7wiWIrGyQrxEpiXtpK5Ew0REtLVoWDOUa9aHCoetrWP4/Hp1oQ7CknM3DqT43pdo6zkpYL2nwGUnWx4uRHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vm/clMDIfA9tEYzCoD6o89gy6g31+Yrx4MGs463p+uU=;
 b=q1ifXfZbNIhe63TI1M8Sdw60oGPNIL4sWIiv/74M+g/FrraTo3Npy5EkROD8fYzlA0KcWf7raZLIuoK7SgxhBmqqLB/vq7jMv8B0SrBw8lF0z9zlULeQlcs3cpCu4p5ODCzEOAH2UieOSa4hOsvhEqJIyWHbERJk8CDlQt/HGTk=
Authentication-Results: stuge.se; dkim=none (message not signed)
 header.d=none;stuge.se; dmarc=none action=none header.from=oracle.com;
Date: Tue, 19 Oct 2021 15:56:52 -0400
From: Alec Brown <alec.r.brown@oracle.com>
To: Peter Stuge <peter@stuge.se>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
        "coreboot@coreboot.org" <coreboot@coreboot.org>,
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
        "jwerner@chromium.org" <jwerner@chromium.org>,
        Kanth Ghatraju <kanth.ghatraju@oracle.com>,
        Konrad Wilk <konrad.wilk@oracle.com>,
        "krystian.hebel@3mdeb.com" <krystian.hebel@3mdeb.com>,
        "leif@nuviainc.co m" <leif@nuviainc.com>,
        "lukasz.hawrylko@intel.com" <lukasz.hawrylko@intel.com>,
        "luto@amacapital.net" <luto@amacapital.net>,
        "michal.zygowski@3mdeb.com" <michal.zygowski@3mdeb.com>,
        "mjg59@google.com" <mjg59@google.com>,
        "mtottenh@akamai.com" <mtottenh@akamai.com>,
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
        "rharwood@redhat.com" <rharwood@redhat.com>
Subject: Re: [External] : Re: [SPECIFICATION RFC v3] The firmware and
 bootloader log specification
Message-ID: <YW8jBOYbFFeYVtDW@alec-orcl>
References: <A7F710D3-5148-4E92-9E3D-5D850AD0245F@gmx.de>
 <DM6PR10MB2986A960E859A744FDC3875ABCDE9@DM6PR10MB2986.namprd10.prod.outlook.com>
 <20210921154021.19289.qmail@stuge.se>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921154021.19289.qmail@stuge.se>
X-ClientProxiedBy: BL1PR13CA0263.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::28) To DM6PR10MB2986.namprd10.prod.outlook.com
 (2603:10b6:5:6b::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91fd845a-7531-45cb-7c32-08d9933a9b64
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2396:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR1001MB2396CC2BDF8EFDF8B7552B91BCBD9@DM5PR1001MB2396.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s4yM0CZL5/N5SdOCySU8DTZZim48QHgV7bELzZjxwRoVix60or/iy5vz1tONVcoEc4JHSYn4FQZj06WlDwBXevWwrp6P50rnfOIAIwZc8qnWjVFV7vg9HXZUj3O11VdgiqRWzwXP1w16QS2WZb2eV7aGonpBz4dqMHBkBEYgFPcF9JNSSotxokly4e3q/OFA3zExwgZiOrJUPZ/LuQE8DK7assqKSs/Jhe1s0IsHHJrvzd87nHM/Q2jYDApTW5XtiZ7zQNZkPTaHcHelGuF/wI3t7sW/IO/4BA0NmO/Pg2lajJ2ymmfljN5eppGYJO79qR3O7N6dqJHVKZmu3DRvSPDEHY0HLOPLz1v2lFzsKWv0QtnzYwQ6jZzqRgaU0Erj3HOe2bAl0DW6sdEMWNtL7BOhGzAAw8Y910UhbAgV5wtF2ArfKYnpVnO4ADK0MuTe02BFHm7niADpHSJ7HbK428xKKiuYDTBSDTvqZXQuYpFJl5D9m97US3xUBORpsw5DQRwYeErhMUTPRTQ0srCNnZDXYa3SF9lqof1j8hzUKyn3KF9U5W8zwco1kii6mERMorX6lENp4KCFtM2sP5CSVLB1E4dq7irw3Aow3jSbGgxgltZEiQ65SpEgoFxzc6dA573FD5TDi/cofwa8y0Grwg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2986.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(33716001)(7416002)(5660300002)(86362001)(8676002)(4326008)(7406005)(9686003)(26005)(55016002)(66946007)(2906002)(6666004)(83380400001)(66476007)(66556008)(316002)(38100700002)(508600001)(54906003)(6496006)(956004)(186003)(8936002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yQ2lUxqfMcz3alIdGc8m/9fg9zKxgxv9rpp1/A9bPOM29xWJRjG4kIeyxMpu?=
 =?us-ascii?Q?/CsQkcF9ySq48R0Hpj5EReC2hTuh/ml3MNpbv0BwEPFPFhp42rtGQVvR+O8z?=
 =?us-ascii?Q?Q5q//UCgpnCGoJDthWt0mRihcdE1TZ1VZs7eFNuemurzytdRf7WI1m3JZPJj?=
 =?us-ascii?Q?1xgoPjlCnH1SimNcX/RxSucAC+AeGA0oDKSoMef8+fGS2WuuFbsIc9gpjI3u?=
 =?us-ascii?Q?q9+wsK+HLXhsQYa+KjXVDee/f/Fccs1WTXUy04j7be2pMT8HgpBrVS9pbcYS?=
 =?us-ascii?Q?MIrK6utCfP3kY+s1J9D8UUMiZu/HLSqibpUeZk8vyfzVYef+CaYvdmODwBo9?=
 =?us-ascii?Q?flUfaRRydG2armgsddS/n6iCn9WYJAU8+GhNP03kXaUzp1MGb2nGNES8dryc?=
 =?us-ascii?Q?EgXXV2v9VBJpP5vRFz56dJs4DiJ77xit1FmI3Kfdl/2OCarKoHi1fB4VHMvY?=
 =?us-ascii?Q?KHGcmJ1TY2JVBq7cadDmX+rdi948R78CmVs/Xm513qtYH9BQbMqxWo3t3d/U?=
 =?us-ascii?Q?zIG8kAC29/Vq4KuqT/KO0v3Gw0IH8uCwGCyWjca4wXGzVCBC+AJCcHUyQD8P?=
 =?us-ascii?Q?zOuccXCI4Tvb+PGvzWDvA0IxI3NI14S0hqlZyvQq48XXtd5t17xtH7DlPeju?=
 =?us-ascii?Q?7DXDMMFHysjP9YzQ+MhsMP8/WgFjy8Pw4zgYOODjGpXelS6VcI7dlQLNi6qb?=
 =?us-ascii?Q?7q6leyk4cPTsFTIiPkjWXkX9ncGjRPcNevSAJsEnbdhNZN3XWhhdjjP7Mnt7?=
 =?us-ascii?Q?ZOWqH1x+IGKA7iWBRgCkjMHy8Hu7W8nEk8B0lBHCfXoWVBO1QNxxUpnbTFNh?=
 =?us-ascii?Q?Y8P6vpcKNLq0Q0/2V+EyghHDk0sclRV5zWiVAxGHk+jJUZki6WDmJW2paHFQ?=
 =?us-ascii?Q?UiKZfYmGgBtIsrJbu8QS17WXtb9YusshU/aEXOv2Mx2ZHrc5bZC4Hty7B0dJ?=
 =?us-ascii?Q?lSBtO4dhS3CsYBXQ/VKGrGkOxtckCBM1zijVIbzdOmGT5XP/46KrWpsMF91t?=
 =?us-ascii?Q?+FrjCcH23MDd4spFAz68MlxA4ILLzqqLh2Zok2lP1wQSrj9Dx9d7F68TuouH?=
 =?us-ascii?Q?X15q3rRKk2n1ssPfa514iRQuQu1vFo1VwE/sYAUrFMTwSDxcOvW0AZVd/U3L?=
 =?us-ascii?Q?PKqqOqWIJuPiknKYuoo/s2v3xn7Jd+2XAe38bdni609+GJWObA9GxFkfoOhB?=
 =?us-ascii?Q?CtfrARTunFRriI8Pf2lpM4D1/oZxTAlhdPQxWb/oLRlHyj57KuNXyL18irCd?=
 =?us-ascii?Q?ht6PJhWkf7b2/1Hp9jHY+9Qr2ABUNao1P/MFJTVLClpH9qSZyfMx5baxdFmB?=
 =?us-ascii?Q?18xd19220lkaliOeP+Xx1Ezb?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fd845a-7531-45cb-7c32-08d9933a9b64
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2986.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 19:56:57.6454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alec.r.brown@oracle.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2396
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10142 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110190114
X-Proofpoint-ORIG-GUID: 8kaSmN8gTiMWgEgYmz3Fd0g8fjiB-dzy
X-Proofpoint-GUID: 8kaSmN8gTiMWgEgYmz3Fd0g8fjiB-dzy


On Tue, Sep 21, 2021 at 03:40:20PM +0000, Peter Stuge wrote:
> Alec Brown wrote:
> > Below is how the layout of these logs would store their data.
> > 
> > bf_log_header:
> >                +-------------------+
> > u32            | version           |
> > u32            | size              |
> > u8[64]         | producer          |
> > u8[64]         | log_format        |
> > u64            | flags             |
> > u64            | next_bflh_addr    |
> > u64            | log_addr          |
> > u32            | log_size          |
> >                +-------------------+
> 
> I suggest to include a .magic at least in bf_log_header and an
> .xor_checksum or .crc32 only in bf_log_header.
> 
> .magic doubles as endianess indicator when the structures are
> stored on movable media. (Pick an asymmetric magic bit pattern!)

This is something we will need to think about.

>  
> I suggest renaming .next_bflh_addr to .next_log_header and .log_addr
> to .log_buffer_addr.
> 
> I suggest to remove .size and .log_size:
> 
> The rationale for .size is "to allow for backward compatibility" but
> that seems redundant thanks to .version.
> 
> .log_size can be calculated from the subordinate data and is thus
> mostly an unneccessary source of potential inconsistency.

Looking back, I agree with removing .size since .version accomplishes the same
task. I'm not so sure on removing .log_size as it can be very convenient, and
.log_size won't need to be calculated every time someone wants to know the size
of the logs generated from the boot component.

> 
> 
> > bf_log_buffer:
> >                +-------------------+
> > u32            | version           |
> > u32            | size              |
> > u8[64]         | producer          |
> > u32            | next_msg_off      |
> > bf_log_msg[l]  | msgs              |
> >                +-------------------+
> 
> I suggest replacing .size and .next_msg_off with .messages containing l:
> 
> .size can then be calculated from .messages; again, reliably avoiding
> inconsistency between .size and .next_msg_off.
> 
> Allocated size doesn't seem useful if writers must anyway maintain state
> containing the starting address. If writers must be allowed to be completely
> stateless then maybe at least rename .size to .allocated_size and see below
> for discovery.
> 
> Having .messages also eliminates the need for an end-of-messages marker
> when the allocated space is not yet filled.
> 

After some thinking, it makes sense to replace the meaning of .size with the
meaning of .next_msg_off and removing .next_msg_off from the structure. This 
wouldn't be useful to store for the readers of the log.

> 
> > bf_log_msg:
> >                +-------------------+
> > u32            | size              |
> > u64            | ts_nsec           |
> > u32            | level             |
> > u32            | facility          |
> > u32            | msg_off           |
> > u8[n]          | type              |
> > u8[m]          | msg               |
> >                +-------------------+
> 
> It seems inconsistent that log_header.size and log_msg.size cover only
> the respective struct itself while log_buffer.size also covers all
> subordinate messages. Skipping all .size in this version fixes that.
> 
> And log_msg.size is not very useful since both .type and .msg have variable
> length; it's not possible to access .msg without scanning .type. Please at
> a minimum add .type_size but better yet replace .size with .type_size and
> .msg_size.
> 

You bring up some good points about the names for the fields and that they need
to be more consistent. By removing .size in bf_log_header, this should make it
more consistent.

> 
> > There is still the outstanding issue of how the logs will be sent to the OS. If
> > UEFI is used, we can use config tables. If ACPI or Device Tree is used, we can
> > use bf_log_header.next_bflh_addr to present the logs. If none of these platforms
> > are used, it becomes a lot trickier to solve this issue.
> > 
> > Any suggestions are much appreciated and will be taken into consideration.
> 
> Having bf_log_header.magic and some bf_log_header.$checksum, a strict rule
> for bf_log_header start address granularity and a strict maximum offset
> for the first header from top and/or bottom of memory allows to quickly
> discover a log in memory without explicit handover.
> 

This is something we'll have to think about some more. We aren't convinced about
using .magic for log discovery and are looking for a more explicit way of doing
this.

> 
> > LPC System Boot and Security Micro-conference on the 22nd of September
> > at 7:50 AM PDT (14:50 UTC).
> 
> Have fun! :)
> 
> 
> Heinrich Schuchardt wrote:
> > We already the EFI_TCG2_PROTOCOL and RFC 5424 (The syslog protocol).
> > Why do we need to start from scratch?
> 
> That's a good question. I guess noone wants to settle for a standard
> from somewhere else. ;)
> 
> I wouldn't mind if log_msg was a syslog transport, but I can understand
> if that's rejected because syslog messages require a lot of parsing for
> presentation while Alec's proposal seems focused on efficiency and simplicity.
> 
> It's also nice to be able to strictly mandate UTF-8 for all fields.
> (RFC 5424 allows MSG to be anything.)
> 
> 
> Kind regards
> 
> //Peter

