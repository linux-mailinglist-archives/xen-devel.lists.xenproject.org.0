Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 877F8365CF1
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 18:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113906.217013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYszN-0006Xh-NH; Tue, 20 Apr 2021 16:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113906.217013; Tue, 20 Apr 2021 16:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYszN-0006XI-Jh; Tue, 20 Apr 2021 16:12:37 +0000
Received: by outflank-mailman (input) for mailman id 113906;
 Tue, 20 Apr 2021 16:12:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYszM-0006XD-7T
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 16:12:36 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d1eb15e-d454-4d91-a20b-b6e30696587b;
 Tue, 20 Apr 2021 16:12:34 +0000 (UTC)
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
X-Inumbo-ID: 9d1eb15e-d454-4d91-a20b-b6e30696587b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618935154;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=IrTeP2ebox1YZR1vjmcCAJL+n72aVNBKPJlwJt3o33g=;
  b=NqoriCtSKut80zrA9idLKdSjlU4+pdDrdqSc3msiZQKnxhnOpxlHlAcQ
   2m5dE/DY828fMlYjYQb4DVt7D6SYNTAp7ME8R1fM3KZGXEA79EmoQAWy4
   Ep0TOkldB7qrYlgBftQiPjCfAvyDxS/ILsGtyUqXn3Gkjapj59aRPAAiE
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TP9xpw1GL6Q3whqpBvhXWURf5NRHVb+R+8Q2p6u1/x1Wu4BHXwd0Ye34GW2UEpRMDN6aKY+1sg
 6oZNjHzvDknOioJK8myZmcabUeXv9811jLCxRlbpit0S1dhsM1b0fx61WNYDZVibLgTqTJlDCY
 TUAiJZq6Xqg4mD8FPdid3jMuB5xvVcA3QaXlPUe/BCTk6byev3iw09IFWGyl9Ge+oDBGDBD7IQ
 HU3SPr1KyrknLI7Yp+0OEEYShj6UcaIHugCvSOZxsqjrrRs9+K/Z7xmbOiglr8R8Dk0laj7q0j
 EWA=
