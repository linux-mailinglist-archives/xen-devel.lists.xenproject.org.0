Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCCB304B98
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 22:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75506.135990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4W3E-0002Yq-Lc; Tue, 26 Jan 2021 21:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75506.135990; Tue, 26 Jan 2021 21:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4W3E-0002YR-I8; Tue, 26 Jan 2021 21:39:04 +0000
Received: by outflank-mailman (input) for mailman id 75506;
 Tue, 26 Jan 2021 21:39:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkEF=G5=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1l4W3C-0002XH-TM
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 21:39:03 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6586fdf-f290-4b4e-a5f1-4486d411cdfe;
 Tue, 26 Jan 2021 21:39:00 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10QKxB8f002060;
 Tue, 26 Jan 2021 21:38:47 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 3689aamcfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 21:38:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10QL0XTA095295;
 Tue, 26 Jan 2021 21:36:47 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by aserp3020.oracle.com with ESMTP id 368wpyf86u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 21:36:47 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by SJ0PR10MB4718.namprd10.prod.outlook.com (2603:10b6:a03:2dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Tue, 26 Jan
 2021 21:36:45 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::fcc2:62e8:e4e1:b4cb%5]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 21:36:45 +0000
Received: from [10.74.103.65] (138.3.200.1) by
 BY5PR13CA0001.namprd13.prod.outlook.com (2603:10b6:a03:180::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.5 via Frontend
 Transport; Tue, 26 Jan 2021 21:36:43 +0000
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
X-Inumbo-ID: a6586fdf-f290-4b4e-a5f1-4486d411cdfe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=MjaBl2bwap93hpQHomgGidTwdzEE6FGZpMkG6vFc0I8=;
 b=l+p11POv1WDlfu3AYHKskFi+HoG22DeFVmU09GNbcPU1dYZ2yxm8Y5QOkColq7MM9K37
 37NsHH2WcGk9lAHG7/2Zanzqe6sYBDsPCMV5hT5sqdlmXCtrWfWpoVh4CQy1N1Qxlgkm
 csxwrQl0ilMT/jbzL9BGkr+v3j10nR1RloPyccqpsLiu40HzOiQwDFJVcGog5PSDxDWc
 zguWbIMUNIoRJVhs1ggb+TeDuQqtnNBT1GZEvLkkQbaqZX5+OgpVUT6OXdMa4S/XexUG
 Z9O8ACUCfI5Fe6mnbvzuP9cfKzH/vTQTZ9/ntGInb1M4kfmRAeGybwl/HS8QGJpcvKcr RQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfl8aDDHaklK/KljYpWXAasja7lTIhfcT3u3mrG9ftwhoe1R/M9RCU5oHqu6gvBj7jjXtef9tAb9gi8SGXgqQKQdUfoISe3zNsMsWo5DQ7MBYjJT8iAxVRSz2b0poddC3jZyNnM3Cu1uACdzc/FfacDjEZT6XUwqiKQAuBU2FfuOvjHqp/4XM1CINKss1gD1++9R07TAnKkeMdUGwKGmYkvZ0F96g/yZv3UoeBRKsjJquATEwSiYJRwZp0YsUw1Z9a80SV4Jd58EDXFSvmCtCXZk5737LbWq/AbDv6DBKBuRB5KvXnHBMCnTFXUCOa6jELTdcR1pJe5ZBFj+x6wArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjaBl2bwap93hpQHomgGidTwdzEE6FGZpMkG6vFc0I8=;
 b=eOJcn/peXpF8t/qzS6R1S648QqxBneBOteEujiqSRLkFe0LfkO/zIboVG3AE4yiwUtvF813FWQKRqa50FCNuIokQblm86EjMNijl6FraeACwEL+LkAmniZUEyzHehik0Mr64MWm/gb8VEAET4DfZwZdetLMuQxpGb9HENkrhT2F+sDKEn+0EXnjDOtlQ/gSWTw1OG6xkZ8tNtJXgL9J544yXnGdlXOoSE5lJbrAiVmXM81gTdI6TLyAquXSansBI3GnDTap4US9kM0q5DeWRaJaL8in++gL8jWVp7cqJ68B544B7n2XagJZ+dHZrFsCQkZ0OGovBuOjQ1D3lEjEg/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjaBl2bwap93hpQHomgGidTwdzEE6FGZpMkG6vFc0I8=;
 b=vI0z/cwvXm9PLHEjOBYtyU5mOfyiLjY9LWbcnOFHdatQXt9HDpPXqawEXLTPebZJVB3jvXbQml15dxxpKo3nSloW8flA8kLrJk83J7I+WFEOegYZa4VBfndbgQqKuVt5P8ig6xkJt8Ac7q610BObqibHzv1FrmU0jXPYl2Bi/Bk=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
Subject: Re: [PATCH] xen: Fix XenStore initialisation for XS_LOCAL
To: David Woodhouse <dwmw2@infradead.org>,
        =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Paul Durrant <pdurrant@amazon.com>, jgrall@amazon.com,
        karahmed@amazon.de, xen-devel <xen-devel@lists.xenproject.org>
References: <20210113132606.422794-1-dwmw2@infradead.org>
 <4d334457-e173-fa21-40f0-65f800a00cec@suse.com>
 <4c9af052a6e0f6485d1de43f2c38b1461996db99.camel@infradead.org>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <da79f47d-de72-1c27-71e4-394b17577682@oracle.com>
Date: Tue, 26 Jan 2021 16:36:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
In-Reply-To: <4c9af052a6e0f6485d1de43f2c38b1461996db99.camel@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [138.3.200.1]
X-ClientProxiedBy: BY5PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:180::14) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a62382d-3f23-4bb6-9bbf-08d8c2427a55
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4718:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB4718751C17828D3AF693CCE48ABC9@SJ0PR10MB4718.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q/EkppJu3LKeYYGBEjv8Wm+tWQC0PRj4R9Fn+5Bo11dWz+R0IrxNPapLLgrj0bLo9ar0k+yV+6oOHmQlRzJTQkyChJY2LrR8HhQNWTGUMBi0Kq/1ubvfx6i1dHZYekoICsTOnlqTo2RJv8hZC/G7ZQvyrx5w3z9L5Z0qyEDI7BJSoEdDeUyOskqyulcjQF1ZtcmIZSKjnbfgoK87VAPGVHSRjBO05Sr9rmiN5olc4f3xiZY+ZbmXXGdQXnF6Oq6UHLmy7d6rB3js5EH7UWDO9cuL6obciUcIuEQhzejTXZdYk+05okGjSdTGArQBcgob8ptIkFN7cbaZyoOAeL6pEHR7HW46ptStcbjx/OvdOQ5b71s5b1VPHTfnhKwqR75bbYLQjX1sKoqGWumTsTAAhlGa0pv4Ed2PG/tGyV8q9D5CYvAhjIA8qI0ZFLWb5A03r7MBNP5VPqW1c9Qt0x6FGhtn6na8loMn4KZoqGD2Fhkb4NwnX7gEz0DMMdh9uCRAm3x/NbMyAumkw0wThE6Q1yt9vXFa5WxA9ErUs5YoUmBSzIA8Xwx9Kd/fcEbx144UTvqMPJt1myAYfzIW1gFIvmEnp+TmofINVapCZrs2RdE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(39860400002)(346002)(366004)(66556008)(16526019)(53546011)(66946007)(31696002)(2906002)(16576012)(8936002)(2616005)(5660300002)(956004)(478600001)(6486002)(8676002)(54906003)(110136005)(44832011)(316002)(26005)(86362001)(186003)(36756003)(4326008)(31686004)(83380400001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?V1gxY0hLU3FtREVkdk1FY2VzRk5VRlRUdU5DWU9EZlFCRE1RSXNUWGtiOXRz?=
 =?utf-8?B?N2NUb2lSUXVkaDdKbmtSKzY2amgwTFZkY2dMM2lKUk1uQzZXZHB5UTNLTUlt?=
 =?utf-8?B?MHBteEdOS3djOGVUbmY1bENxT0d3S29XbEhYZmdDbTd1bFpEWWlJbHNvdWow?=
 =?utf-8?B?Z3ByUFdGcmJ0aGNGQjVyQWtBdEQwS0l6NVJreTB2UWs1cXBSTVlLS1l6c2g4?=
 =?utf-8?B?aGw4cFpGUFNna3lLb0VMbEc4RnBJamd1N09hVzVWNWJWSFNGVUE1SzhyQjJW?=
 =?utf-8?B?dU1QakRWWDZqYUJCamZiczllbmViZVFEOWRJcnIwcEovS0tkZVlWYzJWeWhW?=
 =?utf-8?B?VERZa3VnRXpaSUFOemJkWXJMQjZ4bHhrbFJINS9hTC9aZExEVnh1QlZvWlov?=
 =?utf-8?B?MkZnYU9EaHFNallwa1o1dU5vcXQrVlFNTERKMXVUZlBsdUd5NGJVbnFIODcw?=
 =?utf-8?B?M21qenhmK2hkWTdiL21PK2FuVGdKekZIR1JCOWdtKzhFZ3BMeDJ1SVZxcTBQ?=
 =?utf-8?B?a3hPR04vY1VUbVRKMU5DT3hvOTBXUkxPL0w0Q2lhUnlYS2pXM0M1NjRYT1gv?=
 =?utf-8?B?Zlg2ZVpMUEpUWVI5QU45Zk1HK3JZRTA1NkZGdzk5bzRBcXZzTnhYc2xaQVJl?=
 =?utf-8?B?VFhWeWtFTVF3b1ltdE03U0N0Qkd5d3l6QnNWRll2bkY4T0dnUm9qV1E3K3hI?=
 =?utf-8?B?U08rUXlpYlJJam5kNi9Lczc4R2N2bUUvMXpqS1htMzdiZXFIbXdFSEhmMURI?=
 =?utf-8?B?YnhzY2txeWpsd0hWUXhlbTZ0WWtIQXdCL0hTMXVqWmd4Sjc4Z2VwQmh3Mk1Z?=
 =?utf-8?B?RzB4NTZBWEFwUDZoWWpDSThReStFVEEwYzF4OVhWYUUycXcvekViUC9QTS80?=
 =?utf-8?B?N2RieWthK2ZORlM1T2g2bC9xZjVFaCt6VmpyMXc4TW9lWmRoM0hGdWFTeUdt?=
 =?utf-8?B?YkZUU2FhS2lMbU9KdVN2M1JDK1o2eU5VNDhDR1liWEViRmVvcGJNWFVudnUz?=
 =?utf-8?B?TFYybXJkRlVadHczTnVMK2djMitpbk1aUG40SXlNYmNhWjNYT2ZkaVp6Ukls?=
 =?utf-8?B?YlZ2QjhYdWFqWXFna0RRUDZHOFZlNDJrcVpRNVF2MWlhVEJxQzBreDBMVkU3?=
 =?utf-8?B?QUcxNHQrR243blJxV3N1KzJqTzduRXRLWXE5TS9KbFdLdlBVaEVqNTZ0UGcw?=
 =?utf-8?B?SlRnajNXUWRQTllHSU15bDhKS0FOU0h6S1Y2U1RPMXVjVldNNEpPV2Q1Tm50?=
 =?utf-8?B?NmVUVndIdUtPaHIxckgyU0VBa0hQVktabytmYTR6WVVjbVFVTHVHVlZRckhu?=
 =?utf-8?B?d291ZVF4K3l3TDlTS0VqSFdCeXF6VS9DTWJmRFF3ajh3WmlwdUxPczArTU9j?=
 =?utf-8?B?ZjNlcmY0R2VyWFlNeWdweExXMjJ5VG95dzFTTVZqeEtvOENiUnBvZWNRcllm?=
 =?utf-8?Q?8dFYCT+b?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a62382d-3f23-4bb6-9bbf-08d8c2427a55
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 21:36:45.0035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0FFu5sSzxhU4Bpq3/wF/Ix4vmhcwZ/wC0RKkTlJPdcyjwXxuMJFRC6sBxO4R3HU29A1iUVz1Tr2j7dpxkDDyYWUK4oDOP0dvV5iy13Kxqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4718
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9876 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260109
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9876 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260109



On 1/26/21 12:01 PM, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> In commit 3499ba8198ca ("xen: Fix event channel callback via INTX/GSI")
> I reworked the triggering of xenbus_probe().
> 
> I tried to simplify things by taking out the workqueue based startup
> triggered from wake_waiting(); the somewhat poorly named xenbus IRQ
> handler.
> 
> I missed the fact that in the XS_LOCAL case (Dom0 starting its own
> xenstored or xenstore-stubdom, which happens after the kernel is booted
> completely), that IRQ-based trigger is still actually needed.
> 
> So... put it back, except more cleanly. By just spawning a xenbus_probe
> thread which waits on xb_waitq and runs the probe the first time it
> gets woken, just as the workqueue-based hack did.
> 
> This is actually a nicer approach for *all* the back ends with different
> interrupt methods, and we can switch them all over to that without the
> complex conditions for when to trigger it. But not in -rc6. This is
> the minimal fix for the regression, although it's a step in the right
> direction instead of doing a partial revert and actually putting the
> workqueue back. It's also simpler than the workqueue.


Wouldn't the minimal fix be to restore wake_waiting() to its previous 

        if (unlikely(xenstored_ready == 0)) {
                xenstored_ready = 1;
                schedule_work(&probe_work);
        }

(And to avoid changing xenbus_probe()'s signature just create a wrapper)

-boris


