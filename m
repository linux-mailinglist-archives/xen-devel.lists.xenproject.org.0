Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31DD43AEB5
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 11:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216312.375864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfIRg-00011j-N9; Tue, 26 Oct 2021 09:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216312.375864; Tue, 26 Oct 2021 09:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfIRg-0000zk-Ji; Tue, 26 Oct 2021 09:08:36 +0000
Received: by outflank-mailman (input) for mailman id 216312;
 Tue, 26 Oct 2021 09:08:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d0pl=PO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mfIRf-0000ze-5g
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 09:08:35 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a60e4e4-363c-11ec-8428-12813bfff9fa;
 Tue, 26 Oct 2021 09:08:33 +0000 (UTC)
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
X-Inumbo-ID: 4a60e4e4-363c-11ec-8428-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635239313;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=lBHrAXnJwyE79kBw8uElhLP6I5Ou6vvZtflZ1PvWTrM=;
  b=VuJrV8Kb8hJzHyFpbAfn/15uSlA2Ki9Xdq5glMvOaJekxKCettXdzJbw
   3ToO2ZJmjB6cXAImFn2qSdfJGfsvCQtbDDP3H7gGXG73DBu9IdunhVg+g
   hLRil25Bxz19NqL/quvO9cQy2BbYp3iwI4atyNaMTcIUhfnzHbXDGbsg9
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: S08Cj1bUdPU3NXIR830ffSn45wsowkmepDrf/BlSpPzFUaPeGUIe8G3adRpp6IS8obsbq4vqn0
 //CygMqrYlrFBx32n26kZKJPyIco5tiMMQWXKwdfAL6k7feH2wf57M7yHdhe6kCnHCZfSlTUcf
 QJm2TlL+NU4J7UdWATmzqOjdjcNpWxi9iqXpvWvReUAFW7odz9OUeDHfciQ78x2ruAkhCVRQ5k
 ca3C+MABVDW0dZtMUsIdRkyd+1xRlfS2RsdfCPuwwQ9nT58UU4zl+/RT4zjd24FqCXhT7b8wlu
 +w/K7Arb2v19SEWhxIpIxTmq
X-SBRS: 5.1
X-MesageID: 56454941
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BIaFJKl50bH+bkywh4FmzxDo5gyjIERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJCGzVM/vfY2v8ctF/Ot608xkB7ZHdmtBiSQRvrXtmFiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg2tQ22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NNur8DrcD85Aoj3udRabwNxDB1eOIQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpu2p0STKqHD
 yYfQWF0fg/qbDJyBkksCMI4htmKnmHjWjIN/Tp5ooJoujOOnWSdyoPFMtDYZ9iLTsV9hVuDq
 yTN+GGRKjgAKNGa/h+U/Xuti/HnkDvyXcQZE7jQ3vRnmkGJz2ofThgfT0KmoOKRg1S7HdlYL
 iQ8/S4jrrM78kCxedD7Uwelu36PvhMaWN14HvUz7UeGza+8yxyQBnUACCVAbtMmnMYsQHoh0
 Vrht83uATtjobiEU0WX/72frS6xESUNJGpEbigBJSMV7t+mrIwtgxbnStd4DLXzntDzASv3w
 T2BsG45nbp7pccN27/hpQifqz2pr5nNCAUy423/XH+h7w5/TJ6oYcqv81ezxfFEIYWCR1+Np
 k8YitOe5+ADC5KKvCGVSeBLF7asj96eKyHVi1NrG5gn9hyu9mSlcIQW5ytxTHqFKe5dJ2WvO
 hWK/1oMutkDZxNGcJObfaq3KN52lpHYBejAbdHkKeZUS4dNVAquqXQGiVGr40jhl00lkKcaM
 JidcNqxAXtyNZmL3AZaVM9Gjud1nnFWKXf7AMmhlUz+gOX2iGu9EO9daDOzgvYFALRoSek/2
 +1UMNeW0F1hWen6bzi/HWU7fA1ScyZT6XwbraVqmg+/zuhORD5J5xz5m+pJl2lZc0N9zb+gw
 51FchUEoGcTfFWeQelwVlhtaan0QbF0pm8hMConMD6AgiZ4PN//vP5OJstmLNHLEdCPKtYvF
 5E4lzioWKwTGlwrBRxENfERU7COhDz03FnTbkJJkRA0foJ6RhyhxzMXVlCHycX6NQLu7ZFWi
 +T5jmvzGMNfLyw/XJe+QK/+lDuZ4ClC8N+eqmOVe7G/jm23q9M0Q8Ew59dqS/wxxeLrnGvGi
 1/NWkdG/oEgYeYdqbH0uExNlK/we8NWFUtGBWjLq7GwMCjR5G24xoFcFu2PeFjguKnco81Ov
 M1ZkKPxNuMphlFPv9YuGrpn1/tmtdDuu6Vb3kJvG3CSNwanDbZpI3+n28hTt/ISmu8F6FXuA
 k/fqMNHPbipOd/+FAJDLgQSceneh+ofnSPf7KppLRyitjN35reOTW5bIwKI1H5GNLJwPY58m
 bUhtcca5haRkB0vNtra3ClY+37Vdi4LUrk9t4FcC4ju01J5xlZHaJ3aKyn3/JDQNIkcbhh0e
 meZ3fOQia5dy0zOd2sIOULMhecN144TvB1qzUMZIwjbkNTymfJqjgZa9i46T1oJw0wfgf5zI
 GViK2Z8Ob6Ko2VznMFGUm2hR1NBCRme9hCjwlcFjjSEHUyhV2iLJ2whI+edukse9jsELDRc+
 biZzkfjUCrrI56tjndjBxY9pqyxV8F1+y3DhNujTpaMEJQNaDb4hrOjODgToBz9DMJt3EDKq
 IGGJgqrhXEX4cLIn5AGNg==
