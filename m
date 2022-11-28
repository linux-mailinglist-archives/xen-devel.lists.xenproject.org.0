Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7779F63A73A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 12:31:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448894.705468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozcL6-0003ut-Li; Mon, 28 Nov 2022 11:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448894.705468; Mon, 28 Nov 2022 11:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozcL6-0003sp-IT; Mon, 28 Nov 2022 11:30:20 +0000
Received: by outflank-mailman (input) for mailman id 448894;
 Mon, 28 Nov 2022 11:30:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ltHO=34=citrix.com=prvs=3247ff6ef=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ozcL5-0003sj-A9
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 11:30:19 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 043d602e-6f10-11ed-91b6-6bf2151ebd3b;
 Mon, 28 Nov 2022 12:30:15 +0100 (CET)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Nov 2022 06:30:08 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB5909.namprd03.prod.outlook.com (2603:10b6:510:41::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 11:30:06 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 11:30:06 +0000
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
X-Inumbo-ID: 043d602e-6f10-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669635015;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fREfZ7mYeQLWN7bIoWAFEH/L7Cx+tHA9T9VqiNcRLGY=;
  b=fhrN1Zr/RlhFIlaOnQnkoSMlAUQlAsPwx++QO5SxZcRws2K0BjZbPpM5
   +KX2CFwdZTU1Psi7FR9OoRvwZi7KzjKcxH8ApfUEwQrEy3aq58flHRfGB
   0YdzV9PLzbXH5o8I1VjutB3kIjPVbbTbNrYZEhHXpuFG5LBjAiXbuKYC3
   c=;
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 85678556
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5z/YW61noqFm4fH4RfbD5fdwkn2cJEfYwER7XKvMYLTBsI5bpzBUm
 GIaWTzVM/mNMTagLYh3b4znpEkD68SHyoI2QAs5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVkNagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfK1lF9
 84XOWkxbzvY1v3onvWlZ/Rpr5F2RCXrFNt3VnBI6xj8VKxja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6Kk1cZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r827GQzX6mBur+EpWqz/pn2Fuo2FYoDSYHZQGgp9qfl1KxDoc3x
 0s8v3BGQbIJ3EuwVcXwRAH9qXKBvxg0S9dWC/c96gyG1uzT+QnxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+pQSiaPCEUKSoIY38CRA5cud37+ths1VTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRP+ZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:OMiR5aNn4GBGe8BcT6H255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 DskPZvln6FQzA6f867Dn4KU6zqoMDKrovvZVorFgMq8w6HiBKv8frfHwKD1hkTfjtTyfN6mF
 K12TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIihm9UYMTLljyevfcBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhNV2dkF/I4U3NwTwu43jtxRuxhmbim9XwQHYfB9BajYxUXxPF4w541esMmJ
 5j7ia8jd56HBnAlCPy65zhUAxrrFO9pT4HnfQIh3JSfIMCYPt6rJAZ/mlSDJAcdRiKobwPIa
 1LNoXx9fxWeVSVYzTwuXRu+sWlWjAJEhKPUiE5y7mo+gkTuEo841oTxcQZkHtF3ok6UYN46+
 PNNbktvK1ST+cNBJgNStspcI+SMCjgUBjMOGWdLRDMD6ccIU/ArJbx/fEc+PyqQpoV15E/8a
 6xH2+wjVRCO34GNPf+n6Giqnv2MSeAtHXWu41jDqFCy/zBrOGBC1zHdLgs+/HQ0cn3TPerH8
 pbA6gmc8MLHVGeZ7qh4DeOKqW6CUNuJPH96exLLG6mk4bsFrDAkND9XbL6GIfNeAxUKV8XRE
 FzEQTOGA==
X-IronPort-AV: E=Sophos;i="5.96,200,1665460800"; 
   d="scan'208";a="85678556"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gr17hoRGMrFajIpCFSFFeIgBFGN0+pUZRHNVo7364Ob+z3hVyKVE1+2jtDmLa/vL6DZaznQ03u+9+P64ev+Cv7rR869igpJRx9mnemC48cwbUdn9iC+t9fcIou3RF4N5E4oLP7peqnFsBbElaERwkOC6Ml0xZsDwQSfAbVR7Rbb94ho9QNuWHu4tDcPRxjeKTYtm4IHR0lGjb2ZMvk1A09pRiZ/IbJnJv2BdCkatgw2lrihPc0wf/T7WZLPyi+cHE1GkAWrIMvocxIsNBD8BIgEnz4z8FmxODQH+7OpyAd45W8YskH7QdoiGIlAXPryMfzH0j2X4dMH22UKUjBTqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRyfX8tY7H4YikjH9ohBs/i+15HlgxmwkoggvtYDfqM=;
 b=CEk2sYaXp4cJlQHEpwbq2EvoumKpxwLeic/ksvW5Gmw65mtZVQT0JApTwO3BmbjsPeP04mskzrdDHJZL6f1ghQ/7WQExHCQeLgw3GZ5cp6+l5j+h61cIljL/SB5BjPlqiVWx+Wvwi2Wbd0qBwJfs/iihKvOKNJjJVFg2CSpd/8ax84BXoFg/o943ykKYtE4Bm8sRP/6KlLFRtyBnJxOvJddaaqjfO10Vy0LD75bmiwZ4S1I0wNYHrbJtxpASq8RbbagN6rjXcd5dTQIggTgFBNgIttZW+N/26sD4m0qN5tOVCrBBde2j9JV+7tAJBoyjDkhWa99szhOBAZqRc+ZY8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRyfX8tY7H4YikjH9ohBs/i+15HlgxmwkoggvtYDfqM=;
 b=h6V+up113B9YYFM72f1auTo5y7wYmLrg5f7x0w3roz+cdNMXxEk7T9GaZFrNDhHMdk2OwjjSwJ3B3t3bzYiWADN47OC7WLxdHQpz7MXEP0rHC1sGgcQWg1EpZ5YG/kj2cevWiTnbKzHudH2NHUu9u0nMesoSPjwmvRnzobGGwfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 28 Nov 2022 12:30:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: osstest service owner <osstest-admin@xenproject.org>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [xen-unstable test] 174977: trouble: broken/fail/pass
Message-ID: <Y4SbuYGgso4DbOCg@Air-de-Roger>
References: <osstest-174977-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <osstest-174977-mainreport@xen.org>
X-ClientProxiedBy: LO4P265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf31690-23f4-4f5f-2ce5-08dad133e639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dtR9cGB9V4ciFvBjyKDXQ3aUGTys2UE2WrMyn4UpSKKOxeXI+PaZDU8DL0z9+CY8VRmoaJb55QAfscue3TAp/QgiwwrPKjzTi/2Oy9C/tKyYHI9utks7HbY43TG4O4bK4msDqusRwQKsNzR5xJokiD09Lupi0EDtlAmqVq7kc7oi7IRWNal6MBTnENmMOXay3/e0ZH//JxvrbtkSvN3Xh3/ZsCD+bnsc+9ldmQU6U9PKAdRfc+RFGarrmcieRHcdc3b7sP+zVeCVCYni6WHP9I8ia4KPfnBQX4PZD7VDO58xgXLKEFt77DJ5ieOdLRAwJ4NJaEgSpOSSRGzYhvmxbu/wR3hJ+BCiFxmc3QxRGui8jnU5oeSrc5E1Vk+HGsQ/k31CxBwleO6vlL0i+fHHnKRZ5eSZxHA8pnw1968Q8GswHszcTvp71OtW2SM5eBj+J6P8vwIb8zpZy+6WL8HwPfKiIriBKIQJya7fcmb5GRMqaVwhjhbckf8+rqJf1yeZbSY+F1i4PWiINu6CZhIcIOPNtGfoGl7OMmizccztUDnQi1MqIoGdxh7nRiehIRiPuOUuG63oy1QhMK4hVxYbhzA1MM6SOWM80AT1HhRxwNaAGaVzPzRvZ5aTp36mrbLxLUXQktpc5fIDDzKWhuv5R/pnS7p3nO8t0/KbbS8Ny92w5Rn0xkMCtlY90IGsnDF2VEsXuGmM7fz+VcMJ08cs3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199015)(2906002)(4326008)(85182001)(41300700001)(6916009)(66476007)(8676002)(186003)(66946007)(66556008)(316002)(8936002)(5660300002)(33716001)(9686003)(26005)(6512007)(86362001)(6666004)(6486002)(478600001)(966005)(6506007)(83380400001)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UURhNmNBbnZhRUEycnhLQkE5Mm16SStBc2ZDM09QbGMreWc3V1V4SXdIL1d4?=
 =?utf-8?B?UVBYbEJZTHM0a0JCY3VvdWZHNFJibnp6ZTRESE5IUVJkSW5uT3RNaThzTDB6?=
 =?utf-8?B?K0NCQSt2Mm9NRkFPbHZBR1J0VEtOK3VSNUFqQklvOE0raW11QnlPWW9DUHZu?=
 =?utf-8?B?NWE2QUplMi9LMWt3Q2JxcDBiSlFKanoyM3ZMNEtvQTZtcEVkRldoajg1SWl3?=
 =?utf-8?B?U3pTamNjSUZ3WUVpbXE2allNeEUybzFNQkFHTWtIcjhnZm1Fc210ZjMyYmIz?=
 =?utf-8?B?a2VDamhqbWlEVEM1QVBRdEwvLzA3eGRRZlJSKzlydW13dEtZWWZOcXpuOWNV?=
 =?utf-8?B?Y0xWZ1l0bGt1VW90dTFSU1FsTVc0V1JEdnB6SUh5dk5IUEt5NTQ4TjZrTjVh?=
 =?utf-8?B?czNUQXFER0RIOEZTKzNiR3d2Wk9OV3RmZU9nZWNodFd5Q1l3TFp2bFVTQkE5?=
 =?utf-8?B?M1l4SjQwcDlpMkRlNklHSW1naEppV0tvWUhEeTJQT2ExTUE0UzA3eW1QeTJ3?=
 =?utf-8?B?R282RU4yQlhuQVc2NDlsN3pFTlBIWCtmTjc3MUNZZUN0TGZhSlVKYlNYa1pV?=
 =?utf-8?B?R0VNSWVrT1Y5YXpjeS9KUWVVWlpvV0hsZGlXWXVqd1htU3JTUElIU3JzZU0v?=
 =?utf-8?B?Z2thM1RDa3BqQ1REcGZLdWRENWRwb3NVRFNKQTFIZVRzOEVybXJ2TDJXcHdo?=
 =?utf-8?B?WkNkcVdGbjhFcXl4aUNUdnBCc2FYaDdqeWRWdXpyRFN2dTJrMDdYV3VXeCs2?=
 =?utf-8?B?Sm9SM3VLRzBOd1B2K3EvSDN3UlB3aGlYTkRkV1ZmdisrSHVaZVRJNXZKeGd2?=
 =?utf-8?B?cURpcHJBRmFnaFZIZVhYcDBibDZ5ZHUreG9ZWm1jQlZUUmtuSmQ5bVo3blJu?=
 =?utf-8?B?K0dMRXNSRnNKMWhzbHZpNnZDYjI3a2Y3WlZ0QVlxVS9iN2dzbUVlekh4R1N1?=
 =?utf-8?B?bzFkME1sV29QcHgyYzlYcVN3blY1VkxRdWFvZnhJU0hub3JYSnNOcGt2QlBv?=
 =?utf-8?B?YTlVWDB1TmhPV1RYT1ZyaTFJeGJZenM3TkpteHdlQVBPd1ljSW9PVDVkRlJo?=
 =?utf-8?B?NVpRMTBZTmMxT09qaXc1Smx3dm9HakJCb2RjM0dUYXVyZ2I0Q2lqd2JsUUpy?=
 =?utf-8?B?c05PSXhLMUFxOEtSNVh6aGpHOGRvN1Y1YVBjbUdVZmF3LzlHeVRFalljdU14?=
 =?utf-8?B?MmQ0WW1xSTNtZi9tbXFJa0J1STJ5dFF4UjExTG5PcnZSVktlaDRkYVJJbnc0?=
 =?utf-8?B?UjllUlFCaVlXZ1Q1QUdCMTBBWFcyY0tXUHVoTEp6UCtUb1dhNjluUHFraHM3?=
 =?utf-8?B?L2pyQWJJMTBBclcvK2U0WEhQU1ZFV0pYMHVkM3dXa0c0WTRLcGpFR3RTTXMx?=
 =?utf-8?B?U2VqY1hpMWkyNUVXZ3ZqQVJIRmRLVXFmZ0VzbGFIeTBUM1VjS05CZ3NTZUtm?=
 =?utf-8?B?RHNxOUV3cEs5dmQzM3hXMDRpeEMwYlpQb0NGeFhrQ01TaGxURjJzdWpTYlg2?=
 =?utf-8?B?ei9rZWtqSDhrMG91VXdWbXRhMFpvSXdyT0hWSWdSWmprWDBCMEFaV2lVUHoy?=
 =?utf-8?B?bVlCaVJSS3JVNU1HdElORjJlR1pjNjFuMVJZd0NKZG9ucGdySEE3cytmWERC?=
 =?utf-8?B?YzM5RzF2ZzBnV01BUkVSVE14K0lDNFV5QUFTbWhvczRhd2MwNGdkdXRmcm9H?=
 =?utf-8?B?SW1lcmVkSGhadXdLN3pCcnRsUnZYQVZSVDhJUG5NUWx4MUlYUjFqK1J6N3Zr?=
 =?utf-8?B?byt3RkduS2NKcXhTcjRaYmllMHNpQkdqWXJESWVyUncwNEcxWHhhSXRUTEY0?=
 =?utf-8?B?aENSWFZUd2hZcnpVczJtUHVzSi9ZYzl6TVJZUTFhUnp5KzByUXp3Uk1SMUFj?=
 =?utf-8?B?MnhSYnNOTWhrTjNwNEs2RVhWZURGbGV1eTI0VXNzQkFPNlVmN0V4QjRnd21Y?=
 =?utf-8?B?N2lnc3JTZzhsQmNVdTZaZ3RpYjUxWkFxSnErTCtCK21iU1pocUhDbFg1dFVn?=
 =?utf-8?B?VTBDWmhYS0l5cGU3eS9VKzYrZllkUXFmekFZalRNSUxDYno2dFNHTCtTYUxu?=
 =?utf-8?B?Mk1qUGk5YUJ5cE54ZDVpWDRteWdhMFFueE5rWmZtTHZDenNNRjhOS0pUM2Qr?=
 =?utf-8?Q?RpLwUdJNdHQ4MA4oHTmRoe3sL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WmUw2biLqTN3OZzMcISNaIcobveMs1kb5uUTeaX80KMW3H7MajdjlNzoS6914vNscQhVAq6nqQH1589fd/FzBnuA161f7lWtAywxwXL0Vhv20Vg03+hMHfSboevryl4PPdeSBx37298BRzZ8cG2fMDmSW45Y0lZQq6wnHhqHL9/AQhrFFbDHlFsVcaHEYL+hBfrHFn88JcgE47hOyJhIxnYKRxdncGc4GA3mv1yz5VFB4xZHcp14CzOlFnUj1pgB1jvRPl3u2jdP+TekyREpDAtymllgFznXZYd5JaZDXV+0PjL3NiMLg2KZzTJELfUOw5OLi8V5BlraGWlrIL7KUVnwASKk2b47/1U3qwCSO/zDyQEpmRPmccii0iew4UPZoSf/ZuSxMY9rnyzg9fRZ8kb0mPXc5qrkwqWk5xf+dpndqoQR40aCFCuW0KYYBaW/2Sa1DdCC+CQxxC2wWAL6f9QwEhDm9TgkU8H71a1m5g1EC+75Tilh1NJl7Vmm9a+7FO3TGHMsyyfwR6gsqx6JX6xTsp/n240V66KoQv20wqV1YDFHuHwfmbfDNTflfuiTAt9nVAmo1Cgjh4EQ9yJbbENvPXNeLwI9hyX32boRs+BuGGiK2MdjMD7LAm7UhoSnYR9EI9xewA8NfoCw/J6MNbKvSMGNQp/vQ+fBxyNN1Ytw8DfgsWiuxWZelhW6sunJ4mbGdxIZVah2Zh8GshOBaq3Gee0TY8WWj+ZK1aifVvSqFsbeCkYcAcod6IlE5AVqc8QvuHta28IAwrvdC2BPgf3jCHSbI7SHs+p0ymDKdnbc/8GJBIPqdn6D+rUMEPNk
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf31690-23f4-4f5f-2ce5-08dad133e639
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 11:30:06.5046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OheSoD/xcek94CHiU/sgbhfzVIyTdJI6Xc01zyHdQ1iubm6wN29zL1dqMMsKsUGR07lS/Kl+sedSzwhHGG3PgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5909

On Mon, Nov 28, 2022 at 09:56:58AM +0000, osstest service owner wrote:
> flight 174977 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/174977/
>=20
> Failures and problems with tests :-(
>=20
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-dom0pvh-xl-intel    <job status>                 broken

Looking at this, it seems like the dhcp server failed to provide a
lease to the host:

Nov 28 03:25:58.963432 Waiting for link-local address...  ... 16%... 25%...=
 33%... 41%=1B[H=1B[7m=1B[m=1B[32m=1B[40m[           =1B[37m=1B[31m (=1B[37=
m1*installer=1B[31m)=1B[37m  2 shell  3 shell  4- log           =1B[32m][=
=1B[34m Nov 28 =1B[37m 3:26 =1B[32m]=1B[11;64H=1B[0m... 50%... 66%... 75%..=
. 83%... 91%... 100%=0D
Nov 28 03:26:02.023435 Configuring the network with DHCP  ... 10%... 20%...=
 30%=1B[H=1B[7m=1B[m=1B[32m=1B[40m[           =1B[37m=1B[31m (=1B[37m1*inst=
aller=1B[31m)=1B[37m  2 shell  3 shell  4- log           =1B[32m][=1B[34m N=
ov 28 =1B[37m 3:27 =1B[32m]=1B[13;57H=1B[0m... 40%... 50%... 60%... 70%=1B[=
H=1B[7m=1B[m=1B[32m=1B[40m[           =1B[37m=1B[31m (=1B[37m1*installer=1B=
[31m)=1B[37m  2 shell  3 shell  4- log           =1B[32m][=1B[34m Nov 28 =
=1B[37m 3:28 =1B[32m]=1B[14;5H=1B[0m... 80%... 90%... 100%=0D
Nov 28 03:28:31.059429 Configure the network=0D
Nov 28 03:28:31.059446 ---------------------=0D
Nov 28 03:28:31.071469 Nov 28 03:28:31.071478 Network autoconfiguration fai=
led=0D
Nov 28 03:28:31.071489 Nov 28 03:28:31.071492 Your network is probably not =
using the DHCP protocol. Alternatively, the DHCP =0D
Nov 28 03:28:31.083456 server may be slow or some network hardware is not w=
orking properly.=0D

Further jobs on the box seem to be OK, so it looks like a transient
issue:

http://logs.test-lab.xenproject.org/osstest/results/host/sabro0.html

Roger.

