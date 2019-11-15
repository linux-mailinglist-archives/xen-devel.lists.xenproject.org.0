Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95C9FE3A7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 18:09:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVf3X-0000m9-Mu; Fri, 15 Nov 2019 17:06:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Up3T=ZH=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1iVf3W-0000m4-6R
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 17:06:46 +0000
X-Inumbo-ID: 4bc96b1c-07ca-11ea-984a-bc764e2007e4
Received: from mout02.posteo.de (unknown [185.67.36.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bc96b1c-07ca-11ea-984a-bc764e2007e4;
 Fri, 15 Nov 2019 17:06:43 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id DF36B2400FC
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 18:06:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1573837601; bh=Pg8SS1TMdQXWof/NoZqEd81cOa1QGy3GASQZ6dmKhdc=;
 h=From:Subject:To:Date:From;
 b=ilPyX2NCDPD6eCEfhyHLpKWngPLBN7KfoyXd35wIs2IzC2649+g4Sie0qb/QqFyz/
 Fc7mBKp1nDWTOi4VgHIHvfXceMtB8WQc2KeXM4lNjbxyMabVpFh4XJ7TeIKncu/G9g
 k+owNCiN4RlWaddhapkiDFiypksE8DQKRqZH18lAItlohfhqb/m2c3Bhc3B4sQfzK+
 avXcRmucmOGhr0CrCgLndxzZkni+DY9ZDMFVzw9ebykz7YFml7ZTN4AWqMjDuLNYFB
 0RUe+KzbS27ZsEFGp86+Zud2DF23oRVajMpcqofnaq+as1o44JFgmA2h2oDuEe1681
 2foo0z/NlfH4A==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 47F4Wg0Ft8z9rxN;
 Fri, 15 Nov 2019 18:06:38 +0100 (CET)
From: Andreas Kinzler <hfp@posteo.de>
To: xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Steven Haigh <netwiz@crc.id.au>, George Dunlap <george.dunlap@citrix.com>
Message-ID: <0e47b56a-4e5d-e815-2e74-eab5da11f3d0@posteo.de>
Date: Fri, 15 Nov 2019 18:06:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------AC78F3A19611CD09BF39677E"
Content-Language: en-US
Subject: [Xen-devel] Ryzen 3xxx works with Windows
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------AC78F3A19611CD09BF39677E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello All,

I compared the CPUID listings from Ryzen 2700X (attached as tar.xz) to 
3700X and found only very few differences. I added

cpuid = [ "0x80000008:ecx=xxxxxxxxxxxxxxxx0100xxxxxxxxxxxx" ]

to xl.cfg and then Windows runs great with 16 vCPUs. Cinebench R15 score 
is >2050 which is more or less the bare metal value.

Regards Andreas

--------------AC78F3A19611CD09BF39677E
Content-Type: application/octet-stream;
 name="cpuid-2700X.tar.xz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="cpuid-2700X.tar.xz"

/Td6WFoAAATm1rRGAgAhARYAAAB0L+Wj51f/GehdADGcCwKp8lquK3uRUwI1x6+ELm9QnlVI
ZGjpyCHWOrTUCkO+Ow1hx52RdlVF9xG6aE4+UxK4RvPPoo6pc87oSEpggTLxuMp7VbF9rHNP
tATePPyfyzKNRb/7DRkVYHlI78uyvNcdnr4iUvJ7ucpqGuLs8Zhk29CHOJFWa1NfB0aNyIoH
0/C5Q/9GHUK+u/3kxahvRB6+0lss1WczOpf3g6dRaOybemKN0FkaKjxWVp3WR3hdD0Y1Uf9S
mUTyN/CbaJBG8xde5gU3I8NA/tYJdx81NxD6MN0X5ssKsnX6YfuSUYFsOfj2AZne1b1VDeBx
efcRQ9bK7B1RP9uazloHYlkg6H9ov1AB/ZFg3qP2rHu48PubCqsvb9YgWa5MAyGyjVEnYSDq
4SKI9zRa7GhBtu8rkvW3RvSob9AHqzJBaHG6noJXwbe0KM0EaPYeIDzkH/Bv7UTtJzUETqEr
BH+y7DywNTZeg/QFBuLdhI8xdA/nHg6zhbLVrXHG933hobKLXxSbWrqx36yM+kkh2BX1MwWm
iyAy7xPAbANwwGAuM/XQh3aGT/Cjx+jmAcqeaoEpGgXI18rd3xoD+GqmxOCb0UiZhIRHsFJa
MfNdbvBv8zBc4xXRagYiCmG1uoikN1x6cC+CFzKdvDrovQjO5ya2iOoyiWsx1+oCOfJi7nc3
qUqfce0TY+FD82/4aKr/ZM+4i+jlL2okpihl5O54ClLTAY7PqKGyghJqKT9U11yCeHAjdUVe
Jj6ndcIbJOND6GIbPg0ISkIeLrvVD80lq0zNt0uAgzF9ZbsWkFQLsmT6d8PW2vXlZH6/l/89
NuI1aATKIQinGOdVMDTmZQFiReZERlxS2WF63RkD2hmOruTqAa68cBMNKzCDsIChOYWqv8ML
yHU8YZMkcvG7RlXOHvU2AFA64gpamfsmCY8H3TgB8U9h9ZIIOb/9V3Q88YOHNIzbjSQK5Ah4
VKeKTxql9X/pYZtsjKSU3raw1shQ/DbAsTKMS5O2nNWeRf5rI5l5X64G84rEcSyfsvVO6M3c
OsD9el1dNTq/tUJvhydXAMH92MIYz2lBOYdv8vcuwMCMs+aWWisSdN9ihbIVDBq8VXCk2x82
lf1KjMyJugFmA0S3SyHyl/KMFyww+sDVPfZY9zM663R7AqlfLVQC4wUVLpUWyoY2pQHXQPY8
3WDm3BAglbNVIVipWejJpL+wzEb18hQyj8jPud1O5/2gUmOpCu1nZDw3BtsJbUYmj2XIoEXs
CSPVeLgrtrctCAj6VUrTDEBIx2hej+7D0hlt3+s+IdaWLYQ3DxGkpkiSRwSPD2aDYjnypXxC
of9J05YmJNjDx0MSXvfMZABwurH2mGY+qC6/LAYbx3UAdWmBiHmF6HIh90HqLVpw3G4nXymL
pOONJkWeW2tRnSQSTO9vHrvwYahaQZichx6zt/QsWqfP22aYZOpVn0zYxzEXieHUb+RdaX7m
REN/Qp1YWZJQiNXkXq+mZjk+zizZasf4OYLrKBIltADc0rXaPURr5iar5THb4k0Xv9OHbMkk
PgXT0MVufIjYRrX6PeNvFEfmQ6dN5nwEqOxTGIRnLcRBuxFW0wy7HzcfYZMr817wEhqj00qC
UDQlK3kiksTNH+2+P85OONQ2hlyjTpa+zw6jQmOSFpLGu1BJIlOxcxBiuoaCeY7/dYmXAOpf
1EvwHtFSirJe6Uhns5Hs5ReieuAJptRgroKwJUuLai+Yct1aQcX8TfrM12wLV4F145midinf
z3owj0eoipgngq2WrbQkiAEa3oGK9Jg+cO8/4OwRa7b52BCqKzQKSNHfMT0kDDtxbpwF1w/m
dqUw+han6qrQX60zzwxGRZUiTdvIKRGR3scaHw8FzDmRqlRjQ+bPGonotP91tHujkDz0DoeY
3+GvDbx4ELFRAaQfKkXCyNMHoTrQpjyPF+U1+WJQ0HEg7O9LCWudar5flSzQcyyAN3dB6pu0
+eiuj3BKUsZnXcFo32A+0tPzXhFbit5WHNDziT+y0TJuImBTsfdp0ahEwVZBxdCsZV4/HbZ8
ZWCm1xCHVQTGOdeDyUNlkk9xfArCNeTRXPPU6WLQzOpoR+lnrfx8CBTsBZzmENSKDyptl0T+
XJwdu0iI9P6N6wrRXqM0vBOyl/m3piqOAa1XvPH0u7cW0x0VzUuxMeAQbtCPxGs7jj1HXI9M
Z5kljGNsS7p6RlCQcwncdmQ7bBnZuh3f+4nJ2QGsTA0NrQAfrIEjejC3Eomw3eJmqtlfkgzf
U/nNrEP1it5WMYA0w7tnIVkScQoiv9MTWhXjAPygBOWIx/dqsNGhSODeaAf3E9f43kKhPRl8
cIr486o8YAF+jC3rRBFt4SCzmhLzfNqBodzM8333Y3qjHrL6ncy8z4SZlSu3G34Gr++kHjBL
GB3HY018cxdbCcjFxgPyZ5miMZRgXeERXDRYFMstfPK4qgl5HiumtbEWXlOAWYoAYbUtTYIb
ACb1fnHBzom218KrVL9HRN7GR5885jrqHCO+EWPzShrSXV4QNxHRDOBCFuj1Gc6DmXTVkyCa
grIYkjIr9klfsJOMHD6E6tp+MkIkOkdtGz2CNB3TtxrO6DE6WHycFtiQ8m+6f50UObuAt603
7gGI+8/mW54rdNf8+rAPj3cWqo0LuyAMYgf4zQQHi5e+npAKymvI+IYmGS7iVFHnza67sGma
zsdNgpiiy5wuMKYfQm/0GefvXtGQx9SAdcbyfOrEgryB0QQc+bXQGHMtQtCctRt81alwahQH
r0dtKeo4CDqTi5UfALbeeuKxsaBnT0wjxoEEU6sWERrJTj2J0E2ClJ7Ba39/rRmfAfmsrhMc
UYaMGFKiELZW2zDz5y9IkyYwkTavVXPoM2lSMKYuC+ir4Eoo54TiXcx5Djw4UQuj/TVbu/zq
H/6hwGX1BXVm7DXqjyxDffDLiQrHvm8Ih8/K9MpiWLn84Rub+XSXolb4homVSOqytCrgfhkc
xE61VP4iYNoqX65bVERU30Ptvn7b5FuHYS4RLGxOkLbstMHHIU7lzAw+QDFLDlAYRZjtjU29
49LRo+OCa0FJkvUbl+FIOgYvzzzoL7uSTnOta1DrBJMN+qZvBL/OEhuJBEevg2K9VlKEU/0U
D4t6ds+gIa2BUIBp+VAyo7x4qA/OAIw/JObwZiaEZtQBSwE2nbjSV3Jdvy7TBI9OgXrpir83
pgP1YydlT3j7N5/wsQQfHVMw9fx0XO5QtnD/pmZGQa0wEfFG9v94IyUSYixE5sKxFQdfAang
vtpZRSFaaRY/3GrqH5LeShf6YTalN8hgA7VTfIxwey+/IpT/oWVtwbj9PIwbvy1wQrQ5O48l
7Ptbe521O4UB2C9KXVRWCWXtLugcmzzK2kBu9trd3dgL6fxvvr8C9tatjPBIUoBP3PdLA2px
1gIrckXutEeTT2hEw51+fZ91ozEoBTsOMyXTSvk1838DYExmA6p15y4uE8sJr/ttrPWFLFbI
I4yIL8XCzEt+Qa0CAXQatolOaSSSyUo2jkW5sHx+89vZOr5YaI7g4lFBFaqkRStEEzJsYJN2
KSiV0peUBbDUz287EHv8NLX0eShwenGe0e+kof7idYbe7PUo8NJtK+RC+GR/9myKd5kOZRo0
UQCuhVMnb2PkuCSrnLf8NSrX8KbqANiFmsLSYrO8NbKlUM2shJYYojKT95243WIC7FsB0Sga
oYucIH1qtuG2XuweAnHBxkAl+IrEynN1CULn5bSaRSTT3pilpBpnHCmw/xYoUwHHM8LMJ1gI
xCpkLMtHikBg6vCfUzXvecuAarFbRbmDA+4QNwvBWYErA1M7noJoO/2BpbDgtj9xEgggAeej
u+7TRULMgqXaBk2ybimEf+wB4j0SN50Ifb3AYvx+/5gh6Oi7NbkxN2/DcGVoASVbYRwF3OrK
5NWIVFQqgDy70A1ilOJraRYjKaPrxsSbmecgHMG3+Gf3TUt2YNVjAhDaR9OYQazdaWSc8Z45
kVKE0PBkGC3jXElk8pHGvi54eW8gX6NdYVh38p4xfC3qvHhpNs0K7HqR8Zh9oPF4PslkqzxD
eFriDl6FtGR4MJ5xEya6qY0UjN0tlyPVWTY6owujUY9RgPf8X9D55eUJB+K2HuZFM+lpbs/d
HYzmOU6tmGAVbDxbgzwPkaAXz+Oq2xNsECl/mhyLHWBo6Bc0yvbhMyUmOuqKa+CJWwSPBTx+
XvEcmE5qxBoIRd9m1NoNGzouxQkiyA6mQaVJL0+A77QcMGiasfyc0pl0QGM0YPOwbLvQ2428
BBybLWA1QHrmqcqyM2QV3vKc1oxkjpoE4IM4qq39MVPjXOx7dsdqCfCGXQ1ClAGw39oc+290
tT5hMSuBuFaqH2s/NW4+//jNQt+nNnT1fnVBB9PRo9Y3AfxIs9oJsGDwo2iK1tUBsb9IUxDX
h27o3d2/FQe3t9WC5bCNP6b932LHYjmKS1PUzCN18FgfKoOaMczxzWtuTBW70+OtxHJ9LPIX
gxShL4T3xMKq8JC+8Ltiu2B8zZG1rumsRzBZLJcK4sdiZN1QxwLzdr1t7vo4sboEohOSqC60
PgI0IJha/7nq01MbwlTzBScXsdpia39UCAftjwxEOVqU0wGLXoGEK0G3RJSOR9G1oCL+Xmbv
CnF1OepEBkHPVRPNdhhic49f7P3vlcyVx98DRlfUPgrE/rKZUNC+7vdw0XrS/7pJnW8+bIMT
iV+2H1ZywmikgqbhsQIoOLdYvclG7KadX8fMv/97XSJkLW0UiKoqxKLHRJgMoycTkh5UShAj
vkUiRlX3fvin6D4s9bXR33v0KKjqF9j06mtOrBSrGYcT0mWeoUu+lwvEdVCPLmyDZAySMroC
trUf4rlzFIXXi70UQQreVaedYXb0mS/5bXAq/FXWQMfNRAIs9sBHDAN3VNPZWYywx+zSmNFA
SxaoLcP6dWbK99V3YAr0Wb9kZGOytF2ExNmhU1moxi/kff3UmxwsO0/g9aFRsr9DSArFTSQK
nKdf/N16l6j+oINv6CK1svTd2RrfZrRE/adG3But9N0fW/bhG3rAUWSEVsha2UvSMNA1bT9m
2yex0k91kGSM5ttFqmcCDkKy286+LTMvncLdjZv6M/7Pn9SqBFR77JA6pGT6JTIBbdFN0YnK
EUWfk6yUQ9ftKzW7dfAfGImm39chAUV/U1F/59qUdkMjpw/C9cCGh8HYW2Gc2HNXydrZZyoB
4J6rKOm7imLncowlCUIirUDRl3WZ+wJsTemqQXblkLF/dxCrugM+tEhkAG+gMbmHo7Hm1xR5
lPG1PI4HG3X37hchhAns3HK/+rcxZPk77yY49auk7m/Tr2k1+Wh7gQBgDw/niyMVEeYlUtGV
A97uaLIqO7l9XzDsmS69wQ0hq3qIbvsD2Qs/Q+SR4WmB89+1ozNgD8w6VmqzrGqNLAiwmGJb
kk64Ox0D/IvN95gB2E33S8QT6PtC57sZkVaX0Uy/Y8G3P7/zCZETRdtq7Mc7S7njCor+l2ZD
FUrklejWLO9U7qGy5I6f6PiXZJYeLIN1QfjQT3LMOHJnW2paDGDYCKzLWCkQSRu67pcWtrw6
V2bFEN5+axkww3Uy4THr3W846hCqPp2o7lXlRIrCF4o3yhvdMmks8bH/RfMJy0UB1iOcZ+tv
xEw3UQzs4X5jioMgWyzz56hJjD+6Pt0pOXcQRT6n/r0WZBmiaO6lhCLOaYcP78/LeL65g34x
MM57k4O/AYn+d3ratvj/AvcxUKfkZATPjzaSfnoyKFGqdEnU8uRnOoKWi8itanhIeo3CZI/v
VEt5N/uvr13QytkZZeQTVujLcwYrTA+l81aVGp16G2cc4QmG1kEeUs0qOQgvYpDpntZDAJbb
WW45+sauiOCg262oi3PWIzXj1gQroxcDsZ3qzkee4Z3q60nBbxNf/i4NJ2DNCe31o2V6+Ci6
ujw5bGoxxqwwEVSHI46D4cD/nwWh5fsHJUuA5l7++Id24cEzjm5Ac+BihgAShB4ST+UhEecb
m6ppigGrIIYt5DGoCVyR2PXi4URjpNwXYU0VqDWWVdXN0Up9bqUmPD9DKoX0dvRvVUwXJbT0
ZtLBW6vcLizr0FQRd0WxCOoqPgcRoL2qygXDrbfvLRcbvzAe+jCxcT8RkPz5OiE5X2+x14YI
32HgpuySD688M+n+29Dy8UgDFm9q3YmLBGeqb1GC/yq1UcFcS/ZcCMLB8/L+fflxv4DepTMA
Rnv4QnA9M1T1hbtqK2dhtZaEkSmFEYDal8XG256BQC/3U3KUeXQM9ILdlRrvlMIrCheRcVOf
BhDlh6EJ7l9kDbJSFIwbNF7Sunw6ZiDJZ/tYCfaWz0Va0jeToRUX/Sr3gE6aY/w2zbn5WPkW
8wxe69jSduXOBXT5Cif70Jrfxr/TWkbshg02HSnm0zFXSPcA6e7u8FMVBUHhxyvYyU9i5Het
LtHy9nexhu1luacsMNEUh/tOivWqM/l1R3xKIUH621ohyLOr8Wr++qhIFkY9mTddTDiy9syo
5TlxNcC+vkX7bwkf6CsK5wGqMMCDQlDV+plU0ycK1p/2nenabAVj9XbYInv6CTPKS0REdSbm
ka4ocr9PmeYT0o8nu6ZUDJjKlFLApfVAB39i57H9xk5TN/j/Bj247wTqlVOtAV2+1+iK7YAV
ea96PhPZs6M0uUuhbce/Q5w1BH2SB7PbeEu9+ZuEAC8qA8SuqNrujd0E7EEHmATIoJp8skh4
yF1Hs++x2zrL6avd12eMXigZgFdXQDAesWFW5czP0nzV+6mi6/UPqm/Bk+w2u8PR4G7fw+uG
HWSYh+6DQhZUkWI1ayHcRDbywkYGbMOx/FGIsgxEHyOo73/c0pGiR6xVHz5VpCeueDY4FZgw
cB8iZmh2iHTJunTnlS0z4N92NWKh69K0Qk+JtVgEhyrJHTmuhSFufefaEVejyLTOgQES7msr
yqD/UQhEeM43uBjSr37u4Cmcq9rpTqTFIQeESY6V1jBvjlbjFX0gLdcvsiiZnysNoa/gyoCs
k7oswglu1IxUgkKZIE63ObdGn77lZ5ZneOtTy2l8UQsWfdmat62uDjEPj9cUsOAzGdM/+9Fq
Cx7ArNDEdZvjSxj+m2kC/DQv50NKdIe2Ttbq8AHp09uRV6NN4SawlShV5T/7USdJexqyDU6a
KCVAU3KgaZ0efryimWkFyPCq9+/9NBzSQLMWOd+5nT2AeeVtlW/t9zQkxkYVpZHx61US/edq
X+sfxPRK7UnWWsMSGOTsgBMnCnKLyPMVawtOAa4J8dTG4C+eYfvYSYB8Kw2ptcMUPTFSfPsH
5vGoyBvXzDA1vZDFKW7tV1HWnOlcF4DX7DFjtzz+DR3DZxiSz7GDKJr8UWGBWi1rwrjnybV4
K6AynW5X4+CFB6Tug8moYX4vaVaeTzxT4uNbejtPAjrHj/DKLSbKzRh/2HpR7VlwjPceWnqv
tHohsg1x0OrGhVMsXfwtu/sSae8vsSx2tl8cS60vV4n5w3xYadm201mGsnDeNNA5wYvE4Pzd
mtQhpc9prHwpYyw27CkwWwHTbF/lT1kdqZlbQlzbwGChPKyThhFcfE5GqM6A0QQMacrD24Xn
5AiYHTPxDsCdxA+LkZoAtkHnNz/3QU4DXU+vEVze3Jibx5xWRHni7/KCAb8DrqtDooHxyhFd
78b36pmQw6ajQ172mZ+XltX0yXL9QYjEPBFFmvQ6br1ruF30L3cqAnlu9r4zajYUICMst6sg
UpZzjpo48UDVSdT2gaDtOOMEJihVNOQruElZM4EIxJdXSvQc4PkwQk6ThX71YVEUwpzeQmxB
EkiuZei5Xk17o/XmSBIPQfQsYvqA7pCrNqimXAyrfteT3vhkWMvCs+CFJioDzmlP78r1IPCw
Hlq+B21FBIPa5T2UDxAX7BnRiWiFlq0GVsGiqwpoJLUwHfyCpPOSW5Uo4XbO6A5/RQfba9E0
oFB5J5tlMXwoiUM+Ej42AS5+WCCTyOw6NKSvwM3lN9ZxDfqIeCB8FT2dhMVHLnWi7Y8pBuru
ujeWiSTiAip7CLV0CtUtFFwxV9Gxm4yj6al8xH3vcmJs41myYTch2Z1bE3mjvGRvjml6jpEn
a5jUdn8XAL0dnSTdo3RPcsbFTBX+NV1dNNX3DBDvP/n1mq+3DResg2zfenKPFhXc1cJ/eig/
kz1PlUO88SoX9DOkCYoXx8DNDQNuBEpQOEoNhO7eVwuf89O8FU4MVYkUQTnAKypFxe6+2q7B
tUxkdCKC30TohmRUor+tr7ZouezvpWNLckLIHg7UEtFbYJa0jFdgWntJmfOWAWkp0P6kRv2A
W5n8u9I9bMXKYZy+8Yjt26askI2JDz/4WGSXhyQlvx0fupZDlqPs0tGiYR0lMugzPfNGWDSa
TdI88GBZ38jgfYoFEl2BOMy5g5UmniLdbi5U3z6istnHIOHAaltHd/j89K/m+51la8qY5DSP
IMJA3q9tOMv/5TSCXsP0V2UGqTZcsj5fZctrVErQi8HW5NiIak9kSwVMuW9fIDQutntSUU6j
boT6hYR/5aR9/Oe/uVVSJcDSL+VYJMzDMz3eUs3d3GY3kzpG+3jmwwoW35t82hduSvlewvo5
RlGpBs15TK742LvoiF5vLxA+Sw8gPi/H4989US4oIdUtMtHYHPYU0kYvJMaOlD8aCZRyhgez
jZ43u4fXDEoW67rE9gtdutDdkP95PyVo0tCRCGVNlfy82wM4MyEYJA6SbXuye0iWpHnAqGKz
vcdIvFVTQHDGt6YIrU9r9p1M5Uf1eSV0gcyT3NtWeyR0ejfdmyH0w95/DlgBPdgN++bZNkA4
0RJYozD273RSQ/Ayhr0AnOQgxmcAAHoNDlCPrxbiAAGENICwHQBiuL7FscRn+wIAAAAABFla

--------------AC78F3A19611CD09BF39677E
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------AC78F3A19611CD09BF39677E--

