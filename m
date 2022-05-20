Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C16052EA8B
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 13:13:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333827.557738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns0ZP-00042Q-PB; Fri, 20 May 2022 11:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333827.557738; Fri, 20 May 2022 11:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns0ZP-0003zt-M9; Fri, 20 May 2022 11:13:23 +0000
Received: by outflank-mailman (input) for mailman id 333827;
 Fri, 20 May 2022 11:13:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ns0ZO-0003zk-FS
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 11:13:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da754fe1-d82d-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 13:13:20 +0200 (CEST)
Received: from mail-dm6nam08lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 07:13:08 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB4218.namprd03.prod.outlook.com (2603:10b6:5:59::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Fri, 20 May
 2022 11:13:06 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 11:13:06 +0000
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
X-Inumbo-ID: da754fe1-d82d-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653045200;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5Q2kUVgjhc6SdfnLcaT+I+SDSqsJBNkmCFpUhoc+p5c=;
  b=Zw+XRKZcW6rbjwcbIGEFlCPtp6q/JNBL/3H+UZQMBxhthQyKFIapP2fD
   q56uelnk3a0MKewdYComGVmxsUg5xUuVNOfjYT2jzibgAWY7Hnd43N/uR
   SJ4Jf3K2adoAADd6XpGZbXS8l8GgIdzRwTIF1pDyHm6+4moqe6+5qY3AL
   E=;
X-IronPort-RemoteIP: 104.47.73.41
X-IronPort-MID: 71150850
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6XzdqawNdWZIYmmknEt6t+c6xyrEfRIJ4+MujC+fZmUNrF6WrkUOy
 moYX26PaPqINGfwL4p3O4jn/BtUv8OAztA2SFRtqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY124DhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplt9+aTFckOYf3neUPejJaSwYiLZ105+qSSZS/mZT7I0zuVVLJm6krIGRoeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtacGOOWvLe03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutriamKmAA+A/NzUYxy2v04DRt7IDrCsWPa4bNdJ5QhWW19
 32TqgwVBTlfbrRz0wGt8Hihm+vOliPTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDVtDgWzWorXjCuQQTM/JTHvM77keRy6PSywefGmUACDVGbbQbWNQeQDUr0
 hqFmo3vDDk34LmNEyrBr/GTsC+4PjUTISkafygYQAAZ4t7l5oYukhbISdUlG6mw5jHoJQzNL
 /mxhHBWr90uYQQjjs1XIXivb+qQm6X0
IronPort-HdrOrdr: A9a23:tiZ+6asMi2pCLKv3zTpmFLEu7skC/4Mji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVeUiz9bUN1LNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJrJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUUHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0k9
 gsfJ4Y0I2mdfVmHJ6VNN1xP/dfNVa9MS4kEFjiV2gPR5t3ck4klfbMkccIzdDvXqA0570Pv7
 mEeG9klAcJCjfT4Iu1rdB2ziw=
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="71150850"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Va6bvB/lnXsrRzcqOYErSBNVTrhVU4yOB9LSlIH4TDXdUEIzwXqPkW39Cr0eCgd+Qd4psWMahPYKZTrLGyynLh5Yyx+9ZaqtS2coNXRaB5DUm4191ZjO59e9n/TAPg4JPLoqPMUrhyEnb1L2AqnpwpnZonsiYRArS/g1ndlcwL00Ny4279qnLKGGRYWx8SNAcYiGxCbCeYcWPWzzBm4kPXD0Rq6/BiNZ1El/J5Vh1tpfabRYSkm8e+v07ZCXpxv8MQm9v9TpiVIi8Wc8UUMNiIQKeIg2kjU7dAqTYoHzh8Ih1YfoEi3UDKnO/xEGP9ieIYzqATgE1S+JPJxGUOVzTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++tL+1LepWkBGrq4ioGauRpSMuFcwSdyc//ZIqPvrss=;
 b=UoIywdX2wfNjSfnWK477/c9vJ/n8tUonJvQ01d0rJa59Oj2uoKIveZSEwALoOEl1dCkHP85mP2uTMCTjAMDpYxodSJhTLuzht8F6RYp2jmA/W1eJw/IrvUTOZ6CtHBYOdg8/khWuTgR2a4JMDtlPBmf2Jj8vM8SuKnreXe2Z2QyDzmqQ/WndnCHwNcA2ZR+FKOBimgJr3bSHGUML4ykRtFmXJFtOM189D+yhmvAWKDEZGs5VmCLopyZXY7DnXnKrEVXmlnl3zAGa1QqM9pY+E5VToA+GAi9DNTxZ9mR41mqBFDmx/WSy1WL4YLZkIpyG7ZNATQ6cilRYSrNFLLPk4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++tL+1LepWkBGrq4ioGauRpSMuFcwSdyc//ZIqPvrss=;
 b=RoWZ+s/2gght5vJTDOAm1fIm1AnDkFxWQVO2m0cdLkLklkwap6Y0TzzawrgXKPP5j2qKA0lHIs093DeynTWVzOvLZ/eFL4hmSCIHDklJtBiPEriwpksGISqOdVeP2SjpSVl6M1EeXgaaMqeldy5zspm7Zi3JwAIoGn/0YQS3urg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 May 2022 13:13:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v4 16/21] VT-d: free all-empty page tables
