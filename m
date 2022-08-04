Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DB358A16D
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 21:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380684.615011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJgo4-0006Ts-2z; Thu, 04 Aug 2022 19:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380684.615011; Thu, 04 Aug 2022 19:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJgo3-0006Rt-W5; Thu, 04 Aug 2022 19:46:55 +0000
Received: by outflank-mailman (input) for mailman id 380684;
 Thu, 04 Aug 2022 19:46:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t48H=YI=citrix.com=prvs=208fa1d4a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oJgo2-0006Rg-9u
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 19:46:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ed58369-142e-11ed-924f-1f966e50362f;
 Thu, 04 Aug 2022 21:46:52 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Aug 2022 15:46:46 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6067.namprd03.prod.outlook.com (2603:10b6:610:be::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 19:46:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5482.016; Thu, 4 Aug 2022
 19:46:44 +0000
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
X-Inumbo-ID: 2ed58369-142e-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659642412;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0ISrKlLdXiQA2kiLLtSCtM90vq56l+CLnZE3FJ/nLlg=;
  b=OhYBjLHE3jIrjWhDbaNoiTVtL0eoNUwpkrQ6wuHnCtt2yevdFWHZ8jE9
   eNNBe8TpmCYE5tKFIQgaksdNjDFaOD55PKHWjuQmThObYL0ODCgiei22D
   Utj/6pAYZXUYZiI5huutiECC7sojfBXaJWeaX4WMp3nXiiaZ7I05u+oJ7
   E=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 77404083
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A5aaA0Ku3wE2B4n16k9Uia94wiefnOphVZm8NN?=
 =?us-ascii?q?MmfNp3fuWXJ3RfKv9dyOEYHL2/6zzbmfIGanswjXVU0zJTzk7SBzRojec7qh?=
 =?us-ascii?q?vb+7RL1gYIdxS5XJ3PGNWv7ZzsrfDt9QKPOaUvJt6JZesOMIoM2bJys9E065?=
 =?us-ascii?q?hwSAaSvbdapmleGGDTSZU3YI2VCvJxk0y2doFz3VnmJpPyXs5c5MBKp9iHku?=
 =?us-ascii?q?2JFGeSMWi8gOI/LgvBdqknHks1S7XOlzcrFphGfGRHsBX+svhHTZlJxg3dzS?=
 =?us-ascii?q?eAf/5q7QeU0ayowO48O7i9lgukBq4ZYBWzyIg2NVL58my+LQ+kFY1VSdt5E5?=
 =?us-ascii?q?6s/TQM04EMdOlwLyeItHFT98H+LQPg5MQhkvVKNR2YAbfEoZpL/ru/Mt7vXX?=
 =?us-ascii?q?CcWoVTay+kUTFUfI3s9/YhuIol5Qe94SE83GYQ/VnQml4goWrmyUvtX2QRu0?=
 =?us-ascii?q?AwVLtblERZSh74lm2U+tAVWwblVy6Am7Nz2Fk7lWwuGyVmo138Dsrl9uzXl7?=
 =?us-ascii?q?u61fVb2S0jWz+Qa3ectGsClGIF5/CUMx0NQdY6I/iTuHu9W84u2KVt9TCZ9J?=
 =?us-ascii?q?rGSoIFQMyGH05H5jco1InAyZWWUSe9lEqzNqizpzcbKZ39KkBwA4reMdKh4K?=
 =?us-ascii?q?1XPH+gpSR44wecJ40ID1bChyCux/6uBtFBz2XbZIGyZr9qIzYGG1gAR47+8d?=
 =?us-ascii?q?3U8YgKd8JIO30i7Rz/G5aLsK4xabF64b+0fliyLio7zzKzKP+qmXzJ0fd3EW?=
 =?us-ascii?q?nZk1FuxWMienhsR6Y1e9VBGduhA5tf765/k9KyDjRVAQh7ftzcORFxbHZFzk?=
 =?us-ascii?q?AhlqltR75iOYQGBfSYV5OVGTy2nEsGha+z+IN47lEiUrJXVjQbSSTti68jmC?=
 =?us-ascii?q?G0Kgizb5hFyyCpq3TichfAdXD0E7mSmW+ZezLEiktB7d2QOo2Ss60f+ahGgt?=
 =?us-ascii?q?cZuhcG0SBvFr1C61qSJHBZLMSmSejOmsjkZObZFOVZVP4OhFnIG59vSzWQIp?=
 =?us-ascii?q?pDMvXLfc7dnE0D79vjiWTzpRpRVSmN0SxUwJX8Hl3sD7cBijNtoqBKcN2y7B?=
 =?us-ascii?q?7MJUEpUCXXpEdMgY+siqOrRaoplnwrvzKg8W7dxcEeQ7eumNxMYyaEM/vrQF?=
 =?us-ascii?q?C/gTJ3Ro4EkPhGPn1RCVc1Xm6MJ2YiQO93fkze/mLwBk09QdK2nwvRbmAQIf?=
 =?us-ascii?q?cQf7jxoni8eR4kdqx1BbUIR//Ei6njktGZybNdkX4YcJyZifKRmpDXKa/oen?=
 =?us-ascii?q?3WeG+Zch3CojhPIvKKsCdCSXUx+HDRhGn8SyietEoMcdnzjJgowsToHHwuLS?=
 =?us-ascii?q?7koNURo/veV4nEHyRH/oGPue3cGYNNNcId/MnYcd5yo5r10LEhlMFRwXXDmD?=
 =?us-ascii?q?TadGPuoP/osmIUfT0PQQHPz5aSMqYM8L9lBUO7D6Ex6Nx6mt7xY0CY/xh04Z?=
 =?us-ascii?q?P7n34VLocJsuP/ojPPwI+KoPL+zepob0KTE8tXH1qsrzL0K97q/zdQXrf6/G?=
 =?us-ascii?q?kfUEjR0rUjimtAkQy3LPwI3u7hUCxS4lgpPpCv9mTBIi6u4FVVdJsapS9VFa?=
 =?us-ascii?q?awdLXpKQHtJdEX/kkvS2WreD9TP9v2NybAG6WVps415qmXvCZdGsoMUB9t7w?=
 =?us-ascii?q?ewJ4sR4mGp9kBjfyqPTNVOPk70uS0Mk4M6XLtzFtxwkOYOSEjeY6N0TR1Ek9?=
 =?us-ascii?q?CnQiGbBgPtYgFfUt+801gbcgszHERLw79nSR4lw2BuDip+ARs2atdHqPPQys?=
 =?us-ascii?q?sobF5jdy7/abx8keJWIC/GuCE5e/GIOvHgmmFW4Q8M6MvkvjUlfhQWnRvcNS?=
 =?us-ascii?q?Kqc+XcNT1N1Qho+LAfoqQZQDdWoIIdzl5cqcNsLz0+WkFSenJ3siZSG2BvRL?=
 =?us-ascii?q?lKv0YlJwVSICYpqMVfv4/IHUbrY/GGSMAE4/z8aNCcWs90/tMEW3WF/uR2Y3?=
 =?us-ascii?q?CPn5ybsDKhEDPdGyYbm+Bkf991lfH/ZpBLu7NAptbBjD+JsmmH0rXZpydSyX?=
 =?us-ascii?q?x4u77l9mU2qq3RyB+++U/Rkbm8p0I3921/hxazDbhNIkJ/rDUqL2IhCC3lLa?=
 =?us-ascii?q?h/BMLQmPMm+7SqXa6JBeNbZbRPon96a4gf0OjRQKOuUbVj16fjVi9Jqx14lj?=
 =?us-ascii?q?KcGwVCCzWFrR4BGNMOUHkEKwv23wfgpZXKj+yrhXt4h1Pp2vpURjJfZM9CLG?=
 =?us-ascii?q?KhsA7V7O2RbiXZ0iUdhp99eJAwAvJeFd/20C2519euZE4AzNLWdjs91Kh6Oz?=
 =?us-ascii?q?ryV8Oc43cDrbFxGzh9C9esQnmKihlVZm5OwQvjzW2IWk1zWtOLtYl56eX9BR?=
 =?us-ascii?q?q1hegyRrlRH7hZCXkLlBgElOAKHe2F9W6li6D4gGRY8+4gBqyO5dLF26W18O?=
 =?us-ascii?q?9OcIhBdk8gSJJYGBs34JbVLRZ54VtIcGMinTdthWce3n9khH72EUg41eLL0t?=
 =?us-ascii?q?mMmJOpD3DiWn4pYFg=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,216,1654574400"; 
   d="scan'208";a="77404083"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MU/KkJ+Hbmi8dZHz0jTAq9H+VRPPSxnulBohTXQJMRlvINj5sJvIcUwhNvvi0zAAGhHa26g1tzM0Zt0L0X3g3dxOv99gnrBH4IehZgCHoA897y2HmIBes4cuJ5J5uzfT33bFwK0S6uwMCxLv7b2Rr/5SS/Ir4n2UBafEUvFONkk1NmfBA3j7W1m1V0yMKSTM3zMlv6yM+1z3zdvbZXlX6rkS0cma2gnpj93A2MysNW2X0AwsyZQhtRr0tHTa/c2wDLhiQRJZiKeFmI9apgKgydHZ5g0gB2iGYwA7s9V8jnMuJ7/M7S+Xm7v5Nu85QeQlJ7vyQ6+hZrJFm54ZVqT/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ISrKlLdXiQA2kiLLtSCtM90vq56l+CLnZE3FJ/nLlg=;
 b=Kek12yE1CVwDOokMnHLNjT/7NvE1/TIgelYQVxZBx5qBO2GaWn63CcuL5VH0M6Nll8AmJ5UD4hPfC2E2ibD1l0E59K/jNnQyJJ+mG4c6RZdp00fY5t91JzSDwICOJwvR+9sfcQtHAlKjEz+qGUasYVMLSh+gtasc3BvlYazNQi/DtCfwoR7vsQYK3PNIpcEEGConyhx6+PYkeOmLV4FNete0UwWMuw8mF8gz83F3jihAa1nOGb+uow9dA/YYH9xOLK8zmQwX9CjZ+P7xFU6TWdFe9bbZgh+NBnnI58uqbD+AAcK86Gas2JeK9S++Vv70p4GgEky8aICeLAhEGhB9ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ISrKlLdXiQA2kiLLtSCtM90vq56l+CLnZE3FJ/nLlg=;
 b=vQ1z1xJLhoglc3VjY23gGy5rR2j+1ulbePRaeh49SJVk3gtMgDnPX1qT033pESyUUAkRxWwiSU2g++jMFsgnnqqVOIfc20r5bznOW/gTFaa2hyF6Eqxy7h5UMjEkvIN79ZhYm3oqCuvAXYP4SF/b4aOxf1sj2DayWcX8DOHM+Z8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jane Malalane <Jane.Malalane@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [RFC PATCH 4/4] x86: Use linkage.h helpers to add tags to symbols
Thread-Topic: [RFC PATCH 4/4] x86: Use linkage.h helpers to add tags to
 symbols
Thread-Index: AQHYqBOXi/4PmB1YgUyL1NBic4sFxK2fJbIA
Date: Thu, 4 Aug 2022 19:46:44 +0000
Message-ID: <554f0d5b-42a2-2640-32bc-69db1acd759a@citrix.com>
References: <20220804150424.17584-1-jane.malalane@citrix.com>
 <20220804150424.17584-5-jane.malalane@citrix.com>
In-Reply-To: <20220804150424.17584-5-jane.malalane@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb418716-8896-4dfe-859f-08da76520f90
x-ms-traffictypediagnostic: CH0PR03MB6067:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dIuArOC10X5DFGvDPJelnWTHAtQOByF9iIfDjxBr7Jp678EhkA95JFQzRpCC4MMDDO+XOUQjaUdsEjoMbXDawKxmVqfTms1RTCZBB0HZtmrsAZH3zpsbsrJHW7A9PfxHkSGGG6wg0pOvA+WP7/zfECMU/l5MySJ/YcGPS67v9YleCDsCLDEkrbzgr9zauvUaLhv5wwndCbiRlzBRvDZ4szIWauWawI0K6LikYrgtQv2s3+vJNGG6dGeB/OoZxMU5WHak+DXyeJin/WPb+S6/c1hirgeuxw47ZivdPhVJlmZ7vpjn5BzdV2VrpAOIA0VtVueeNE5S5jFL/FBVdH4Z52R+OZM/0pyA7Pu+omzKrtPQJsS+IR+w/Bko1wE40JRIcfIRL/NNAk65Trix7h3Pmp2B8XXYST4towLQG+AmziTgLsi+QDxl2LFmi95Zbej3RYK+a/rBDjwRFpUB5qcOI70522fUVXAnEDO3b94gzqnNo75yvqD/sxYYmXzR9CTNZd7XNyunU/MFu+Kz6l1W6q3r+RzX/aLfQ++80sHCe7IZMGIfBLZTvzjTYLYWgvA52h4arw1+HWSpaurGvf9wZqDoW1oLnrxtQL7lOpcrGbtzZQl79RKuphHV/R99guZsULJjYNbvVTI6inCt6YhnxryGKiVzgzub3hBwBj/LIKpHLEW4eQJyGIHDzWyDPt/CmNz45PwlMAOwNU/x+KymJg4sBILG8/AlrXXOzgE2D9Brzmx2UkaMu/QRLZ56LFA9L0lBIYmKxAWN3BKVyF5YfGX4E3Q27ZOggCs/8EeruuIIK0WAoQxwRPZSKNyEMfF7k8y5hu5GAGEJQiXo9TAHgqExzmgCFJ136Mz1j6EEdAD/KZqyla5I6U+HbVr7+gev
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(6506007)(53546011)(2906002)(122000001)(41300700001)(38100700002)(2616005)(186003)(6512007)(26005)(316002)(8936002)(66946007)(86362001)(31696002)(6486002)(478600001)(76116006)(66476007)(64756008)(71200400001)(66556008)(4326008)(91956017)(8676002)(66446008)(31686004)(54906003)(110136005)(82960400001)(4744005)(38070700005)(5660300002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Yzk3VW1kMDdXb3ZXWE5lcURnRXcrZEVYVHlKTEpiSHF2NklEczZ5NHpsUDFW?=
 =?utf-8?B?RkRZOFE4MHFaMXVhYWdYdE9id3ZhSU5sY0xDQnBzQlQ5bkQ2TFF3d0UwNk9k?=
 =?utf-8?B?K2NjY3VXdVNtcnVTZ0hSZXM4bXpKUWZTWVF0bVRUZVB2Mm10V2kvT1k2UmZP?=
 =?utf-8?B?R2NoZW03Y2d1SFZvNnprbmRvTTM1TEhYeE1GMnQ4aTdXNmZRZkxWNHRlcWpy?=
 =?utf-8?B?cnMyVERJRXJZOThHdnRyYng3S0h6ckhJRDJEbmgrMkZla3I2dVIzbFRmMjY4?=
 =?utf-8?B?c01FV21UT1JqZ3V0RDlTeEZyMzBVVmszOEpoUTJEenYxMmo0dy9BQ29QaEcv?=
 =?utf-8?B?dkdIaEhXcm9oTTNYVGQvK3kybzdrZ0Fmc1pvL3JUWlVkRnZ6R201VkZCRDNR?=
 =?utf-8?B?NCtaNkNsa3dTcTlHTzJOVWgvL3NrL3pEZjdsZEtqY05Bcmp4alFqZ0VBUU9j?=
 =?utf-8?B?bzRwc3NmdXlXTVFOTWVjNXI4S08xdmtxUTY4L2FiZUNnRmppdzZtYktsWDB5?=
 =?utf-8?B?Um5Ya2hHclY5WVJ0bjg4RG5aWkJ2VW82VDdSMWIxcmhEb2NtS0RnTitQUnY2?=
 =?utf-8?B?V3RCcHBTYlZobUUrS1UwLzc5dkgySUk1U1VpV1g4Mncyc2hoMjBMZ2RwdU4w?=
 =?utf-8?B?QS8zczRhM09uc1J0cDJCT0diWGRRZXhGUUtueElPOWJhY0REZkMyellhOTdD?=
 =?utf-8?B?eHk5WHBjVnAzVkxCQU9tRElZbDFuRjg5eGk4UUJUdEdUaFZTRXJvVGhVaHo2?=
 =?utf-8?B?RFJKNnJrSHArQUhrdlpnZmFPZWpJbk5aeTZIZXFxN0dhS1lPcElZYUoxL25T?=
 =?utf-8?B?TnA4aExOWmhZNndDREo3TkVsdkVubjJtdUR2L3QraENsNTJINDdOVXJxcitP?=
 =?utf-8?B?WS9nSUZuamFZcExVRFF5ZXNGeXllZGxFVi85dDloU2cwTzFjTjRyUHFHUjI0?=
 =?utf-8?B?K3paQWpHR2ROcm44ckppMlRoTExTUTY2ZTNFT2ExUVdkd1UyTGZuQ3pqYnVH?=
 =?utf-8?B?MUVMMXJPdUp0VGFIWFd2cWloc1NqMWpFcUNjaHhBS3AwdHpKc0w0cWhWZVpE?=
 =?utf-8?B?RCtxTi92YUN6ajhXcHlKQkNUcWUxWlJSdSs5c3NqL2lrWks3YmpzNXhCRnlD?=
 =?utf-8?B?dDE5MVI0MmRkTDlKNUZoK0toYjhxQldJRXViRDczVW5vcUs0SnJ3WnhmV05h?=
 =?utf-8?B?RnhpN2RuVm45M3BsTVVhZENlcjc3UFZQaWlJMnFJQXd6d1lGU09EcXcxb0JG?=
 =?utf-8?B?RkcxSkRWTkp4UWtPbTJiTXBtTENDRUlHTEU4b3VoRVFQTjVlVVJVaG1qbXdB?=
 =?utf-8?B?WVNwMVJubGIzOUgwQVZ3RjI0bE5zdEhwYjVBeHBiam9oYTdORVRhM2NUWXZZ?=
 =?utf-8?B?c1R4Mi9wckNNaWlFNGp6WGxjb2VlWGJ5QVlOV1AvYlROWVpsYVo2RHRYNFRm?=
 =?utf-8?B?UmZ1cVhYc2ZyakRXUlNmTmlQRGFBaVZoWGNQYXZyNnBUejRsOWsvY2hScGpr?=
 =?utf-8?B?d0laVEdRc2xvWmZFeTllN1RsOVowWXlPWjZSV1lMUlA1Q3dKTTQ5Vk1wUkt3?=
 =?utf-8?B?OGwvNmpPZGtEdXFRSHZ1bzZhTkNOakl5TEVoeEo1M2YxN2pvYjY1Q0s3RG9n?=
 =?utf-8?B?ZncwaFNkTEhvaXlTcHBhUHpianExNkVjT2w0QktBenlSaTFZSzBWWGxtdGxG?=
 =?utf-8?B?dkVsY3YycnZxVzB3MU1paEd4VkpQUmt5NVJpR0JwZVlPM0ZqVldUNkMyR2Yx?=
 =?utf-8?B?Um9raTVXL0ZOdGpyWUxsUFpJckRtRlFHdFdZS1k5YUlFTHdZOWFyaWZqUE4z?=
 =?utf-8?B?MFYxdFBJT1ArUHQrNFptQmZwOXJ5TzZTOUZmazNhdWRhOGsyU29QaE9ucXlw?=
 =?utf-8?B?NG5LTVZZZWpzcjhVNDdVV1hTZGRGN25ybXcwZXJpSlQzeTVUeHlzU0tneXd5?=
 =?utf-8?B?QmRsd3ZFT0lHZlFTZ0lDc2ptVS9JVjl2NVVQOFFQNU1reHd3alRtT3d6Qnpa?=
 =?utf-8?B?Mnc4enRtTkpXa0dia0V1b3RsR3RFazhVZUk5NEtBcEZGd2JqaEV5WXltbWdM?=
 =?utf-8?B?UDFJNkd3L0RTWEZKRCtPOTJaWUxURmp6WFlsaDVzdXV3bGpsY0RXa2piMHM4?=
 =?utf-8?Q?5VjfzxXGyNkXRLua+yXozos2q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA219807B5E93E4392425B63177184A6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb418716-8896-4dfe-859f-08da76520f90
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2022 19:46:44.6559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VKqNSWZi5qX4uIvFIJfDN85GaVxJbkcTASlzqzdgcGXTBLHJES+Xs9CkVYfysB+QaCf5qnqTTCZBZDhoSe7QKpEq9RMm70A2M1nmhfc8n7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6067

T24gMDQvMDgvMjAyMiAxNjowNCwgSmFuZSBNYWxhbGFuZSB3cm90ZToNCj4gQ2xlYW4gdXAgeDg2
XzY0L2tleGVjX3JlbG9jLlMgYW5kIHg4Nl82NC9lbnRyeS5TLg0KDQpJdCB3b3VsZCBwcm9iYWJs
eSBoZWxwIHRvIHNwbGl0IHRoZSBwYXRjaCBpbnRvIHR3bywgYmVjYXVzZSB0aGUgcmVsb2MNCmNo
YW5nZXMgYXJlIG5vdCByZWxhdGVkIHRvIHRoZSBsaXZlcGF0Y2hhYmlsaXR5IGZpeGVzIGluIGVu
dHJ5LlMNCg0KPiBUaGlzIGZpeGVzIHRoZSBsaXZlcGF0Y2hpbmcgY29udGVudHMgb2YgZW50cnku
Uy4NCg0KV2VsbCAtIGl0cyB0aGUgZmlyc3Qgb2Ygc2V2ZXJhbCBidWdmaXhlcy4NCg0KU3BlY2lm
aWNhbGx5LCB3ZSBhcmUgYWRkaW5nIEVMRiBtZXRhZGF0YSBzbyB0aGF0IHRoZQ0KbGl2ZXBhdGNo
LWJ1aWxkLXRvb2xzIGNhbiBhY3R1YWxseSBiaW5hcnkgZGlmZiBjaGFuZ2VzIGluIHRoaXMgYXJl
YS4NCg0KPg0KPiBSRkM6IEknbSB1bnN1cmUgb24gd2hlcmUgdGhlIHBhZ2VfZmF1bHQgc3ltYm9s
IHNob3VsZCBlbmQsIGkuZS4gaWYNCj4gdW5saWtlIGN1cnJlbnQgY29kZSBoYW5kbGVfZXhjZXB0
aW9uX3NhdmVkIHNob3VsZCBiZSB3aXRoaW4gcGFnZV9mYXVsdA0KPiBsaWtlIGhhbmRsZV9leGNl
cHRpb24gaXMgb3Igbm90Lg0KDQpKYW46IHdlJ3ZlIGdvdCB0d28gZXhhbXBsZXMgKHBhZ2UgZmF1
bHQsIGFuZCBOTUkpIHdoaWNoIGRvbid0IGZvcm0gYW55DQpyZWFzb25hYmxlIGZ1bmN0aW9uIGxh
eW91dC7CoCBCb3RoIG9mIHRoZXNlIGFyZSBmYWxsdGhyb3VnaCBpbnRvDQpoYW5kbGVfe2lzdCx9
X2V4Y2VwdGlvbi4NCg0KSSBzdWdnZXN0ZWQgbGFiZWxsaW5nIGhhbmRsZV97aXN0LH1fZXhjZXB0
aW9uIGFzIHRoZSBtYWluIHN5bWJvbCwgYW5kDQprZWVwaW5nIHtwYWdlX2ZhdWx0LG5taX0gYXMg
c21hbGwgc3R1YnMsIGJlY2F1c2Ugd2Ugd2FudCBiYWNrdHJhY2VzIHRvDQpzdGF5IHRoZSBzYW1l
IGFuZCBub3QgcmVwb3J0IHtwYWdlX2ZhdWx0LG5taX0gZm9yIGV2ZXJ5dGhpbmcuDQoNCn5BbmRy
ZXcNCg==