IronPort-HdrOrdr: A9a23:rNghGKilGlUK17eRFnncDfjuh3BQXzx13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmsk6KdxbNhQItKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkDNDSSNykKsS+Z2njBLz9I+rDum8rE9ISurQYccegpUdAa0+4QMHfkLqQcfng+OXNWLu
 v62iIRzADQBkj/I/7LTEUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13zDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3e
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0IXEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4Fi1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqsq+SWnqLEwxg1MfguBFBh8Ib1K7qwk5y4OoOgFt7TBEJxBy/r1aop8CnKhNPaWsqd
 60dZiAr4s+PPP+W5gNc9vpcfHHeVAlfii8RV56AW6XXJ3vaEi94KIe3t0OlZWXkdozvd0PpK
 g=
X-IronPort-AV: E=Sophos;i="5.87,182,1631592000"; 
   d="scan'208";a="56454941"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXXDdjMm1JjEh7tH7WUJGURSX3/a+L9dCondF6FrEevWoheIzpenFQsdIdQO3+hd7kjOUPlcwiJULK9GU8FM0Yn2qAdfFvUy8vrWowc0JwtkSL66OCzUDTA32yMJVK7Lv297Y5APdIkChb4ntx/WrFaX4ha2Mzf7sqs4cWtPVS4TIbFI4uN63GpVXB1hLeEwC3eyo1B15JzZ0GYNI2ImVUL25fcMb0YB4W8TPURoeiIhLvuSAfeHH/bUcL3iw3WaFlGE/6umtv/ormXiJINocVNT9NLNT2bmwYd0lXkfzBRjdGQGOwCuJWPTLJ0UA8cwpkRssai+zTesdyclDeMiHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pKIBBJn7BLOEhhGj5/OC5EWg4ItyB1Vw8Kdm/u2BRo=;
 b=JH/6Sif85RJX1XuiYVLowzI0AhbDudc+522MvCXEXvYXnXvufw9KJZQRjDwR3eo7fIZIXgUReokbF670/erEckkoxe6FFhkNYu1BOMLhc96KveHfD7+ErKsaCUXitXm/KnqYX2fQOO/REZEKN7YoRYmeGItZuPyFwuIaQCXFWKss+0QWGzrkOZON3hqps3ml9OHv1lwi+5vcgOMwcfxVgCAN7bW7vCTQtmvE7pn7H5SnLQovBHv0jQm7QsIu43WbudkCzyxSve5ewhaqnYEkAsYwfVMEZk4EQLH3WXCiQ8W+N0Gfe9fOqPgEfSCwWmc3JSayI9MPosDgTbsPwb0a3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pKIBBJn7BLOEhhGj5/OC5EWg4ItyB1Vw8Kdm/u2BRo=;
 b=d87RPJyNrxu6gYOAwSm38rdCJW4cD3168V9P/ISUr99n/LsSnTKYx6YV657dYWHZQFnprPmkFJYQZp+ZGYtHnffFBDT9eyXO+yN3nl49xHXJ4CpQvwfX6Lxf5OwVy2G2cBCwN2EPnkLl0atczT5p6DlpeMrU8PRTAXz6ns8HOP8=