X-SBRS: 5.2
X-MesageID: 41996918
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ITrn3Kl2TDdxB0HD50dR9OkNB/3pDfO9j2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN/AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 tdWoBEIpnLAVB+5PyW3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0ZNi+wOCRNNW57LLA+E4
 eR4dcCijq7YHIMbtm6AH5tZZm4m/TgkpX6bRkaQyM28QXmt0LS1JfWMTi9mi0fXTRG3Ks4/Q
 H+/TDRy62/v5iAu33h/kDJ6ZA+oqqF9vJiA4i2htEROnHQjG+TFflccpmjmBxwn+218lYtl7
 D30mYdFuB+8WnYcG3wgTaF4XiY7B8U53XvyUCVjBLYyKSTLlJKaLszuatjfhTU8EYmtt1nuZ
 g7p16xjJZLEQjG2B30+tmgbWAVqmOPvXEgneQP5kYvN7c2Vbk5l/16wGplVL0EHC789bk9Fv
 hvAMz29J9tACynRkGckW91zNO2WHMvWj+AX0gZo8SQlwNbhXZj0iIjtYEit0ZF0Kh4Z4hP5u
 zCPKgtvLZSTvUOZaY4IOsaW8O4BkHEXBqkChPfHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHtFqG8bYSvVeIyz9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykvGnv+4UDqTgKr
 iOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+dEmJpu7NN432ps3WePveP9PWYHUZc1K6Jk
 FGcCn4Jc1G4EzucGT/mgLtV3TkfVG63Z8YKtmZw8EjjKw2cqFcuAkcjlq0ouuRLydZj6AwdE
 xiZJfukqaxo3iK7X/Fhl8ZfyZ1PwJw2vHNQnlKrQgFPwffarAYoeiSfmhUwT+hKgJgSdjVVC
 pSvU5+967yD5H4/1FsN/uXdkahy1cDrnODSJkR3oeZ493+R58+BpE6HIprFQvKEBRxsR1wqH
 hKbTIFQkO3LEKvtYyVyLgvQM3Pfdh1hwmmZeROr2jEiEmarcYzAkcAUyWWSs6RiwY2Tz9yjl
 l8mpVvxIaoqHKKEy8Ske44OFpDZCCyDKhdBAqIXolSh4vmYRp9V2uMmDychSwiY2aCzTRjuk
 XRaQmvPd3bCFtUvX5Vlpzn9155bU2xVUN9YHISi/w0KU32/lJIlcObbKu61GWcLmYYyuYGKT
 fffH85OQV13e260xaThRePHXgr3Y8VI+TYFbgvGoujnU+FGcmtr+UrDvVU9JFqOJTSqecNS/
 uYYBLQAzXiCe8lsjbl0UoNCW1Rkj0Dnvzp0hG+szT98347HPbIIFNpA5scOMqR6mD4R/COlL
 V15OhFyNeYAyHUUJqhz6qSUhtobjX0ikSyR/szqZ9Vsbkp3YEDVqXzYH/t7jV/wB46LM3Ij0
 sQT6Rw3aDZNuZUDr4vUhMc2mBsqc+GI0QquDHnG+MSfVkiiHnAItOCioC43YYHMwmkpAHqP0
 OY/DAY1/DZXzGb3bpyMdN6HU1mLGw94m9l5uWMasn5DxirbfhK+B6fPmWmeLFQDIiDFrN4lG
 cx3/i428uWfTH/wgbeoH9SJb9P6X+uRYeKOz23cNQ4heCSCBCrmaul4Mm6kTfxR3+aUi0j9P
 F4XH1VSN9ChDkkhJAwyQ6oRMXM0wQYr2c=
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="41996918"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnjgcBk9IkeaP+3krFdNSFyiF+WgHRA12D2+YqcmTfCi3Ce26CTX8Aop23C0j6kga+ixEF62gtYvIAA0oJrwvCf5yJB24L2fKRW5q786NQytTHd/JxSv04mDCJ5EcPfWG73T181Eyjpl2e7kjky2rW7ZSvk3QiI2tGNfnCg6L+vRGgQCoWGIk65X4cFBksCudlnvXaSVIsCzIt+ar6ipcXHz1Yf65xPuzvu+SwW+qxmQ7Sq/lfivc604NYa49aZ6ynHicNKOzWHVRCDXToDhmrHenD6/ctdL3tWxOBay8hV2V3K6JMHvnfZtExMpeEyCqcfTv302h3SRBanzg62X/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEjNOERNmXDf2fx6mSDICJTIjMjkKl1R61WjfFRsnTI=;
 b=Ox615dwtSq7LQdglASUaMCR43KZhNU+dNb600zpjst6KXIj3PAm3mUEEBz/D8mRd441ysCimhy+wmY5/UsrMb3nJva920LT1Jdahhx5tKfLK4FFG+5+t3+YeHpIuWeE+29dc14DERL7+ePR16hwTh1TUuzCWIgA0RoQNXXIh8kDTSvaHkDeF6ZuXDWNpgUD04APEqMDIoOopjY4iluuvBPX5j7TyqwbDjCcFwrhJCnbHbn8rZDEs/mKkTILZfNs8X+5BulOLj5u66SAhYNLXLlu5MSujersw9vkcBD+pQhj3ZSB0qK2x0XokKxuEgG2naTh/SSFNVIAr9n2IdwKx6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEjNOERNmXDf2fx6mSDICJTIjMjkKl1R61WjfFRsnTI=;
 b=rjcC3RXJIkbahGGyNl/clHRsQ8DKWIoc9fFbzdoqfN2uA2BuolU8uehzsbsme2SByTbRMn17zG32tierKg9EenAm/0SNQnaTkSa2Nk/z92kqkjhPSHH0XHfc1O0pCzxqiUjK4jgqUyo+YQSvEr39vkMr7ZvjEShzVcNa0d4pC1k=
Date: Tue, 20 Apr 2021 18:12:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 3/3] x86/time: avoid reading the platform timer in
 rendezvous functions
Message-ID: <YH79ZxNRhW24jmUS@Air-de-Roger>
References: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
 <bdf9640d-3c70-461f-6680-9ce883c19719@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bdf9640d-3c70-461f-6680-9ce883c19719@suse.com>