Message-ID: <Yod3vjK44nfgvw8f@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <b9a2be8d-3bb9-3718-6e3b-f07f6dcdde20@suse.com>
 <Ynp2+faOjZguAUVP@Air-de-Roger>
 <597c3630-b69f-e885-bb08-a52d2c6e7f92@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <597c3630-b69f-e885-bb08-a52d2c6e7f92@suse.com>
X-ClientProxiedBy: LNXP265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e41aa7b-417a-4994-d84c-08da3a51b728
X-MS-TrafficTypeDiagnostic: DM6PR03MB4218:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB4218FF89FD1F1035114028DF8FD39@DM6PR03MB4218.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z5coAcIeZf2Nlo2TPNu5wVSip9iRs6q53xc2ElOjohtojNHb2maE3GeunAWu13IglJ3r1MIfZPZ3GO4J4jCUnHRT6F84gXRtP9C60PCyr5DGBoAMCIIoStWRW8RAzLgaIQHbKxTkmIns8vmp532bVCcK8yT74tTBvyZzF9w0pq5lwT/zgNiqUc5KKPWhx4SO7qdw8t0W4F85dgXUsQBIjSBJ9iCoVUDOpBSZdW4a1bPyXngKbI0n+ZlC4Q31jMqT1jis2Km5qdkT1B5aL4iNx1OV167nBe+XeshXv6Z7cw/peeyhhrw09B/0zrls4WpVMRsS5w8z/K+xtypZEYibPqCV34jw7RoSGrb9YSx2OxEkqtY48t7G60G1ijuOMEEDuS3eGyEH0CiiPtgtR828BMe+yCQ+eoLt7yZ+kw7ytzUUhVm4JRGW9wuRFgqNsUv+WObpyw93wr3b7Ry91mDNAL4dwiDFRqm2Yrmy1H9XuZnwXFyQrTDXcDQU/fDDjj1wTmyqApssIxdj2yp3mgKsNEPfbWqsyNNY7kkq5QwvO00uBaLiR6vawKPY43D0rBageVutmtkKM3Yxrh6BftGpx/jFkPTv6zk8bjLEmWVwjC0IMRI6+XTY2FVAhi65WU85br41Laa2BDX8jURPfDjXvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(2906002)(6916009)(508600001)(5660300002)(4326008)(53546011)(82960400001)(66476007)(316002)(66556008)(66946007)(186003)(83380400001)(54906003)(85182001)(6666004)(86362001)(6486002)(9686003)(8936002)(6506007)(6512007)(26005)(8676002)(38100700002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekVjdDRBRTdMVllubHF4N1VWSlo4aHRndzZ2MjVDTG5jRWh1d3lkVXBSSTN3?=
 =?utf-8?B?aHpPcSs0UVA5WEtuVWh4b0N5dHlibWxpTlNlbUJoMTUxZEZMNXVwaVBJTU1S?=
 =?utf-8?B?cGI3WnhZWHl0NmlIdTRrQXh4Y3RJNEJ2R2tzdENwNmpWS3NkcGtqRmxqaWVr?=
 =?utf-8?B?ZUtxS2tESzdvRTQxck5PY0psR3dYemlXRlZnUkdETWRvSUhpbTVTb2ZEUlo4?=
 =?utf-8?B?WndZQWtMT2JaaHhTVkRlMzQrVWVmRGVLZmlSR2dUd3pNZ2RSeElINDcyMEwx?=
 =?utf-8?B?MWFuUHNBeDhVNk1tN1BsN1ZKL1NTazBHUm5kQSs1VytYZ3hiTjRFbENpTEx5?=
 =?utf-8?B?bmtCU1MvcGZla2pPWHZjMjNCaEl1a0NzL2F2K3NhVzFDdk1lYXNJeTNFOXRu?=
 =?utf-8?B?c1FRemMrREhONmFZLytnekZhTEVFWUNDNm9WbjQ5RDQ1Mlc0Y0RpUXAzU0Zq?=
 =?utf-8?B?MlkxN25wM3VOMDZ3Y0syL0s0US9wSzNrWmtSbU94WXZPTFhBZ3ZwOXFQQ0Z3?=
 =?utf-8?B?cnZEZE9Pc2NrNndMa0pscFJxWWxsU0s3QlpOeEcrQ1FYU28vbGtpc1A3aGtq?=
 =?utf-8?B?MHlGazdWQmI2KytaZVo1MStWbnlKQlA4RjlLR01uRFI3c1FXeDdxbVk2UExI?=
 =?utf-8?B?cmJBZFhrTXlZblBwb2M1Z0VZVEp5TGw3endXaGtXTi9VOVpkdEYwa01YRzV2?=
 =?utf-8?B?ajVBZXk4V1VLL3R5eExLUFdyQXdqM3ZIN00rYWxEM2tGL3R4SHhweVpFR1Np?=
 =?utf-8?B?K2phMFo5RnNlZVU3aERRVDBUK285UVlYcWdzUVc0SDJZZjViODJhVkErZmMr?=
 =?utf-8?B?YStwWkZjOHE2VXZxUzE1VThzbkJtbWR3cUI5aVZ4SDJ1NlhaWFpDZTBDb1VE?=
 =?utf-8?B?eDFqaFNROHJVLzF4UFRrYjlXRWNmeVJQbTZwNWw5b0pOUkdYL1RMTTdUVXlE?=
 =?utf-8?B?UjRCbm02bjBtK3YydTN2R2V5TEh1MXROUS9FYjAraTgwVTFjNFZUeHgrL1Az?=
 =?utf-8?B?dnRCUEFLcDJDT2psM1JLdDBTODNDVXJmN29oVXd1L3dyeTh6c01vRmdta1da?=
 =?utf-8?B?M1hoTmYzakthWWhXU0orcmdFc2pOR3NacTNOSmZxSnQ3OStNbTRGZTJuTWpK?=
 =?utf-8?B?WVZvL0JPOU5lOWRsMDQzM2UyM0lPbkE4eG52aVpvVlhPTHE0Ykk0NVFLYlVt?=
 =?utf-8?B?bWdsMGVNSElvMlFNSVlwaHh3YkJMa3ZiVFNaUGdtTThLQ2E1Nm5iZ2JzbTBk?=
 =?utf-8?B?VE5uWHlDc2pFYTJLVmlJUStYVlY4L3d4Wjd6bkFNWHlxeURWVWo2dExJditH?=
 =?utf-8?B?SEZCQkVPRUltY3NxblpTYURZd3NlQjF4Vm1QQkJHcGRpeHpIZGpJL1N2Z3lr?=
 =?utf-8?B?aCtwNkY2WGtKODl4WGFkUDc4bU8vTEtMUitlanFSeENVR0RuMS9wWDdJdWZG?=
 =?utf-8?B?NE5DeGVRVFd0Z1BmL3h3aUExSHdGVHBVRXdZZDZnRXAwMFpuTm85dXhRTWw1?=
 =?utf-8?B?WnhnUSsreFM4RWRWUDNJUERRd0Npc1o4ZEFML1hWSHZ1NDJ6ZHZpcmVmMGZH?=
 =?utf-8?B?dm9IcDRDVHVnU1NLV3JySzQ2RThORlZkcXJ5eWwzTlA3cXd3RVgvMnhqeDlQ?=
 =?utf-8?B?OHltV3haTm5DeC96YmJxa1Y2dk5hdFpIQW1SWmNJYzVFMldBcDNmaENzT3lr?=
 =?utf-8?B?TDAvcElyV0p6OFlhQ0lmQngxTE5aa0M1OFZhRElTL2s1dUpKRHA2WmMrL2w4?=
 =?utf-8?B?TGJ1dkUremZNd2JpTk85dDMzZXM5R3grdGRPdDNLQkN0UnM4amxJSFlGNmM5?=
 =?utf-8?B?Ti9VMG9udFJCKzNTVHpGbEYraDJxOVZseEZlTHU2bEVEaEk0SjRRd21GYThV?=
 =?utf-8?B?RkF2OXRTT1Y5VXJOdzVjazRvaTUvUjI1V2JxcXdxbnEwUXkwRkZ3RUFqOGxK?=
 =?utf-8?B?YjhoWEs3TFBkUS8xWksxTkx5YmU3bS9NQmpTcC9BNTJQekFic05Uc2JPWXgz?=
 =?utf-8?B?ZlBETTJSVWlkNUNJWStlK1RybVQrMy9pYzY1MWhMbEloQmVVUndrb0VnOHFo?=
 =?utf-8?B?TjFUQ2pIbGtiL0tPY1dqOHcyNUJUQitEU0ZrWFdpZzVGMVFnbVdRY3NTTFZG?=
 =?utf-8?B?T3ZqckcrNyt1ajVrZHA3bmVHQTk5STJSZHQzUlhMbC9zWEgvZkhjU1RSa3pI?=
 =?utf-8?B?b2VzVldrU3RXMEJ3MUcvSDlqNVNPcVpiWmVyRmNLcC9vcHBUR3A1NFF3Y0ps?=
 =?utf-8?B?VWZWMVMrODRYWmE4ZURuOWEvNFVaTkt4VXIwTUlWdmZWVGJzOVdwVFVzN1RK?=
 =?utf-8?B?NlRnL2JhTHVPbWR4TnkyNkJvREtGSXVqVk4zM3VRVThMd05vclBrQUtDbmIx?=
 =?utf-8?Q?qz/LpGkoCl3dJS4c=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e41aa7b-417a-4994-d84c-08da3a51b728
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 11:13:06.7109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Re1tQB6Xp+pGSQJAz40zAAvSHWhMus03LiLsoEDYFDsnJKuRps8pHABcFhcPXawiY5/GWONOWNYcd6b/eXJAHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4218

On Wed, May 18, 2022 at 12:26:03PM +0200, Jan Beulich wrote:
> On 10.05.2022 16:30, Roger Pau Monné wrote:
> > On Mon, Apr 25, 2022 at 10:42:50AM +0200, Jan Beulich wrote:
> >> @@ -837,9 +843,31 @@ static int dma_pte_clear_one(struct doma
> >>  
> >>      old = *pte;
> >>      dma_clear_pte(*pte);
> >> +    iommu_sync_cache(pte, sizeof(*pte));
> >> +
> >> +    while ( pt_update_contig_markers(&page->val,
> >> +                                     address_level_offset(addr, level),
> >> +                                     level, PTE_kind_null) &&
> >> +            ++level < min_pt_levels )
> >> +    {
> >> +        struct page_info *pg = maddr_to_page(pg_maddr);
> >> +
> >> +        unmap_vtd_domain_page(page);
> >> +
> >> +        pg_maddr = addr_to_dma_page_maddr(domain, addr, level, flush_flags,
> >> +                                          false);
> >> +        BUG_ON(pg_maddr < PAGE_SIZE);
> >> +
> >> +        page = map_vtd_domain_page(pg_maddr);
> >> +        pte = &page[address_level_offset(addr, level)];
> >> +        dma_clear_pte(*pte);
> >> +        iommu_sync_cache(pte, sizeof(*pte));
> >> +
> >> +        *flush_flags |= IOMMU_FLUSHF_all;
> >> +        iommu_queue_free_pgtable(hd, pg);
> >> +    }
> > 
> > I think I'm setting myself for trouble, but do we need to sync cache
> > the lower lever entries if higher level ones are to be changed.
> > 
> > IOW, would it be fine to just flush the highest level modified PTE?
> > As the lower lever ones won't be reachable anyway.
> 
> I definitely want to err on the safe side here. If later we can
> prove that some cache flush is unneeded, I'd be happy to see it
> go away.

Hm, so it's not only about adding more cache flushes, but moving them
inside of the locked region: previously the only cache flush was done
outside of the locked region.

I guess I can't convince myself why we would need to flush cache of
entries that are to be removed, and that also point to pages scheduled
to be freed.

> >> @@ -2182,8 +2210,21 @@ static int __must_check cf_check intel_i
> >>      }
> >>  
> >>      *pte = new;
> >> -
> >>      iommu_sync_cache(pte, sizeof(struct dma_pte));
> >> +
> >> +    /*
> >> +     * While the (ab)use of PTE_kind_table here allows to save some work in
> >> +     * the function, the main motivation for it is that it avoids a so far
> >> +     * unexplained hang during boot (while preparing Dom0) on a Westmere
> >> +     * based laptop.
> >> +     */
> >> +    pt_update_contig_markers(&page->val,
> >> +                             address_level_offset(dfn_to_daddr(dfn), level),
> >> +                             level,
> >> +                             (hd->platform_ops->page_sizes &
> >> +                              (1UL << level_to_offset_bits(level + 1))
> >> +                              ? PTE_kind_leaf : PTE_kind_table));
> > 
> > So this works because on what we believe to be affected models the
> > only supported page sizes are 4K?
> 
> Yes.
> 
> > Do we want to do the same with AMD if we don't allow 512G super pages?
> 
> Why? They don't have a similar flaw.

So the question was mostly whether we should also avoid the
pt_update_contig_markers for 1G entries, because we won't coalesce
them into a 512G anyway.  IOW avoid the overhead of updating the
contig markers if we know that the resulting super-page is not
supported by ->page_sizes.

Thanks, Roger.