Date: Tue, 26 Oct 2021 11:08:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v3 06/11] vpci/header: Handle p2m range sets per BAR
Message-ID: <YXfFhZ2/kX15CbLJ@MacBook-Air-de-Roger.local>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-7-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930075223.860329-7-andr2000@gmail.com>
X-ClientProxiedBy: MRXP264CA0032.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c018f0a5-b83e-43d7-363d-08d998602c4d
X-MS-TrafficTypeDiagnostic: DM6PR03MB5354:
X-Microsoft-Antispam-PRVS: <DM6PR03MB535478E932031303144D80C38F849@DM6PR03MB5354.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ubj5jUc9E1J6AIe+QRhuUOI0BWYGFVncGhcfGjY7jszY1QsmxYjCSz55VYpL6cHGzN1Ig9ggKXWdaoRX3f3f4s1lbAFFeUgNFmlMMdwdZ0lPzKJY9IyvBrziDWzn03I+6XAuyPGMDenTuUI0fZ1PsRNGadfc38BnmYqcqzsdO6+MOvEr4KvbnEuRtD1j4PNQORwEwzQpPW8c1QED2wrZ71pJq3wFgvP70ujDMrY5PeC+Rlr9h+jB2Id+ExWJz+y6qXN2KTDZHQa7qg34cxCYBNoIYvkk+1ubyVs0mYBStHReLCQOBcqXeeJ9qdGybJtk16AZCnVMACciLIz7V7EqLguhN/c8NvfSakx8BC45uKfCfFiTSaplYsVU/RcVNcQ5H8qSR5FUo8nsHnpLIurrQCwqz6hYp7lBwm2wqAcmtHwOrm3HoELhrXNZlQ9yNxV6JCwFDJjWbgdB+kpb14ZIaiQoLwDyyMCzIZzguAGyHexw8q62BJNEPRs3aUra9aAIhAohDIovES6Lob37abxUw00Wn6RbOuHRmbBEPQ/o+IsjrGI3WIriMzW86mDOTlBnDy/8Qop2c7+Opua+/QnPsRUVjTA+UUfvnGOzoXNlB3I8zKe0qYl7sJfAkp2AGXku9RpHVySydyPbhEJ2ShScig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(6916009)(66476007)(85182001)(5660300002)(9686003)(956004)(83380400001)(6666004)(186003)(8676002)(82960400001)(508600001)(316002)(66946007)(26005)(86362001)(7416002)(8936002)(4326008)(38100700002)(6496006)(30864003)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGVmT2s0L2JndHpwZjZJMGxUclhPYUZ1b1BWUDdpcW5lbTRtUWNuVFgrZDVx?=
 =?utf-8?B?bGx5bGhvblA0Vk15alNzZkh6UlVTaEZjbHR1RlZHYTNxcnE3em5IZUZsQ2wz?=
 =?utf-8?B?VXMwT1VrUkFpV1pjNVVIaEdodjI0MDBXV1J5SHEvaDNDWE16S1E3Ykl4S21O?=
 =?utf-8?B?L2FYWnJuTkFYa21mUHhHS09VY1hXd1BHNGgyQ3Q4VFR2K28rNjFFUkRIbU9u?=
 =?utf-8?B?TnQwUDIxVDg0QVFZMHM0bEF4OXRTd01mRm9UbGU3RnZLZnhrOHhFbmpHNitO?=
 =?utf-8?B?WTVpTHRkUHF3RWNWOG9ta0J4NWIvM3ErRWRyRFh5TmNPb1BZeWd1ejZtenVa?=
 =?utf-8?B?QUs5T29zTXdNd09GblpjZUJCdkR3L0VZbSttcGxsbG1OVXN0RTB1Rzc5a0pG?=
 =?utf-8?B?bFpoMjROdWJDbndZOVVkK1hKcXhGMDFqcWhOTlIyY25yYXpKUWthcGxpOVdQ?=
 =?utf-8?B?OVZGRzRETEhuTEE5dWVLRjNsWXJldVk2NjFzOWljV1R2OWRXR29XaXB2MGE5?=
 =?utf-8?B?WWg0Zy9PbERLU2o0ajhyOXdPb0oxSkVCVEh4TlhRVHVxbWc2N2RUb0ZZbktY?=
 =?utf-8?B?TjVxeW5SQzhVQm5mNXk4VEFGczV6aUx0amVTQ1p3akhpVm93QkM2TkIxeWN5?=
 =?utf-8?B?R1AvK0lyWUE0dmsyRGdaZE5PTElPbWdIR1QwVzdUdW5QbzExalMwQkpXdGxm?=
 =?utf-8?B?ano5ZHhXRFM5bk5KNmw1aFVnTUVjNXgxQXNsb1k3OS9sdmtxZko5cnd2T05r?=
 =?utf-8?B?WU1RQ09waytBOGhFdjBNamxLekdtQ1RnMUZ2UFRJK0Z3eldmWGU3OEpZdGxl?=
 =?utf-8?B?QW5IanJyZ1NhRnd1TDFlS2QrRThGek5VdVVoMi94eTQ5aysveG5jdlVkQzB2?=
 =?utf-8?B?b0pWb2I2dGNwYU1JQ2JUeHp4S0NlNUVudGcvWHozQnFBUmJ1MkFWQml0UFlv?=
 =?utf-8?B?cXQ4VllDLzhTbUNMMkVPc1RvTERTdVExUnVoTGR4dUNvMnNRNmZ5UERneHRo?=
 =?utf-8?B?eUxsUE5aWW5uWlRVUG44Q0JIdjBHVXhoZ0N6TmNmMkhVS29CczJXT0dqRUpR?=
 =?utf-8?B?cDR6akZnT3Q3b3NSck1mWGpWSml0QTd0VjZtcEFIYjJkazl2NG15dXVxOWw3?=
 =?utf-8?B?NlBRd0pJeVpYOVhTOG5XdFU0aEJ4S1drSXQ4WjgxdHdFb0lXaFNSOWNZSXVE?=
 =?utf-8?B?RDZGaURCcThJQTB4SkNPM1dQZUJiU0gxMnpTUi9WdXJ1MTF0RENQeHlXa09V?=
 =?utf-8?B?cHNLQ0FYRE45T2Y2MkoyU2NhMkpBc09qaDN6R2I4WnRqZzVRTG9yZ3QzWStV?=
 =?utf-8?B?RDh0OUxHZncrTUNVRUhCdi9TdXVvRzgwSTJveWpKK2JpZlZoR2hmQUlYRXBG?=
 =?utf-8?B?aldaZFhyYTJpeXcyUnJLbTE5WTJyU1ZWWVRFdlBWNUZwNVhReFBWZnhJUk1w?=
 =?utf-8?B?NTJPWC9EV3Q2OGdhK0RwUFJkZ3BDdFZnZU41QkNReHg3L1hOejBiZHhzQUZI?=
 =?utf-8?B?LzNTYlV2Nm1ZczJMc3dLRFJ2NW9sUEpxc05XYzJCcEFsL1VWeDNaMzNyeTdP?=
 =?utf-8?B?dGliZnpRbW45Vkd3SzUzMTVnNml3bWhYVzI2V2JETWg4M3FacnNNZXNyT3FB?=
 =?utf-8?B?dTJUK1JEbHhjR29XcUMzOS94UlhQV1JsR2hrU0RBbkZBL2d0NUt6UzlobSs2?=
 =?utf-8?B?elBUWnNLNHFTaXc5Q1N5c1hReVpyUXZ3Mm5DMUNlTkR6TnNiWmQrbUpPcFRl?=
 =?utf-8?B?TkdkUkM3eUQ3NHhTbmxocFZNZFMzRTd2UU9oRjZ1eTR6aGVkSUtUZnFxdVpT?=
 =?utf-8?B?VjcyeFV5b250R0c2SDN1SGF6YlF1UUNMeGRJMDduRkFCdWJEbDVvSmxPQXAw?=
 =?utf-8?B?b00vUHJDRDRweXpjZGtGaGlNSWZtbVVScXFiQzhIR3pjeEFlc2s2L2ZXWm1h?=
 =?utf-8?B?RFlxSTRlVFBINXF0L0F3ZTRacEx2TzFXYTl2bytvc1Vtc2xsbW1CSjdlVUpQ?=
 =?utf-8?B?NDlzdm9teHhmNko0QmxyZEN4alFPYys2UVFtSnlnTktTQndxTkZnc3BmTjA3?=
 =?utf-8?B?THNob2s2TCt0MVgvRGhDb2t4Ny9VZWV5dVVKRHNSMHJhbWQvaGNzMy96c0ZU?=
 =?utf-8?B?c3ovS01PYnIxaXlySVJ5bXRmL3AxNnVQT0d6SjVOaDlJV3pIdTBJWmdGZzVJ?=
 =?utf-8?Q?8ueUD4msHMYdlmynvP+Lzrw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c018f0a5-b83e-43d7-363d-08d998602c4d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 09:08:28.0949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: taU4jOR0Ctc3V3rS4DTPBzYn3298A5ECXf7jGqBZAN7W5FprLnCsC7SzcRUi7wCIjzJDzqrRjt8XQ1HNEg9t4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5354