X-ClientProxiedBy: MR2P264CA0097.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b42c1f9c-5d9a-416b-9621-08d9041718b1
X-MS-TrafficTypeDiagnostic: DM6PR03MB4970:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4970CE1BA88F6738917790E88F489@DM6PR03MB4970.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ntCNqgoqrmuE+mXSx48dvUS1LVRiWOzypYw/AtXyzObEFmzGCKVfbkP8acMBGCAzu+eyiYPwJLxntICNbRBx07H12/llgNVPaJvXhj3KfHROJGNyPrfyw63DyGtrnxnSNhKVm6zLK1vYuErSB+8/bVVEHKGE42PWMiKGkZTdjgpN9hqRs8piG5EBCN+I5gWfcbskhMIuiVQ0WQi3RO9ggRI5uotL7FD4bz8wABtm4x2vmbZ3Ox07ExPeCl0mx+SFMfnKv6U0pSN9EH1V90Vzjrsyisam3JayzUIKanfJO0Nhv2al/tEcitcuG6MCeeLPfQLIX+SBY5Itwz12/9LYZh7E/P8xZGRq6FKEhzQwtW3BTwcr6vRoRw1W/2dU6cxrZBHTJFIDA3BmI1wdNOgwdIjEvuD4ELUMdSLTLmterBSPJiDNHkQ6vG0IA6WY3329pr7TFHjTwTZRHzKSLBrmfVlUjOyzfcGjgAC68PjGzqNayWJiCKDRQhxASrzYZiKz7fwS+eJbgO3s2ORdRFeBbdmwPPZnK18TugvORHIwO/S5THW05gL0BjYNij2DcV3jRM5EjXboRCt4PylhATZY+E0uQSI4C6059CRvEp8nwSk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(8676002)(85182001)(478600001)(86362001)(54906003)(8936002)(6916009)(9686003)(186003)(33716001)(316002)(66476007)(66946007)(83380400001)(6666004)(2906002)(6496006)(38100700002)(4326008)(956004)(26005)(5660300002)(6486002)(66556008)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NTJYRTJYUGtVNm1GZDdIa09tcGprdjh6eW9ra1ozUEx5anRmNHdRSkNHejBB?=
 =?utf-8?B?U1YyTmR6b0E2a0FORHA2S2JMNmlkc2xHeFF5UDE5V0IxTmhZZVYvdGprLzI5?=
 =?utf-8?B?dTVtc1FNVERHSnlwMG9SSHhpeFE3NE1VS1pCRnlEQVArVzBVdjN4V01lTTQ1?=
 =?utf-8?B?TlFmZ2FjWXdrZWtGcVh4Q2xscldsQVlkZVZha0E2WmNNeHN0SUZ6Znc1U1Z5?=
 =?utf-8?B?Q2VOdFVqSHZHZTNCYXZyL01UdlBhMmtKaDJpMXI2dmZZeXdUS3VHcFM0bjJs?=
 =?utf-8?B?V1Zaell2WHBNN1ppbW92ZzFJcmhrQWZHMXZrYThlWmVSSjdRL0hoaG53V0tl?=
 =?utf-8?B?V285R3dJOE5EUnE2cERrQmpydTNPOHB6QldYTUhrSVhLdTFXR3F5Y09zS0lL?=
 =?utf-8?B?SlVGYUQvcnk5Qll5Vk16SXlVNGVSUm1TV3k2TkZMUXE1aFp5R0FyOXMyMmdO?=
 =?utf-8?B?Tks2S0F1KzJnKzlHOXJ3SkducDZTV2ZmcEFFMWJFOVhoSEU5S2h3K3ZNTVV1?=
 =?utf-8?B?MXBNRmpKZmtDUzR2V2ZNMkRZV09TZ3VIcjNZMjNtUkl0WSsvSHBLcFVYMXBn?=
 =?utf-8?B?Z1B1ZlBnR3JweHFPWDNBcFZQOWROQ0NDbVZsdmRoUjJ3d0Mrb0pxVHB1ajl0?=
 =?utf-8?B?TnpDVVRrcmtHTWk3N0NaQUZtblFPaFJmakVZVUhnejVoRHhSeWlJcGdYM0ZL?=
 =?utf-8?B?YlhGYXd1SE5CNVJYYVhPWjRJL2Z5bzdUa0pBdVlLbHFHTWlDVGhrS2ZSMkdY?=
 =?utf-8?B?bWpkNE1KWU5TNDJnUWVHbm5OKzVQTHRRVVRQNGpKcURLeGlmR2xzdjVZdWtw?=
 =?utf-8?B?ZnBpQ1U1RW5TbU96UXFlcjZNakErakdCTU1Ja3ZsakRibGhIUXMrMkx5MVUr?=
 =?utf-8?B?MFhJa2luSVMycms2WUtyMjJCTFBFb2VuUUJNSjZySi85U2ZpckpLTCt6YmIw?=
 =?utf-8?B?V0RJbUk4SXZzWnZJL3NOU1lEWTQ3UVZyV2VSc1hSYTlaekpZVkR6N1V3a1JE?=
 =?utf-8?B?RzlaSFBnMXhEd1hqQmpaaWFHenV1clpCc2ROalR3T3orK3NlbHoyeXdsQUxx?=
 =?utf-8?B?NGRkRGF1K1c4RnRjRU50RXMvV1R0R3JEa083SDJ1VkZIc2lhMHdCaG1pZkho?=
 =?utf-8?B?YlVmSzdLZVlxQ2hjYWQ1TFlla2oyM3MxQnJDK2wvSm16QVRRNGNOeUdjR2RJ?=
 =?utf-8?B?TDNoSVl2UGZ4cS95WEI2NnZ0S2ZBVjZaR1lITDJySXJjZTNtRjlYeUhUVnEx?=
 =?utf-8?B?UDA2NFZ0UDFWR2o5aks4K2ZSUVlnV015MDVHRWZxU0RIbnJwUU5mUjRqSDNN?=
 =?utf-8?B?QkNLek0rZVFnWVdjRHgzRUVpcW5nQ0dsVS9OMHNiWWUrQlNvaFB2TVhlSnlm?=
 =?utf-8?B?anNTTldkMzNNaHhtaWYxY0sxWE4wR3FadzY2WjYrUXlSenZ1YTM5U1NJMTlC?=
 =?utf-8?B?SDdVa3UyOVhZTS9hb1BVanhNZ01oT2lyNnJ2TDkvV2hqbVlLNlFSUUM2VWRu?=
 =?utf-8?B?c1haOTlPUnN4Qy9lV0tPZ201QlA2aDFLNm9SKzJOWUhtSWtqeURIQ1paQTlv?=
 =?utf-8?B?N2VtZytPMGtIdUdDcnhJVXdPSVNwQkJmWm9pZTBVQ1pqblh1N1YyVmFQeUFI?=
 =?utf-8?B?dyt1Zm9vQ3hQY21DeTF0VTJSSmI5SmVrYTdsMElDRVYwZlFHTzV3SllNdGdm?=
 =?utf-8?B?V1R0SzF2SWh6T2dYUTZ2by9QaS9ob3Y4eWZ1enlPV0kwejhkVHE4Q3hLemxN?=
 =?utf-8?Q?liNfNI57cfNpOnrXCy9JAROXSpb9yuC/MLM62im?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b42c1f9c-5d9a-416b-9621-08d9041718b1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 16:12:29.7553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5IPd6RMh1T8tdIJeIfQM7bF0SLOc/8veSYFv2/OAakQaUpdo9DqvHc/Z8TNGH1fRReK8nAJDG5o24mhlvPhwxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4970
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 11:55:10AM +0200, Jan Beulich wrote:
> Reading the platform timer isn't cheap, so we'd better avoid it when the
> resulting value is of no interest to anyone.
> 
> The consumer of master_stime, obtained by
> time_calibration_{std,tsc}_rendezvous() and propagated through
> this_cpu(cpu_calibration), is local_time_calibration(). With
> CONSTANT_TSC the latter function uses an early exit path, which doesn't
> explicitly use the field. While this_cpu(cpu_calibration) (including the
> master_stime field) gets propagated to this_cpu(cpu_time).stamp on that
> path, both structures' fields get consumed only by the !CONSTANT_TSC
> logic of the function.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v4: New.
> ---
> I realize there's some risk associated with potential new uses of the
> field down the road. What would people think about compiling time.c a
> 2nd time into a dummy object file, with a conditional enabled to force
> assuming CONSTANT_TSC, and with that conditional used to suppress
> presence of the field as well as all audited used of it (i.e. in
> particular that large part of local_time_calibration())? Unexpected new
> users of the field would then cause build time errors.

Wouldn't that add quite a lot of churn to the file itself in the form
of pre-processor conditionals?

Could we instead set master_stime to an invalid value that would make
the consumers explode somehow?

I know there might be new consumers, but those should be able to
figure whether the value is sane by looking at the existing ones.

Also, since this is only done on the BSP on the last iteration I
wonder if it really makes such a difference performance-wise to
warrant all this trouble.

Thanks, Roger.