X-OriginatorOrg: citrix.com

On Thu, Sep 30, 2021 at 10:52:18AM +0300, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Instead of handling a single range set, that contains all the memory
> regions of all the BARs and ROM, have them per BAR.
> 
> This is in preparation of making non-identity mappings in p2m for the
> MMIOs/ROM.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>  xen/drivers/vpci/header.c | 172 ++++++++++++++++++++++++++------------
>  xen/include/xen/vpci.h    |   3 +-
>  2 files changed, 122 insertions(+), 53 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ec4d215f36ff..9c603d26d302 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -131,49 +131,75 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>  
>  bool vpci_process_pending(struct vcpu *v)
>  {
> -    if ( v->vpci.mem )
> +    if ( v->vpci.num_mem_ranges )
>      {
>          struct map_data data = {
>              .d = v->domain,
>              .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
>          };
> -        int rc = rangeset_consume_ranges(v->vpci.mem, map_range, &data);
> +        struct pci_dev *pdev = v->vpci.pdev;
> +        struct vpci_header *header = &pdev->vpci->header;
> +        unsigned int i;
>  
> -        if ( rc == -ERESTART )
> -            return true;
> +        for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +        {
> +            struct vpci_bar *bar = &header->bars[i];
> +            int rc;
>  
> -        spin_lock(&v->vpci.pdev->vpci->lock);
> -        /* Disable memory decoding unconditionally on failure. */
> -        modify_decoding(v->vpci.pdev,
> -                        rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
> -                        !rc && v->vpci.rom_only);
> -        spin_unlock(&v->vpci.pdev->vpci->lock);
> +            if ( !bar->mem )
> +                continue;
>  
> -        rangeset_destroy(v->vpci.mem);
> -        v->vpci.mem = NULL;
> -        if ( rc )
> -            /*
> -             * FIXME: in case of failure remove the device from the domain.
> -             * Note that there might still be leftover mappings. While this is
> -             * safe for Dom0, for DomUs the domain will likely need to be
> -             * killed in order to avoid leaking stale p2m mappings on
> -             * failure.
> -             */
> -            vpci_remove_device(v->vpci.pdev);
> +            rc = rangeset_consume_ranges(bar->mem, map_range, &data);
> +
> +            if ( rc == -ERESTART )
> +                return true;
> +
> +            spin_lock(&pdev->vpci->lock);
> +            /* Disable memory decoding unconditionally on failure. */
> +            modify_decoding(pdev,
> +                            rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
> +                            !rc && v->vpci.rom_only);
> +            spin_unlock(&pdev->vpci->lock);
> +
> +            rangeset_destroy(bar->mem);

Now that the rangesets are per-BAR we might have to consider
allocating them at initialization time and not destroying them when
empty. We could replace the NULL checks with rangeset_is_empty
instead. Not that you have to do this on this patch, but I think it's
worth mentioning.

> +            bar->mem = NULL;
> +            v->vpci.num_mem_ranges--;
> +            if ( rc )
> +                /*
> +                 * FIXME: in case of failure remove the device from the domain.
> +                 * Note that there might still be leftover mappings. While this is
> +                 * safe for Dom0, for DomUs the domain will likely need to be
> +                 * killed in order to avoid leaking stale p2m mappings on
> +                 * failure.
> +                 */
> +                vpci_remove_device(pdev);
> +        }
>      }
>  
>      return false;
>  }
>  
>  static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
> -                            struct rangeset *mem, uint16_t cmd)
> +                            uint16_t cmd)
>  {
>      struct map_data data = { .d = d, .map = true };
> -    int rc;
> +    struct vpci_header *header = &pdev->vpci->header;
> +    int rc = 0;
> +    unsigned int i;
> +
> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +    {
> +        struct vpci_bar *bar = &header->bars[i];
>  
> -    while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
> -        process_pending_softirqs();
> -    rangeset_destroy(mem);
> +        if ( !bar->mem )
> +            continue;
> +
> +        while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
> +                                              &data)) == -ERESTART )
> +            process_pending_softirqs();
> +        rangeset_destroy(bar->mem);
> +        bar->mem = NULL;
> +    }
>      if ( !rc )
>          modify_decoding(pdev, cmd, false);
>  
> @@ -181,7 +207,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>  }
>  
>  static void defer_map(struct domain *d, struct pci_dev *pdev,
> -                      struct rangeset *mem, uint16_t cmd, bool rom_only)
> +                      uint16_t cmd, bool rom_only, uint8_t num_mem_ranges)

Like mentioned below, I don't think you need to pass the number of
BARs that need mapping changes. Iff that's strictly needed, it should
be an unsigned int.

>  {
>      struct vcpu *curr = current;
>  
> @@ -192,9 +218,9 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>       * started for the same device if the domain is not well-behaved.
>       */
>      curr->vpci.pdev = pdev;
> -    curr->vpci.mem = mem;
>      curr->vpci.cmd = cmd;
>      curr->vpci.rom_only = rom_only;
> +    curr->vpci.num_mem_ranges = num_mem_ranges;
>      /*
>       * Raise a scheduler softirq in order to prevent the guest from resuming
>       * execution with pending mapping operations, to trigger the invocation
> @@ -206,42 +232,47 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>  static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>  {
>      struct vpci_header *header = &pdev->vpci->header;
> -    struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>      struct pci_dev *tmp, *dev = NULL;
>      const struct vpci_msix *msix = pdev->vpci->msix;
> -    unsigned int i;
> +    unsigned int i, j;
>      int rc;
> -
> -    if ( !mem )
> -        return -ENOMEM;
> +    uint8_t num_mem_ranges;
>  
>      /*
> -     * Create a rangeset that represents the current device BARs memory region
> +     * Create a rangeset per BAR that represents the current device memory region
>       * and compare it against all the currently active BAR memory regions. If
>       * an overlap is found, subtract it from the region to be mapped/unmapped.
>       *
> -     * First fill the rangeset with all the BARs of this device or with the ROM
> +     * First fill the rangesets with all the BARs of this device or with the ROM
>       * BAR only, depending on whether the guest is toggling the memory decode
>       * bit of the command register, or the enable bit of the ROM BAR register.
>       */
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
> -        const struct vpci_bar *bar = &header->bars[i];
> +        struct vpci_bar *bar = &header->bars[i];
>          unsigned long start = PFN_DOWN(bar->addr);
>          unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
>  
> +        bar->mem = NULL;

Why do you need to set mem to NULL here? I think we should instead
assert that bar->mem == NULL here.

> +
>          if ( !MAPPABLE_BAR(bar) ||
>               (rom_only ? bar->type != VPCI_BAR_ROM
>                         : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) )
>              continue;
>  
> -        rc = rangeset_add_range(mem, start, end);
> +        bar->mem = rangeset_new(NULL, NULL, 0);
> +        if ( !bar->mem )
> +        {
> +            rc = -ENOMEM;
> +            goto fail;
> +        }
> +
> +        rc = rangeset_add_range(bar->mem, start, end);
>          if ( rc )
>          {
>              printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
>                     start, end, rc);
> -            rangeset_destroy(mem);
> -            return rc;
> +            goto fail;
>          }
>      }
>  
> @@ -252,14 +283,21 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>          unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
>                                       vmsix_table_size(pdev->vpci, i) - 1);
>  
> -        rc = rangeset_remove_range(mem, start, end);
> -        if ( rc )
> +        for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
>          {
> -            printk(XENLOG_G_WARNING
> -                   "Failed to remove MSIX table [%lx, %lx]: %d\n",
> -                   start, end, rc);
> -            rangeset_destroy(mem);
> -            return rc;
> +            const struct vpci_bar *bar = &header->bars[j];
> +
> +            if ( !bar->mem )
> +                continue;
> +
> +            rc = rangeset_remove_range(bar->mem, start, end);
> +            if ( rc )
> +            {
> +                printk(XENLOG_G_WARNING
> +                       "Failed to remove MSIX table [%lx, %lx]: %d\n",
> +                       start, end, rc);
> +                goto fail;
> +            }
>          }
>      }
>  
> @@ -291,7 +329,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              unsigned long start = PFN_DOWN(bar->addr);
>              unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
>  
> -            if ( !bar->enabled || !rangeset_overlaps_range(mem, start, end) ||
> +            if ( !bar->enabled ||
> +                 !rangeset_overlaps_range(bar->mem, start, end) ||
>                   /*
>                    * If only the ROM enable bit is toggled check against other
>                    * BARs in the same device for overlaps, but not against the
> @@ -300,13 +339,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>                   (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
>                  continue;
>  
> -            rc = rangeset_remove_range(mem, start, end);
> +            rc = rangeset_remove_range(bar->mem, start, end);
>              if ( rc )
>              {
>                  printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
>                         start, end, rc);
> -                rangeset_destroy(mem);
> -                return rc;
> +                goto fail;
>              }
>          }
>      }
> @@ -324,12 +362,42 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>           * will always be to establish mappings and process all the BARs.
>           */
>          ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
> -        return apply_map(pdev->domain, pdev, mem, cmd);
> +        return apply_map(pdev->domain, pdev, cmd);
>      }
>  
> -    defer_map(dev->domain, dev, mem, cmd, rom_only);
> +    /* Find out how many memory ranges has left after MSI and overlaps. */
> +    num_mem_ranges = 0;
> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +    {
> +        struct vpci_bar *bar = &header->bars[i];

There's no need to declare this local variable AFAICT, just use
header->bars[i].mem. In any case this is likely to go away if you
follow my recommendation below to just call defer_map unconditionally
like it's currently done.

> +
> +        if ( !rangeset_is_empty(bar->mem) )
> +            num_mem_ranges++;
> +    }
> +
> +    /*
> +     * There are cases when PCI device, root port for example, has neither
> +     * memory space nor IO. In this case PCI command register write is
> +     * missed resulting in the underlying PCI device not functional, so:
> +     *   - if there are no regions write the command register now
> +     *   - if there are regions then defer work and write later on
> +     */
> +    if ( !num_mem_ranges )
> +        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);

I think this is wrong, as not calling defer_map will prevent the
rangesets (bar[i]->mem) from being destroyed, so we are effectively
leaking memory.

You need to take a path similar to the failure one in case there are
no mappings pending, or even better just call defer_map anyway and let
it do it's thing, it should be capable of handling empty rangesets
just fine. That's how it's currently done.

> +    else
> +        defer_map(dev->domain, dev, cmd, rom_only, num_mem_ranges);
>  
>      return 0;
> +
> +fail:

We usually ask labels to be indented with one space.

> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> +    {
> +        struct vpci_bar *bar = &header->bars[i];
> +
> +        rangeset_destroy(bar->mem);
> +        bar->mem = NULL;
> +    }
> +    return rc;
>  }
>  
>  static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index a0320b22cb36..352e02d0106d 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -80,6 +80,7 @@ struct vpci {
>              /* Guest view of the BAR. */
>              uint64_t guest_addr;
>              uint64_t size;
> +            struct rangeset *mem;
>              enum {
>                  VPCI_BAR_EMPTY,
>                  VPCI_BAR_IO,
> @@ -154,9 +155,9 @@ struct vpci {
>  
>  struct vpci_vcpu {
>      /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
> -    struct rangeset *mem;
>      struct pci_dev *pdev;
>      uint16_t cmd;
> +    uint8_t num_mem_ranges;

AFAICT This could be a simple bool:

bool map_pending : 1;

As there's no strict need to know how many BARs have pending mappings.

Thanks, Roger.

